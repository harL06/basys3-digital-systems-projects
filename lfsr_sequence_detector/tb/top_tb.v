`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 18:05:34
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    reg clk; // testbench clock with 2ns cycle len
    initial begin
        clk = 1'b0;
        forever #1 clk = ~clk;
    end
    
    reg reset; // initialising reset signal
    initial begin
        reset = 1'b1; #20
        reset = 1'b0;
    end 
    
    wire [15:0] out;
    top uut (.reset(reset), .clk(clk), .out(out));
endmodule
