`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////
// Testbench for 5-Stage RISC-V Pipeline
// Comprehensive verification of:
// 1. Load-use hazards with stall/forwarding
// 2. Data forwarding (EX/MEM, MEM/WB)
// 3. Branch instructions (taken and not-taken)
// 4. Store instructions with memory verification
//////////////////////////////////////////////////////////////
module tb_pipeline;

////////////////////////////////////////////////////////////
// CLOCK & RESET
////////////////////////////////////////////////////////////
reg clk;
reg reset;

// 100 MHz clock (10ns period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

////////////////////////////////////////////////////////////
// DUT: 5-Stage Pipeline CPU
////////////////////////////////////////////////////////////
wire exception;
wire [31:0] pc_out;

pipe DUT (
    .clk        (clk),
    .reset      (reset),
    .stall      (1'b0),
    .exception  (exception),
    .pc_out     (pc_out)
);

////////////////////////////////////////////////////////////
// TEST TRACKING
////////////////////////////////////////////////////////////
integer cycle_count;
integer pass_count;
integer fail_count;
integer total_tests;
integer imem_init_idx;

initial begin
    cycle_count = 0;
    pass_count = 0;
    fail_count = 0;
    total_tests = 0;
end

always @(posedge clk) begin
    if (reset) begin
        cycle_count <= cycle_count + 1;
    end
end

////////////////////////////////////////////////////////////
// DUMP WAVEFORMS (for VCD viewing)
////////////////////////////////////////////////////////////
initial begin
    $dumpfile("tb_pipeline.vcd");
    $dumpvars(0, tb_pipeline);
end

////////////////////////////////////////////////////////////
// HELPER TASKS FOR VERIFICATION
////////////////////////////////////////////////////////////
task check_reg;
    input [4:0] reg_num;
    input [31:0] expected;
    input [255:0] test_name;
    begin
        total_tests = total_tests + 1;
        if (reg_num == 0) begin
            if (expected == 0) begin
                $display("[PASS] %0s: x0 = 0x%08h (expected 0x%08h)", test_name, 32'b0, expected);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] %0s: x0 = 0x%08h (expected 0x%08h)", test_name, 32'b0, expected);
                fail_count = fail_count + 1;
            end
        end else begin
            if (DUT.regs[reg_num] == expected) begin
                $display("[PASS] %0s: x%0d = 0x%08h (expected 0x%08h)", test_name, reg_num, DUT.regs[reg_num], expected);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] %0s: x%0d = 0x%08h (expected 0x%08h)", test_name, reg_num, DUT.regs[reg_num], expected);
                fail_count = fail_count + 1;
            end
        end
    end
endtask

task check_mem;
    input [9:0] addr_index;
    input [31:0] expected;
    input [255:0] test_name;
    begin
        total_tests = total_tests + 1;
        if (DUT.u_memory.dmem[addr_index] == expected) begin
            $display("[PASS] %0s: dmem[%0d] = 0x%08h (expected 0x%08h)", test_name, addr_index, DUT.u_memory.dmem[addr_index], expected);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] %0s: dmem[%0d] = 0x%08h (expected 0x%08h)", test_name, addr_index, DUT.u_memory.dmem[addr_index], expected);
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
// R-type: funct7[6:0] | rs2[4:0] | rs1[4:0] | funct3[2:0] | rd[4:0] | opcode[6:0]
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

// I-type: imm[11:0] | rs1[4:0] | funct3[2:0] | rd[4:0] | opcode[6:0]
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

// S-type: imm[11:5] | rs2[4:0] | rs1[4:0] | funct3[2:0] | imm[4:0] | opcode[6:0]
function [31:0] encode_stype;
    input [11:0] imm;
    input [4:0] rs2;
    input [4:0] rs1;
    input [2:0] funct3;
    input [6:0] opcode;
    begin
        encode_stype = {imm[11:5], rs2, rs1, funct3, imm[4:0], opcode};
    end
endfunction

// B-type: imm[12|10:5] | rs2[4:0] | rs1[4:0] | funct3[2:0] | imm[4:1|11] | opcode[6:0]
function [31:0] encode_btype;
    input [12:0] imm;  // 13-bit immediate (bit 0 always 0)
    input [4:0] rs2;
    input [4:0] rs1;
    input [2:0] funct3;
    input [6:0] opcode;
    begin
        encode_btype = {imm[12], imm[10:5], rs2, rs1, funct3, imm[4:1], imm[11], opcode};
    end
endfunction

////////////////////////////////////////////////////////////
// MAIN TEST SEQUENCE
////////////////////////////////////////////////////////////
initial begin
    $display("");
    $display("==============================================================");
    $display("       RISC-V PIPELINE COMPREHENSIVE TESTBENCH");
    $display("==============================================================");
    $display("");
    
    // Initialize data memory with test values
    DUT.u_memory.dmem[0] = 32'h0000_000A;  // Address 0x00: value 10
    DUT.u_memory.dmem[1] = 32'h0000_0014;  // Address 0x04: value 20
    DUT.u_memory.dmem[2] = 32'h0000_001E;  // Address 0x08: value 30
    DUT.u_memory.dmem[3] = 32'h0000_0000;  // Address 0x0C: value 0 (for store test)
    
    // Initialize instruction memory to NOP so execution beyond
    // programmed test region stays deterministic.
    for (imem_init_idx = 0; imem_init_idx < 1024; imem_init_idx = imem_init_idx + 1) begin
        DUT.u_fetch.imem[imem_init_idx] = 32'h00000013;
    end

    //==========================================================
    // TEST PROGRAM LAYOUT IN INSTRUCTION MEMORY
    // Test 1: Load Hazard Test (Addresses 0x00-0x10)
    // Test 2: Data Forwarding Test (Addresses 0x14-0x24)
    // Test 3: Branch Taken Test (Addresses 0x28-0x38)
    // Test 4: Branch Not Taken Test (Addresses 0x3C-0x4C)
    // Test 5: Store Test (Addresses 0x50-0x60)
    //==========================================================
    
    //----------------------------------------------------------
    // TEST 1: Load-Use Hazard Test
    // LW x1, 0(x0)      ; x1 = dmem[0] = 10
    // ADD x2, x1, x1    ; x2 = x1 + x1 = 20 (requires stall or forwarding)
    // ADDI x3, x2, 5    ; x3 = x2 + 5 = 25
    //----------------------------------------------------------
    DUT.u_fetch.imem[0]  = encode_itype(12'd0, 5'd0, 3'b010, 5'd1, 7'b0000011);   // LW x1, 0(x0)
    DUT.u_fetch.imem[1]  = encode_rtype(7'b0000000, 5'd1, 5'd1, 3'b000, 5'd2, 7'b0110011); // ADD x2, x1, x1
    DUT.u_fetch.imem[2]  = encode_itype(12'd5, 5'd2, 3'b000, 5'd3, 7'b0010011);   // ADDI x3, x2, 5
    DUT.u_fetch.imem[3]  = 32'h00000013;  // NOP
    DUT.u_fetch.imem[4]  = 32'h00000013;  // NOP
    
    //----------------------------------------------------------
    // TEST 2: Data Forwarding Test (EX/MEM and MEM/WB forwarding)
    // ADDI x4, x0, 100  ; x4 = 100
    // ADD x5, x4, x4    ; x5 = 200 (forwarding from EX/MEM)
    // SUB x6, x5, x4    ; x6 = 100 (forwarding from MEM/WB for x5, EX/MEM for x4)
    // OR x7, x5, x6     ; x7 = 200 | 100 = 236 (multiple forwarding paths)
    //----------------------------------------------------------
    DUT.u_fetch.imem[5]  = encode_itype(12'd100, 5'd0, 3'b000, 5'd4, 7'b0010011); // ADDI x4, x0, 100
    DUT.u_fetch.imem[6]  = encode_rtype(7'b0000000, 5'd4, 5'd4, 3'b000, 5'd5, 7'b0110011); // ADD x5, x4, x4
    DUT.u_fetch.imem[7]  = encode_rtype(7'b0100000, 5'd4, 5'd5, 3'b000, 5'd6, 7'b0110011); // SUB x6, x5, x4
    DUT.u_fetch.imem[8]  = encode_rtype(7'b0000000, 5'd6, 5'd5, 3'b110, 5'd7, 7'b0110011); // OR x7, x5, x6
    DUT.u_fetch.imem[9]  = 32'h00000013;  // NOP
    DUT.u_fetch.imem[10] = 32'h00000013;  // NOP
    
    //----------------------------------------------------------
    // TEST 3: Branch TAKEN Test
    // ADDI x8, x0, 42   ; x8 = 42
    // ADDI x9, x0, 42   ; x9 = 42
    // BEQ x8, x9, +8    ; Branch taken (skip next instruction)
    // ADDI x10, x0, 99  ; Should be SKIPPED (x10 should remain 0)
    // ADDI x11, x0, 77  ; This should execute (branch target)
    //----------------------------------------------------------
    DUT.u_fetch.imem[11] = encode_itype(12'd42, 5'd0, 3'b000, 5'd8, 7'b0010011);  // ADDI x8, x0, 42
    DUT.u_fetch.imem[12] = encode_itype(12'd42, 5'd0, 3'b000, 5'd9, 7'b0010011);  // ADDI x9, x0, 42
    DUT.u_fetch.imem[13] = encode_btype(13'd8, 5'd9, 5'd8, 3'b000, 7'b1100011);   // BEQ x8, x9, +8
    DUT.u_fetch.imem[14] = encode_itype(12'd99, 5'd0, 3'b000, 5'd10, 7'b0010011); // ADDI x10, x0, 99 (SKIPPED)
    DUT.u_fetch.imem[15] = encode_itype(12'd77, 5'd0, 3'b000, 5'd11, 7'b0010011); // ADDI x11, x0, 77 (branch target)
    DUT.u_fetch.imem[16] = 32'h00000013;  // NOP
    DUT.u_fetch.imem[17] = 32'h00000013;  // NOP
    
    //----------------------------------------------------------
    // TEST 4: Branch NOT TAKEN Test
    // ADDI x12, x0, 10  ; x12 = 10
    // ADDI x13, x0, 20  ; x13 = 20
    // BEQ x12, x13, +8  ; Branch NOT taken (x12 != x13)
    // ADDI x14, x0, 55  ; Should execute (branch not taken)
    // ADDI x15, x0, 33  ; Also executes (next sequential instruction)
    //----------------------------------------------------------
    DUT.u_fetch.imem[18] = encode_itype(12'd10, 5'd0, 3'b000, 5'd12, 7'b0010011); // ADDI x12, x0, 10
    DUT.u_fetch.imem[19] = encode_itype(12'd20, 5'd0, 3'b000, 5'd13, 7'b0010011); // ADDI x13, x0, 20
    DUT.u_fetch.imem[20] = encode_btype(13'd8, 5'd13, 5'd12, 3'b000, 7'b1100011); // BEQ x12, x13, +8 (not taken)
    DUT.u_fetch.imem[21] = encode_itype(12'd55, 5'd0, 3'b000, 5'd14, 7'b0010011); // ADDI x14, x0, 55
    DUT.u_fetch.imem[22] = encode_itype(12'd33, 5'd0, 3'b000, 5'd15, 7'b0010011); // ADDI x15, x0, 33
    DUT.u_fetch.imem[23] = 32'h00000013;  // NOP
    DUT.u_fetch.imem[24] = 32'h00000013;  // NOP
    
    //----------------------------------------------------------
    // TEST 5: Store Instruction Test
    // ADDI x16, x0, 123 ; x16 = 123
    // ADDI x17, x0, 12  ; x17 = 12 (address offset)
    // SW x16, 0(x17)    ; Store x16 (123) to address 12 -> dmem[3]
    // LW x18, 0(x17)    ; Load back to verify: x18 should be 123
    //----------------------------------------------------------
    DUT.u_fetch.imem[25] = encode_itype(12'd123, 5'd0, 3'b000, 5'd16, 7'b0010011); // ADDI x16, x0, 123
    DUT.u_fetch.imem[26] = encode_itype(12'd12, 5'd0, 3'b000, 5'd17, 7'b0010011);  // ADDI x17, x0, 12
    DUT.u_fetch.imem[27] = encode_stype(12'd0, 5'd16, 5'd17, 3'b010, 7'b0100011);  // SW x16, 0(x17)
    DUT.u_fetch.imem[28] = encode_itype(12'd0, 5'd17, 3'b010, 5'd18, 7'b0000011);  // LW x18, 0(x17)
    DUT.u_fetch.imem[29] = 32'h00000013;  // NOP
    DUT.u_fetch.imem[30] = 32'h00000013;  // NOP
    
    //----------------------------------------------------------
    // TEST 6: Store-Load with Forwarding
    // ADDI x19, x0, 456 ; x19 = 456
    // SW x19, 16(x0)    ; Store x19 to dmem[4]
    // ADDI x20, x19, 1  ; x20 = x19 + 1 = 457 (forwarding test)
    //----------------------------------------------------------
    DUT.u_fetch.imem[31] = encode_itype(12'd456, 5'd0, 3'b000, 5'd19, 7'b0010011); // ADDI x19, x0, 456
    DUT.u_fetch.imem[32] = encode_stype(12'd16, 5'd19, 5'd0, 3'b010, 7'b0100011);  // SW x19, 16(x0) -> dmem[4]
    DUT.u_fetch.imem[33] = encode_itype(12'd1, 5'd19, 3'b000, 5'd20, 7'b0010011);  // ADDI x20, x19, 1
    
    // Fill rest with NOPs
    DUT.u_fetch.imem[34] = 32'h00000013;
    DUT.u_fetch.imem[35] = 32'h00000013;
    DUT.u_fetch.imem[36] = 32'h00000013;
    DUT.u_fetch.imem[37] = 32'h00000013;
    DUT.u_fetch.imem[38] = 32'h00000013;
    DUT.u_fetch.imem[39] = 32'h00000013;

    // Apply reset
    reset = 0;
    #100;
    reset = 1;
    
    // Wait for pipeline to execute all instructions
    // Each test needs ~10 cycles, total ~80 cycles should be enough
    wait_cycles(150);
    
    //==========================================================
    // VERIFICATION PHASE
    //==========================================================
    $display("");
    $display("==============================================================");
    $display("                    TEST RESULTS");
    $display("==============================================================");
    $display("");
    
    //----------------------------------------------------------
    // Verify Test 1: Load-Use Hazard
    //----------------------------------------------------------
    $display("--------------------------------------------------------------");
    $display("TEST 1: Load-Use Hazard");
    $display("--------------------------------------------------------------");
    check_reg(5'd1, 32'd10, "Load Hazard - LW x1");
    check_reg(5'd2, 32'd20, "Load Hazard - ADD x2=x1+x1");
    check_reg(5'd3, 32'd25, "Load Hazard - ADDI x3=x2+5");
    $display("");
    
    //----------------------------------------------------------
    // Verify Test 2: Data Forwarding
    //----------------------------------------------------------
    $display("--------------------------------------------------------------");
    $display("TEST 2: Data Forwarding (EX/MEM and MEM/WB)");
    $display("--------------------------------------------------------------");
    check_reg(5'd4, 32'd100, "Data Fwd - ADDI x4=100");
    check_reg(5'd5, 32'd200, "Data Fwd - ADD x5=x4+x4 (EX/MEM fwd)");
    check_reg(5'd6, 32'd100, "Data Fwd - SUB x6=x5-x4 (MEM/WB fwd)");
    check_reg(5'd7, 32'd236, "Data Fwd - OR x7=x5|x6");
    $display("");
    
    //----------------------------------------------------------
    // Verify Test 3: Branch Taken
    //----------------------------------------------------------
    $display("--------------------------------------------------------------");
    $display("TEST 3: Branch TAKEN");
    $display("--------------------------------------------------------------");
    check_reg(5'd8, 32'd42, "Branch Taken - ADDI x8=42");
    check_reg(5'd9, 32'd42, "Branch Taken - ADDI x9=42");
    check_reg(5'd10, 32'd0, "Branch Taken - x10 should be SKIPPED (0)");
    check_reg(5'd11, 32'd77, "Branch Taken - ADDI x11=77 (target)");
    $display("");
    
    //----------------------------------------------------------
    // Verify Test 4: Branch Not Taken
    //----------------------------------------------------------
    $display("--------------------------------------------------------------");
    $display("TEST 4: Branch NOT TAKEN");
    $display("--------------------------------------------------------------");
    check_reg(5'd12, 32'd10, "Branch Not Taken - ADDI x12=10");
    check_reg(5'd13, 32'd20, "Branch Not Taken - ADDI x13=20");
    check_reg(5'd14, 32'd55, "Branch Not Taken - ADDI x14=55 (executed)");
    check_reg(5'd15, 32'd33, "Branch Not Taken - ADDI x15=33");
    $display("");
    
    //----------------------------------------------------------
    // Verify Test 5: Store Instruction
    //----------------------------------------------------------
    $display("--------------------------------------------------------------");
    $display("TEST 5: Store Instruction");
    $display("--------------------------------------------------------------");
    check_reg(5'd16, 32'd123, "Store Test - ADDI x16=123");
    check_reg(5'd17, 32'd12, "Store Test - ADDI x17=12 (addr)");
    check_mem(10'd3, 32'd123, "Store Test - SW dmem[3]=123");
    check_reg(5'd18, 32'd123, "Store Test - LW x18=dmem[3]");
    $display("");
    
    //----------------------------------------------------------
    // Verify Test 6: Store-Load with Forwarding
    //----------------------------------------------------------
    $display("--------------------------------------------------------------");
    $display("TEST 6: Store with Data Forwarding");
    $display("--------------------------------------------------------------");
    check_reg(5'd19, 32'd456, "Store Fwd - ADDI x19=456");
    check_mem(10'd4, 32'd456, "Store Fwd - SW dmem[4]=456");
    check_reg(5'd20, 32'd457, "Store Fwd - ADDI x20=x19+1");
    $display("");
    
    //==========================================================
    // FINAL SUMMARY
    //==========================================================
    $display("==============================================================");
    $display("                    FINAL SUMMARY");
    $display("==============================================================");
    $display("Total Tests: %0d", total_tests);
    $display("Passed:      %0d", pass_count);
    $display("Failed:      %0d", fail_count);
    $display("");
    if (fail_count == 0) begin
        $display("*** ALL TESTS PASSED! ***");
    end else begin
        $display("*** SOME TESTS FAILED ***");
    end
    $display("==============================================================");
    $display("");
    
    // Print final register state for debugging
    $display("========== FINAL REGISTER STATE ==========");
    $display("x0  (zero) = 0x%08h", 32'b0);
    $display("x1  (ra)   = 0x%08h", DUT.regs[1]);
    $display("x2  (sp)   = 0x%08h", DUT.regs[2]);
    $display("x3  (gp)   = 0x%08h", DUT.regs[3]);
    $display("x4  (tp)   = 0x%08h", DUT.regs[4]);
    $display("x5  (t0)   = 0x%08h", DUT.regs[5]);
    $display("x6  (t1)   = 0x%08h", DUT.regs[6]);
    $display("x7  (t2)   = 0x%08h", DUT.regs[7]);
    $display("x8  (s0)   = 0x%08h", DUT.regs[8]);
    $display("x9  (s1)   = 0x%08h", DUT.regs[9]);
    $display("x10 (a0)   = 0x%08h", DUT.regs[10]);
    $display("x11 (a1)   = 0x%08h", DUT.regs[11]);
    $display("x12 (a2)   = 0x%08h", DUT.regs[12]);
    $display("x13 (a3)   = 0x%08h", DUT.regs[13]);
    $display("x14 (a4)   = 0x%08h", DUT.regs[14]);
    $display("x15 (a5)   = 0x%08h", DUT.regs[15]);
    $display("x16 (a6)   = 0x%08h", DUT.regs[16]);
    $display("x17 (a7)   = 0x%08h", DUT.regs[17]);
    $display("x18 (s2)   = 0x%08h", DUT.regs[18]);
    $display("x19 (s3)   = 0x%08h", DUT.regs[19]);
    $display("x20 (s4)   = 0x%08h", DUT.regs[20]);
    $display("==========================================");
    $display("Simulation complete after %0d cycles", cycle_count);
    $finish;
end

////////////////////////////////////////////////////////////
// DEBUG: Cycle-by-cycle trace (optional - comment out for cleaner output)
////////////////////////////////////////////////////////////
`ifdef DEBUG_TRACE
always @(posedge clk) begin
    if (reset && cycle_count > 0 && cycle_count <= 100) begin
        $display("[Cycle %3d] PC=0x%08h | Stall=%b | BranchTaken=%b | LoadUseHaz=%b", 
                 cycle_count, pc_out, DUT.stall_if, DUT.branch_taken, DUT.load_use_hazard);
        if (DUT.wb_reg_write_en && DUT.wb_rd_addr != 0) begin
            $display("            WB: x%0d <- 0x%08h", DUT.wb_rd_addr, DUT.wb_rd_data);
        end
    end
end
`endif

endmodule
