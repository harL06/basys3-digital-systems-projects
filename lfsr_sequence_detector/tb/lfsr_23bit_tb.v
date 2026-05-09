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


module lfsr_23bit_tb(); //testbench clock w/ a 2ns cylce length
    reg clk;
    initial begin
        clk = 1'b0;
        forever #1 clk = ~clk;
    end
    
    reg reset, enable; // initialising reset signal
    initial begin
        enable = 1'b1;
        reset = 1'b1; #20
        reset = 1'b0;
    end 
    
    wire [17:0] q;
    wire max_tick;
    lfsr_18bit uut (.clk(clk), .reset(reset), .sh_en(enable), .Q_out(q), .max_tick_reg(max_tick));
endmodule
