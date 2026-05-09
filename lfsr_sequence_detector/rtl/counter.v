`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 17:19:48
// Design Name: 
// Module Name: counter
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


module counter
    #(parameter M=16)
    (
    input clk,
    input reset,
    input in,
    output [M-1:0] out
    );
    
    reg [M-1:0] reg_count;
    reg [M-1:0] next_count;
    
    always @ (posedge clk or posedge reset) begin
        if (reset)
            reg_count <= 0;
        else
            reg_count <= next_count;
    end
    
    always @ (*) begin
        if (in) // checks if input is 1 and increments counter
            next_count = reg_count + 1;
        else // counter value remains same if input not 1
            next_count = reg_count;
    end
    
    assign out = reg_count;
endmodule
