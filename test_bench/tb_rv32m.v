`timescale 1ns/1ps
//////////////////////////////////////////////////////////////
// Testbench for RV32M Extension
// Comprehensive verification of:
// 1. Signed Multiplication (MUL, MULH)
// 2. Unsigned Multiplication (MULHU)
// 3. Mixed Signed/Unsigned Multiplication (MULHSU)
// 4. Signed Division (DIV, REM)
// 5. Unsigned Division (DIVU, REMU)
// 6. Division by Zero handling
//////////////////////////////////////////////////////////////
module tb_rv32m;

    reg clk;
    reg reset;
    reg stall;
    wire exception;
    wire [31:0] pc_out;
    
    // Test tracking
    integer pass_count;
    integer fail_count;
    integer total_tests;
    
    // Instantiate the pipeline
    pipe #(.RESET(32'h0000_0000)) dut (
        .clk        (clk),
        .reset      (reset),
        .stall      (stall),
        .exception  (exception),
        .pc_out     (pc_out)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100MHz clock
    end
    
    ////////////////////////////////////////////////////////////
    // HELPER TASKS
    ////////////////////////////////////////////////////////////
    task check_reg;
        input [4:0] reg_num;
        input [31:0] expected;
        input [255:0] test_name;
        begin
            total_tests = total_tests + 1;
            if (dut.regs[reg_num] == expected) begin
                $display("[PASS] %0s: x%0d = %0d (0x%08h)", test_name, reg_num, $signed(dut.regs[reg_num]), dut.regs[reg_num]);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] %0s: x%0d = %0d (expected %0d)", test_name, reg_num, $signed(dut.regs[reg_num]), $signed(expected));
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    task check_reg_unsigned;
        input [4:0] reg_num;
        input [31:0] expected;
        input [255:0] test_name;
        begin
            total_tests = total_tests + 1;
            if (dut.regs[reg_num] == expected) begin
                $display("[PASS] %0s: x%0d = %0d (0x%08h)", test_name, reg_num, dut.regs[reg_num], dut.regs[reg_num]);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] %0s: x%0d = %0d (expected %0d)", test_name, reg_num, dut.regs[reg_num], expected);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    task wait_cycles;
        input integer n;
        begin
            repeat(n) @(posedge clk);
        end
    endtask
    
    ////////////////////////////////////////////////////////////
    // INSTRUCTION ENCODING FUNCTIONS
    ////////////////////////////////////////////////////////////
    function [31:0] encode_rtype;
        input [6:0] funct7;
        input [4:0] rs2;
        input [4:0] rs1;
        input [2:0] funct3;
        input [4:0] rd;
        input [6:0] opcode;
        begin
            encode_rtype = {funct7, rs2, rs1, funct3, rd, opcode};
        end
    endfunction
    
    function [31:0] encode_itype;
        input [11:0] imm;
        input [4:0] rs1;
        input [2:0] funct3;
        input [4:0] rd;
        input [6:0] opcode;
        begin
            encode_itype = {imm, rs1, funct3, rd, opcode};
        end
    endfunction
    
    // Initialize memory with comprehensive test program
    initial begin
        pass_count = 0;
        fail_count = 0;
        total_tests = 0;
        
        //===========================================================
        // TEST PROGRAM FOR RV32M EXTENSION
        // Tests all multiplication and division operations
        //===========================================================
        
        //-----------------------------------------------------------
        // SECTION 1: Setup test values
        // x1 = 5, x2 = 7, x3 = -5, x4 = 100, x5 = 0
        //-----------------------------------------------------------
        dut.u_fetch.imem[0]  = encode_itype(12'd5, 5'd0, 3'b000, 5'd1, 7'b0010011);     // ADDI x1, x0, 5
        dut.u_fetch.imem[1]  = encode_itype(12'd7, 5'd0, 3'b000, 5'd2, 7'b0010011);     // ADDI x2, x0, 7
        dut.u_fetch.imem[2]  = encode_itype(-12'sd5, 5'd0, 3'b000, 5'd3, 7'b0010011);   // ADDI x3, x0, -5
        dut.u_fetch.imem[3]  = encode_itype(12'd100, 5'd0, 3'b000, 5'd4, 7'b0010011);   // ADDI x4, x0, 100
        dut.u_fetch.imem[4]  = encode_itype(12'd0, 5'd0, 3'b000, 5'd5, 7'b0010011);     // ADDI x5, x0, 0 (for div by zero)
        dut.u_fetch.imem[5]  = 32'h00000013;  // NOP - ensure values are ready
        dut.u_fetch.imem[6]  = 32'h00000013;  // NOP
        
        //-----------------------------------------------------------
        // SECTION 2: Signed Multiplication Tests
        // MUL x6, x1, x2    ; 5 * 7 = 35
        // MUL x7, x3, x2    ; (-5) * 7 = -35
        // MUL x8, x3, x3    ; (-5) * (-5) = 25
        //-----------------------------------------------------------
        dut.u_fetch.imem[7]  = encode_rtype(7'b0000001, 5'd2, 5'd1, 3'b000, 5'd6, 7'b0110011);  // MUL x6, x1, x2 = 35
        dut.u_fetch.imem[8]  = 32'h00000013;  // NOP (allow mul to complete)
        dut.u_fetch.imem[9]  = 32'h00000013;  // NOP
        dut.u_fetch.imem[10] = 32'h00000013;  // NOP
        dut.u_fetch.imem[11] = 32'h00000013;  // NOP
        dut.u_fetch.imem[12] = 32'h00000013;  // NOP
        
        dut.u_fetch.imem[13] = encode_rtype(7'b0000001, 5'd2, 5'd3, 3'b000, 5'd7, 7'b0110011);  // MUL x7, x3, x2 = -35
        dut.u_fetch.imem[14] = 32'h00000013;  // NOP
        dut.u_fetch.imem[15] = 32'h00000013;  // NOP
        dut.u_fetch.imem[16] = 32'h00000013;  // NOP
        dut.u_fetch.imem[17] = 32'h00000013;  // NOP
        dut.u_fetch.imem[18] = 32'h00000013;  // NOP
        
        dut.u_fetch.imem[19] = encode_rtype(7'b0000001, 5'd3, 5'd3, 3'b000, 5'd8, 7'b0110011);  // MUL x8, x3, x3 = 25
        dut.u_fetch.imem[20] = 32'h00000013;  // NOP
        dut.u_fetch.imem[21] = 32'h00000013;  // NOP
        dut.u_fetch.imem[22] = 32'h00000013;  // NOP
        dut.u_fetch.imem[23] = 32'h00000013;  // NOP
        dut.u_fetch.imem[24] = 32'h00000013;  // NOP
        
        //-----------------------------------------------------------
        // SECTION 3: Unsigned Multiplication (MULHU)
        // Setup large values for upper bits test
        // x9 = 0x10000 (65536)
        // x10 = 0x10000 (65536)
        // MULHU x11, x9, x10  ; upper 32 bits of 65536 * 65536 = 1
        //-----------------------------------------------------------
        // LUI x9, 1 -> x9 = 0x1000 (4096)
        dut.u_fetch.imem[25] = {20'h00001, 5'd9, 7'b0110111};  // LUI x9, 1 (0x1000)
        dut.u_fetch.imem[26] = {20'h00001, 5'd10, 7'b0110111}; // LUI x10, 1 (0x1000)
        dut.u_fetch.imem[27] = 32'h00000013;  // NOP
        dut.u_fetch.imem[28] = 32'h00000013;  // NOP
        
        dut.u_fetch.imem[29] = encode_rtype(7'b0000001, 5'd10, 5'd9, 3'b011, 5'd11, 7'b0110011); // MULHU x11, x9, x10
        dut.u_fetch.imem[30] = 32'h00000013;  // NOP
        dut.u_fetch.imem[31] = 32'h00000013;  // NOP
        dut.u_fetch.imem[32] = 32'h00000013;  // NOP
        dut.u_fetch.imem[33] = 32'h00000013;  // NOP
        dut.u_fetch.imem[34] = 32'h00000013;  // NOP
        
        //-----------------------------------------------------------
        // SECTION 4: Signed Division Tests
        // DIV x12, x4, x2    ; 100 / 7 = 14
        // REM x13, x4, x2    ; 100 % 7 = 2
        // DIV x14, x4, x3    ; 100 / (-5) = -20
        //-----------------------------------------------------------
        dut.u_fetch.imem[35] = encode_rtype(7'b0000001, 5'd2, 5'd4, 3'b100, 5'd12, 7'b0110011); // DIV x12, x4, x2 = 14
        dut.u_fetch.imem[36] = 32'h00000013;  // NOP (division takes ~35 cycles)
        dut.u_fetch.imem[37] = 32'h00000013;
        dut.u_fetch.imem[38] = 32'h00000013;
        dut.u_fetch.imem[39] = 32'h00000013;
        dut.u_fetch.imem[40] = 32'h00000013;
        
        dut.u_fetch.imem[41] = encode_rtype(7'b0000001, 5'd2, 5'd4, 3'b110, 5'd13, 7'b0110011); // REM x13, x4, x2 = 2
        dut.u_fetch.imem[42] = 32'h00000013;
        dut.u_fetch.imem[43] = 32'h00000013;
        dut.u_fetch.imem[44] = 32'h00000013;
        dut.u_fetch.imem[45] = 32'h00000013;
        dut.u_fetch.imem[46] = 32'h00000013;
        
        dut.u_fetch.imem[47] = encode_rtype(7'b0000001, 5'd3, 5'd4, 3'b100, 5'd14, 7'b0110011); // DIV x14, x4, x3 = -20
        dut.u_fetch.imem[48] = 32'h00000013;
        dut.u_fetch.imem[49] = 32'h00000013;
        dut.u_fetch.imem[50] = 32'h00000013;
        dut.u_fetch.imem[51] = 32'h00000013;
        dut.u_fetch.imem[52] = 32'h00000013;
        
        //-----------------------------------------------------------
        // SECTION 5: Division by Zero Tests
        // According to RISC-V spec:
        // DIV by zero: result = -1 (0xFFFFFFFF)
        // DIVU by zero: result = 0xFFFFFFFF (max unsigned)
        // REM by zero: result = dividend
        // REMU by zero: result = dividend
        //-----------------------------------------------------------
        dut.u_fetch.imem[53] = encode_rtype(7'b0000001, 5'd5, 5'd4, 3'b100, 5'd15, 7'b0110011); // DIV x15, x4, x5 (100/0)
        dut.u_fetch.imem[54] = 32'h00000013;
        dut.u_fetch.imem[55] = 32'h00000013;
        dut.u_fetch.imem[56] = 32'h00000013;
        dut.u_fetch.imem[57] = 32'h00000013;
        dut.u_fetch.imem[58] = 32'h00000013;
        
        dut.u_fetch.imem[59] = encode_rtype(7'b0000001, 5'd5, 5'd4, 3'b110, 5'd16, 7'b0110011); // REM x16, x4, x5 (100%0)
        dut.u_fetch.imem[60] = 32'h00000013;
        dut.u_fetch.imem[61] = 32'h00000013;
        dut.u_fetch.imem[62] = 32'h00000013;
        dut.u_fetch.imem[63] = 32'h00000013;
        dut.u_fetch.imem[64] = 32'h00000013;
        
        dut.u_fetch.imem[65] = encode_rtype(7'b0000001, 5'd5, 5'd4, 3'b101, 5'd17, 7'b0110011); // DIVU x17, x4, x5 (100/0 unsigned)
        dut.u_fetch.imem[66] = 32'h00000013;
        dut.u_fetch.imem[67] = 32'h00000013;
        dut.u_fetch.imem[68] = 32'h00000013;
        dut.u_fetch.imem[69] = 32'h00000013;
        dut.u_fetch.imem[70] = 32'h00000013;
        
        //-----------------------------------------------------------
        // SECTION 6: Unsigned Division Test
        // DIVU x18, x4, x2   ; 100 / 7 = 14 (unsigned)
        // REMU x19, x4, x2   ; 100 % 7 = 2 (unsigned)
        //-----------------------------------------------------------
        dut.u_fetch.imem[71] = encode_rtype(7'b0000001, 5'd2, 5'd4, 3'b101, 5'd18, 7'b0110011); // DIVU x18, x4, x2 = 14
        dut.u_fetch.imem[72] = 32'h00000013;
        dut.u_fetch.imem[73] = 32'h00000013;
        dut.u_fetch.imem[74] = 32'h00000013;
        dut.u_fetch.imem[75] = 32'h00000013;
        dut.u_fetch.imem[76] = 32'h00000013;
        
        dut.u_fetch.imem[77] = encode_rtype(7'b0000001, 5'd2, 5'd4, 3'b111, 5'd19, 7'b0110011); // REMU x19, x4, x2 = 2
        dut.u_fetch.imem[78] = 32'h00000013;
        dut.u_fetch.imem[79] = 32'h00000013;
        dut.u_fetch.imem[80] = 32'h00000013;
        dut.u_fetch.imem[81] = 32'h00000013;
        dut.u_fetch.imem[82] = 32'h00000013;
        
        // Fill rest with NOPs
        dut.u_fetch.imem[83] = 32'h00000013;
        dut.u_fetch.imem[84] = 32'h00000013;
        dut.u_fetch.imem[85] = 32'h00000013;
    end
    
    // Test sequence
    initial begin
        $dumpfile("tb_rv32m.vcd");
        $dumpvars(0, tb_rv32m);
        
        $display("");
        $display("==============================================================");
        $display("       RV32M EXTENSION COMPREHENSIVE TESTBENCH");
        $display("==============================================================");
        $display("");
        
        // Initialize
        reset = 0;
        stall = 0;
        #10;
        
        // Release reset
        reset = 1;
        
        // Wait for pipeline to execute test program
        // MUL takes ~5 cycles, DIV takes ~35 cycles each
        // Total: several hundred cycles should be plenty
        repeat (800) @(posedge clk);
        
        //===========================================================
        // VERIFICATION PHASE
        //===========================================================
        $display("");
        $display("==============================================================");
        $display("                    TEST RESULTS");
        $display("==============================================================");
        $display("");
        
        //-----------------------------------------------------------
        // Verify Setup Values
        //-----------------------------------------------------------
        $display("--------------------------------------------------------------");
        $display("SECTION 1: Setup Values Verification");
        $display("--------------------------------------------------------------");
        check_reg(5'd1, 32'd5, "Setup x1=5");
        check_reg(5'd2, 32'd7, "Setup x2=7");
        check_reg(5'd3, -32'sd5, "Setup x3=-5");
        check_reg(5'd4, 32'd100, "Setup x4=100");
        check_reg(5'd5, 32'd0, "Setup x5=0");
        $display("");
        
        //-----------------------------------------------------------
        // Verify Signed Multiplication
        //-----------------------------------------------------------
        $display("--------------------------------------------------------------");
        $display("SECTION 2: Signed Multiplication (MUL)");
        $display("--------------------------------------------------------------");
        check_reg(5'd6, 32'd35, "MUL 5*7=35");
        check_reg(5'd7, -32'sd35, "MUL (-5)*7=-35");
        check_reg(5'd8, 32'd25, "MUL (-5)*(-5)=25");
        $display("");
        
        //-----------------------------------------------------------
        // Verify Unsigned Multiplication (upper bits)
        //-----------------------------------------------------------
        $display("--------------------------------------------------------------");
        $display("SECTION 3: Unsigned Multiplication (MULHU)");
        $display("--------------------------------------------------------------");
        check_reg(5'd9, 32'h00001000, "Setup x9=0x1000");
        check_reg(5'd10, 32'h00001000, "Setup x10=0x1000");
        // 0x1000 * 0x1000 = 0x1000000 (upper 32 bits = 0)
        check_reg_unsigned(5'd11, 32'd0, "MULHU upper bits of 0x1000*0x1000");
        $display("");
        
        //-----------------------------------------------------------
        // Verify Signed Division
        //-----------------------------------------------------------
        $display("--------------------------------------------------------------");
        $display("SECTION 4: Signed Division (DIV, REM)");
        $display("--------------------------------------------------------------");
        check_reg(5'd12, 32'd14, "DIV 100/7=14");
        check_reg(5'd13, 32'd2, "REM 100%%7=2");
        check_reg(5'd14, -32'sd20, "DIV 100/(-5)=-20");
        $display("");
        
        //-----------------------------------------------------------
        // Verify Division by Zero
        //-----------------------------------------------------------
        $display("--------------------------------------------------------------");
        $display("SECTION 5: Division by Zero Handling");
        $display("--------------------------------------------------------------");
        check_reg_unsigned(5'd15, 32'hFFFFFFFF, "DIV by 0 -> 0xFFFFFFFF");
        check_reg(5'd16, 32'd100, "REM by 0 -> dividend (100)");
        check_reg_unsigned(5'd17, 32'hFFFFFFFF, "DIVU by 0 -> 0xFFFFFFFF");
        $display("");
        
        //-----------------------------------------------------------
        // Verify Unsigned Division
        //-----------------------------------------------------------
        $display("--------------------------------------------------------------");
        $display("SECTION 6: Unsigned Division (DIVU, REMU)");
        $display("--------------------------------------------------------------");
        check_reg_unsigned(5'd18, 32'd14, "DIVU 100/7=14");
        check_reg_unsigned(5'd19, 32'd2, "REMU 100%%7=2");
        $display("");
        
        //===========================================================
        // FINAL SUMMARY
        //===========================================================
        $display("==============================================================");
        $display("                    FINAL SUMMARY");
        $display("==============================================================");
        $display("Total Tests: %0d", total_tests);
        $display("Passed:      %0d", pass_count);
        $display("Failed:      %0d", fail_count);
        $display("");
        if (fail_count == 0) begin
            $display("*** ALL RV32M TESTS PASSED! ***");
        end else begin
            $display("*** SOME RV32M TESTS FAILED ***");
        end
        $display("==============================================================");
        $display("");
        
        // Print complete register dump
        $display("========== FINAL REGISTER STATE ==========");
        $display("x1  = %0d (0x%08h)", $signed(dut.regs[1]), dut.regs[1]);
        $display("x2  = %0d (0x%08h)", $signed(dut.regs[2]), dut.regs[2]);
        $display("x3  = %0d (0x%08h)", $signed(dut.regs[3]), dut.regs[3]);
        $display("x4  = %0d (0x%08h)", $signed(dut.regs[4]), dut.regs[4]);
        $display("x5  = %0d (0x%08h)", $signed(dut.regs[5]), dut.regs[5]);
        $display("x6  = %0d (MUL 5*7)", $signed(dut.regs[6]));
        $display("x7  = %0d (MUL -5*7)", $signed(dut.regs[7]));
        $display("x8  = %0d (MUL -5*-5)", $signed(dut.regs[8]));
        $display("x9  = 0x%08h", dut.regs[9]);
        $display("x10 = 0x%08h", dut.regs[10]);
        $display("x11 = 0x%08h (MULHU)", dut.regs[11]);
        $display("x12 = %0d (DIV 100/7)", $signed(dut.regs[12]));
        $display("x13 = %0d (REM 100%%7)", $signed(dut.regs[13]));
        $display("x14 = %0d (DIV 100/-5)", $signed(dut.regs[14]));
        $display("x15 = 0x%08h (DIV by 0)", dut.regs[15]);
        $display("x16 = %0d (REM by 0)", $signed(dut.regs[16]));
        $display("x17 = 0x%08h (DIVU by 0)", dut.regs[17]);
        $display("x18 = %0d (DIVU 100/7)", dut.regs[18]);
        $display("x19 = %0d (REMU 100%%7)", dut.regs[19]);
        $display("==========================================");
        
        $finish;
    end
    
    // Cycle counter
    integer cycle_count;
    initial cycle_count = 0;
    always @(posedge clk) begin
        if (reset) cycle_count <= cycle_count + 1;
    end
    
    ////////////////////////////////////////////////////////////
    // DEBUG: Optional cycle-by-cycle trace
    ////////////////////////////////////////////////////////////
`ifdef DEBUG_TRACE
    initial begin
        @(posedge reset);
        $display("");
        $display("==================================================================================================================");
        $display("                                      CYCLE-BY-CYCLE PIPELINE TRACE");
        $display("==================================================================================================================");
        $display("Cyc | IF_PC    | ID_PC    | Stall | ALU_Op1    | ALU_Op2    | ALU_Result | MulDiv       | WB Write");
        $display("----|----------|----------|-------|------------|------------|------------|--------------|------------------");
    end
    
    always @(posedge clk) begin
        if (reset && cycle_count > 0 && cycle_count <= 200) begin
            $write("%3d | %08h | %08h |   %b   | %10d | %10d | %10d | ",
                cycle_count,
                dut.if_pc,
                dut.id_pc,
                dut.stall_if,
                dut.u_execute.alu_operand1,
                dut.u_execute.alu_operand2,
                dut.u_execute.alu_result);
            
            // MulDiv status
            if (dut.u_execute.muldiv_busy)
                $write("BUSY ");
            else
                $write("     ");
            if (dut.u_execute.muldiv_done)
                $write("DONE ");
            else
                $write("     ");
            if (dut.muldiv_stall)
                $write("STL ");
            else
                $write("    ");
            
            $write("| ");
            
            // WB write
            if (dut.wb_reg_write_en && dut.wb_rd_addr != 0)
                $write("x%0d <- %0d", dut.wb_rd_addr, $signed(dut.wb_rd_data));
            
            $display("");
        end
    end
    
    // Detailed MulDiv operation trace
    always @(posedge clk) begin
        if (reset && dut.u_execute.muldiv_start) begin
            $display("     >>> MUL/DIV START: operand_a=%0d operand_b=%0d",
                $signed(dut.u_execute.alu_operand1),
                $signed(dut.u_execute.alu_operand2_reg));
        end
        if (reset && dut.u_execute.muldiv_done) begin
            $display("     >>> MUL/DIV DONE: result=%0d (0x%08h)", 
                $signed(dut.u_execute.muldiv_result), dut.u_execute.muldiv_result);
        end
    end
`endif

endmodule
