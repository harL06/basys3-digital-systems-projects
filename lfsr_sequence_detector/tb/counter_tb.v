`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 17:30:12
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
    reg clk;
    initial begin
        clk = 1'b0;
        forever #1 clk = ~clk;
    end
    
    reg reset; // initialising reset signal
    initial begin
        reset = 1'b1; #20
        reset = 1'b0;
    end 
    
    reg in; // input value testing
    initial begin
        in = 1'b0; #20
        in = 1'b0; #2 // sequence of 1's to count occurances
        in = 1'b1; #2
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0; #4
        
        reset = 1'b1; #2 //reset test
        reset = 1'b0;
        
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0;
    end
    
    wire [15:0] out;
    counter uut (.clk(clk), .reset(reset), .in(in), .out(out));
endmodule
