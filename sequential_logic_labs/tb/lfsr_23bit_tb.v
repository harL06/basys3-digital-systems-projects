`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 15:33:51
// Design Name: 
// Module Name: lfsr_23bit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lfsr_23bit_tb();
    reg clk;
    initial begin
        clk = 1'b0;
        forever #1 clk = ~clk;
    end
    
    reg reset, enable;
    initial begin
        enable = 1'b1;
        reset = 1'b1; #20
        reset = 1'b0;
    end 
    
    wire [22:0] q;
    wire max_tick;
    wire [22:0] num_one;
    wire [22:0] num_zero;
    lfsr_23bit uut (.clk(clk), .reset(reset), .sh_en(enable), .Q_out(q), .max_tick_reg(max_tick));
    bit_counter uut2 (.clk(clk), .reset(reset), .Q(q), .max_tick(max_tick), .num_one(num_one), .num_zero(num_zero));
endmodule
