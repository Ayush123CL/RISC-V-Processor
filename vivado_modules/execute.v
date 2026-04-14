`timescale 1ns/1ps
//////////////////////////////////////////////////////////////
// Stage 3: Execute (EX)
// Includes RV32M Multiply/Divide Unit
//////////////////////////////////////////////////////////////

`include "mul_div.v"

module execute
#(
    parameter [31:0] RESET = 32'h0000_0000
)
(
    input               clk,
    input               reset,
    
    // Pipeline control
    input               stall,
    input               flush,
    
    // From ID/EX register
    input  [31:0]       pc_in,
    input  [31:0]       pc_plus4_in,
    input  [31:0]       rs1_data_in,
    input  [31:0]       rs2_data_in,
    input  [31:0]       immediate_in,
    input  [4:0]        rs1_addr_in,
    input  [4:0]        rs2_addr_in,
    input  [4:0]        rd_addr_in,
    input  [2:0]        funct3_in,
    input               funct7_bit5_in,
    
    // Control signals from ID/EX
    input               alu_src_in,
    input               mem_write_in,
    input               mem_read_in,
    input               mem_to_reg_in,
    input               reg_write_in,
    input               branch_in,
    input               jal_in,
    input               jalr_in,
    input               lui_in,
    input               auipc_in,
    input               is_muldiv_in,           // RV32M instruction
    input               is_mul_in,              // 1 = multiply, 0 = divide
    input               valid_in,
    
    // Forwarding inputs
    input  [31:0]       forward_ex_mem_data,    // From EX/MEM stage
    input  [31:0]       forward_mem_wb_data,    // From MEM/WB stage
    input  [1:0]        forward_a,              // Forwarding control for rs1
    input  [1:0]        forward_b,              // Forwarding control for rs2
    
    // Branch/Jump outputs (to IF stage and hazard unit)
    output              branch_taken,
    output [31:0]       branch_target,
    
    // Mul/Div stall output (to hazard unit)
    output              muldiv_stall,
    
    // Outputs to EX/MEM register
    output reg [31:0]   pc_plus4_out,
    output reg [31:0]   alu_result_out,
    output reg [31:0]   rs2_data_out,           // For store instructions
    output reg [4:0]    rd_addr_out,
    output reg [2:0]    funct3_out,
    
    // Control signals to EX/MEM
    output reg          mem_write_out,
    output reg          mem_read_out,
    output reg          mem_to_reg_out,
    output reg          reg_write_out,
    output reg          valid_out,
    
    // For forwarding unit (expose current rs addresses)
    output [4:0]        rs1_addr_out,
    output [4:0]        rs2_addr_out
);

