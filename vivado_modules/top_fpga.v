`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////
// FPGA Top Module for 5-Stage RISC-V Pipeline (RV32IM)
// Shows full WB output as signed decimal on 8-digit 7-seg
//////////////////////////////////////////////////////////////
module top_fpga (
    input  wire        clk,      // 100 MHz board clock
    input  wire        reset,    // Active-low reset
    output wire [15:0] led,
    output reg  [7:0]  an,       // Active-low anodes
    output reg  [6:0]  seg,      // Active-low segments a..g
    output wire        dp         // Active-low decimal point
);

wire        exception;
wire [31:0] pc_display;
wire [31:0] wb_data_display;
wire        cpu_clk;

clock_divider #(
    .DIVISOR(100_000_000)
) u_clk_div (
    .clk   (clk),
    .reset (reset),
    .clk_en(cpu_clk)
);

pipe #(.RESET(32'h0000_0000)) u_pipe (
    .clk        (cpu_clk),
    .reset      (reset),
    .stall      (1'b0),
    .exception  (exception),
    .pc_out     (pc_display),
    .wb_data_out(wb_data_display)
);

assign led = wb_data_display[15:0];
assign dp  = 1'b1; // decimal point off

//////////////////////////////////////////////////////////////
// Decimal conversion for signed 32-bit output
//////////////////////////////////////////////////////////////
reg [31:0] abs_value;
reg [3:0] digit7, digit6, digit5, digit4, digit3, digit2, digit1, digit0;
reg       show_minus;
reg [2:0] scan_sel;
reg [16:0] scan_counter;
reg [3:0] cur_digit;
reg       cur_minus;

always @(*) begin
    if (wb_data_display[31]) begin
        abs_value  = (~wb_data_display) + 1'b1;
        show_minus = 1'b1;
    end else begin
        abs_value  = wb_data_display;
        show_minus = 1'b0;
    end

    // 8 decimal digits (least significant 8 digits shown)
    digit0 =  abs_value % 10;
    digit1 = (abs_value / 10) % 10;
    digit2 = (abs_value / 100) % 10;
    digit3 = (abs_value / 1000) % 10;
    digit4 = (abs_value / 10000) % 10;
    digit5 = (abs_value / 100000) % 10;
    digit6 = (abs_value / 1000000) % 10;
    digit7 = (abs_value / 10000000) % 10;
end

// 7-seg scan clock (~1kHz total refresh)
always @(posedge clk) begin
    if (!reset) begin
        scan_counter <= 17'd0;
        scan_sel     <= 3'd0;
    end else begin
        if (scan_counter == 17'd99999) begin
            scan_counter <= 17'd0;
            scan_sel     <= scan_sel + 3'd1;
        end else begin
            scan_counter <= scan_counter + 17'd1;
        end
    end
end

always @(*) begin
    an        = 8'b1111_1111;
    cur_digit = 4'd0;
    cur_minus = 1'b0;

    case (scan_sel)
        3'd0: begin an = 8'b1111_1110; cur_digit = digit0; end
        3'd1: begin an = 8'b1111_1101; cur_digit = digit1; end
        3'd2: begin an = 8'b1111_1011; cur_digit = digit2; end
        3'd3: begin an = 8'b1111_0111; cur_digit = digit3; end
        3'd4: begin an = 8'b1110_1111; cur_digit = digit4; end
        3'd5: begin an = 8'b1101_1111; cur_digit = digit5; end
        3'd6: begin an = 8'b1011_1111; cur_digit = digit6; end
        3'd7: begin
            an = 8'b0111_1111;
            if (show_minus)
                cur_minus = 1'b1;
            else
                cur_digit = digit7;
        end
    endcase

    if (cur_minus) begin
        seg = 7'b111_1110; // '-'
    end else begin
        case (cur_digit)
            4'd0: seg = 7'b100_0000;
            4'd1: seg = 7'b111_1001;
            4'd2: seg = 7'b010_0100;
            4'd3: seg = 7'b011_0000;
            4'd4: seg = 7'b001_1001;
            4'd5: seg = 7'b001_0010;
            4'd6: seg = 7'b000_0010;
            4'd7: seg = 7'b111_1000;
            4'd8: seg = 7'b000_0000;
            4'd9: seg = 7'b001_0000;
            default: seg = 7'b111_1111;
        endcase
    end
end

endmodule

module clock_divider(
    input  wire clk,
    input  wire reset,
    output reg  clk_en
);
    parameter DIVISOR = 100_000_000;
    reg [26:0] counter;

    always @(posedge clk) begin
        if (!reset) begin
            counter <= 27'd0;
            clk_en  <= 1'b0;
        end
        else if (counter == DIVISOR - 1) begin
            counter <= 27'd0;
            clk_en  <= ~clk_en;
        end
        else begin
            counter <= counter + 1'b1;
        end
    end
endmodule
