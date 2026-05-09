`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2026 09:17:21
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk; //periodic clock signal
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end
       
    reg reset; //reset signal matchig timing diagram
    initial begin
        reset = 1'b1; #45
        reset = 1'b0; #80
        reset = 1'b1; #30
        reset = 1'b0;
    end 
    
    reg d;    // input signal matching itming diagram
    initial begin
        d = 1'b0; #30
        d = 1'b1; #25
        d = 1'b0; #30
        d = 1'b1; #100
        d = 1'b0;
    end 
    
    wire q;
    d_ff_reset uut (.clk(clk), .reset(reset), .d(d), .q(q));
endmodule