`include "opcode.vh"

//////////////////////////////////////////////////////////////
// Forwarding Muxes (must be declared first for mul_div)
//////////////////////////////////////////////////////////////
reg [31:0] alu_operand1;
reg [31:0] alu_operand2_reg;  // Register value (possibly forwarded)
wire [31:0] alu_operand2;

// Forwarding mux for operand 1 (rs1)
always @(*) begin
    case (forward_a)
        2'b00:   alu_operand1 = rs1_data_in;        // No forwarding
        2'b01:   alu_operand1 = forward_mem_wb_data; // Forward from MEM/WB
        2'b10:   alu_operand1 = forward_ex_mem_data; // Forward from EX/MEM
        default: alu_operand1 = rs1_data_in;
    endcase
end

// Forwarding mux for operand 2 (rs2 or immediate)
always @(*) begin
    case (forward_b)
        2'b00:   alu_operand2_reg = rs2_data_in;        // No forwarding
        2'b01:   alu_operand2_reg = forward_mem_wb_data; // Forward from MEM/WB
        2'b10:   alu_operand2_reg = forward_ex_mem_data; // Forward from EX/MEM
        default: alu_operand2_reg = rs2_data_in;
    endcase
end

// ALU source mux (rs2 or immediate)
assign alu_operand2 = alu_src_in ? immediate_in : alu_operand2_reg;

// Pass through addresses for forwarding unit
assign rs1_addr_out = rs1_addr_in;
assign rs2_addr_out = rs2_addr_in;

//////////////////////////////////////////////////////////////
// Multiply/Divide Unit
//////////////////////////////////////////////////////////////
wire [31:0] muldiv_result;
wire        muldiv_busy;
wire        muldiv_done;
reg         muldiv_in_progress;  // Track if we've started and not yet advanced

// Start mul/div when:
// 1. It's a mul/div instruction that's valid  
// 2. The unit is not busy and didn't just finish (done is low)
// 3. We haven't already started this instruction
wire muldiv_start = is_muldiv_in && valid_in && !muldiv_busy && !muldiv_done && !muldiv_in_progress;

// Stall pipeline while:
// 1. mul/div is busy, OR
// 2. We just started (muldiv_start), OR  
// 3. We're in progress waiting for done
assign muldiv_stall = muldiv_busy || muldiv_start || (muldiv_in_progress && !muldiv_done);

mul_div u_mul_div (
    .clk        (clk),
    .reset      (reset),
    .start      (muldiv_start),
    .is_mul     (is_mul_in),
    .funct3     (funct3_in),
    .operand_a  (alu_operand1),
    .operand_b  (alu_operand2_reg),
    .result     (muldiv_result),
    .busy       (muldiv_busy),
    .done       (muldiv_done)
);

//////////////////////////////////////////////////////////////
// ALU
//////////////////////////////////////////////////////////////
reg [31:0] alu_result;
wire [32:0] sub_result_signed;
wire [32:0] sub_result_unsigned;

// Subtraction results for comparisons
assign sub_result_signed   = {alu_operand1[31], alu_operand1} - {alu_operand2[31], alu_operand2};
assign sub_result_unsigned = {1'b0, alu_operand1} - {1'b0, alu_operand2};

// Subtype selection: SUB vs ADD, SRA vs SRL
wire is_sub_or_sra = funct7_bit5_in && !alu_src_in;  // Only for R-type (not immediate)

always @(*) begin
    alu_result = 32'h0;
    
    if (is_muldiv_in) begin
        // Use result from mul/div unit
        alu_result = muldiv_result;
    end
    else if (lui_in) begin
        alu_result = immediate_in;
    end
    else if (auipc_in) begin
        alu_result = pc_in + immediate_in;
    end
    else if (jal_in || jalr_in) begin
        alu_result = pc_plus4_in;  // Return address
    end
    else if (mem_read_in || mem_write_in) begin
        // Load/store effective address = rs1 + immediate
        alu_result = alu_operand1 + alu_operand2;
    end
    else begin
        // Standard ALU operations
        case (funct3_in)
            ADD: begin
                if (is_sub_or_sra)
                    alu_result = alu_operand1 - alu_operand2;
                else
                    alu_result = alu_operand1 + alu_operand2;
            end
            
            SLL: begin
                alu_result = alu_operand1 << alu_operand2[4:0];
            end
            
            SLT: begin
                alu_result = {31'b0, sub_result_signed[32]};  // Signed comparison
            end
            
            SLTU: begin
                alu_result = {31'b0, sub_result_unsigned[32]};  // Unsigned comparison
            end
            
            XOR: begin
                alu_result = alu_operand1 ^ alu_operand2;
            end
            
            SR: begin
                if (funct7_bit5_in)
                    alu_result = $signed(alu_operand1) >>> alu_operand2[4:0];  // SRA
                else
                    alu_result = alu_operand1 >> alu_operand2[4:0];  // SRL
            end
            
            OR: begin
                alu_result = alu_operand1 | alu_operand2;
            end
            
            AND: begin
                alu_result = alu_operand1 & alu_operand2;
            end
            
            default: alu_result = 32'h0;
        endcase
    end
end

//////////////////////////////////////////////////////////////
// Branch/Jump Logic
//////////////////////////////////////////////////////////////
reg branch_condition;

always @(*) begin
    branch_condition = 1'b0;
    
    if (branch_in) begin
        case (funct3_in)
            BEQ:  branch_condition = (sub_result_signed == 0);
            BNE:  branch_condition = (sub_result_signed != 0);
            BLT:  branch_condition = sub_result_signed[32];        // Signed less than
            BGE:  branch_condition = !sub_result_signed[32];       // Signed greater or equal
            BLTU: branch_condition = sub_result_unsigned[32];      // Unsigned less than
            BGEU: branch_condition = !sub_result_unsigned[32];     // Unsigned greater or equal
            default: branch_condition = 1'b0;
        endcase
    end
end

// Branch taken signal (only when not stalled by muldiv)
assign branch_taken = valid_in && !muldiv_stall && ((branch_in && branch_condition) || jal_in || jalr_in);

// Branch target calculation
assign branch_target = jalr_in ? (alu_operand1 + immediate_in) & 32'hFFFFFFFE  // JALR: rs1 + imm, clear LSB
                              : pc_in + immediate_in;  // JAL/Branch: PC + imm

//////////////////////////////////////////////////////////////
// EX/MEM Pipeline Register
// Only update when:
// 1. Not stalled externally
// 2. Not waiting for mul/div (unless mul/div just completed)
//////////////////////////////////////////////////////////////
wire ex_can_advance = !stall && (!muldiv_stall || muldiv_done);

// Clear muldiv_in_progress when EX stage advances
always @(posedge clk or negedge reset) begin
    if (!reset) begin
        muldiv_in_progress <= 1'b0;
    end else if (flush) begin
        muldiv_in_progress <= 1'b0;
    end else if (ex_can_advance && muldiv_in_progress) begin
        // EX stage is advancing with the muldiv result, clear flag
        muldiv_in_progress <= 1'b0;
    end else if (muldiv_start) begin
        // Starting a new mul/div operation
        muldiv_in_progress <= 1'b1;
    end
end

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        pc_plus4_out    <= 32'h0;
        alu_result_out  <= 32'h0;
        rs2_data_out    <= 32'h0;
        rd_addr_out     <= 5'h0;
        funct3_out      <= 3'h0;
        mem_write_out   <= 1'b0;
        mem_read_out    <= 1'b0;
        mem_to_reg_out  <= 1'b0;
        reg_write_out   <= 1'b0;
        valid_out       <= 1'b0;
    end
    else if (flush && !muldiv_busy) begin
        // Insert bubble on flush (but not if mul/div is busy)
        pc_plus4_out    <= 32'h0;
        alu_result_out  <= 32'h0;
        rs2_data_out    <= 32'h0;
        rd_addr_out     <= 5'h0;
        funct3_out      <= 3'h0;
        mem_write_out   <= 1'b0;
        mem_read_out    <= 1'b0;
        mem_to_reg_out  <= 1'b0;
        reg_write_out   <= 1'b0;
        valid_out       <= 1'b0;
    end
    else if (ex_can_advance) begin
        pc_plus4_out    <= pc_plus4_in;
        alu_result_out  <= alu_result;
        rs2_data_out    <= alu_operand2_reg;  // Forwarded rs2 value for stores
        rd_addr_out     <= rd_addr_in;
        funct3_out      <= funct3_in;
        mem_write_out   <= mem_write_in;
        mem_read_out    <= mem_read_in;
        mem_to_reg_out  <= mem_to_reg_in;
        reg_write_out   <= reg_write_in;
        valid_out       <= valid_in;
    end
    // If muldiv_stall and not done, hold current output values (bubble in EX/MEM)
    else if (muldiv_stall && !muldiv_done) begin
        // Insert bubble - keep EX/MEM from propagating incomplete results
        mem_write_out   <= 1'b0;
        mem_read_out    <= 1'b0;
        reg_write_out   <= 1'b0;
        valid_out       <= 1'b0;
    end
end

endmodule
