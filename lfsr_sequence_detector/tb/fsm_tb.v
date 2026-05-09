`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2026 16:42:40
// Design Name: 
// Module Name: fsm_tb
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


module fsm_tb();
    reg clk;
    initial begin
        clk = 1'b0;
        forever #1 clk = ~clk;
    end
    
    reg reset;
    initial begin
        reset = 1'b1; #20
        reset = 1'b0;
    end 
    
    reg in; // input value testing
    initial begin
        in = 1'b0; #20
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b1; #2
        in = 1'b0; #2
        in = 1'b1; #2
        
        in = 1'b1; #2 // codeword
        in = 1'b0; #2
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0; #2
        
        in = 1'b1; #2 // most of codeword then reset
        in = 1'b0; #2
        in = 1'b0; #2
        in = 1'b1; #2
        reset = 1'b1; #2
        reset = 1'b0;
        
        in = 1'b1; #2 // codeword back 2 back
        in = 1'b0; #2
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0; #2
        
        in = 1'b1; #2 // codeword again
        in = 1'b0; #2
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0; #2
        
        // Codeword OVERLAPPING
        in = 1'b1; #2
        in = 1'b0; #2
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0; #2
        in = 1'b0; #2
        in = 1'b1; #2
        in = 1'b0;
    end 
    
    wire out;
    wire [2:0] state; //state output for debugging
    fsm utt (.in(in), .clk(clk), .reset(reset), .state(state), .out(out));
    
endmodule
