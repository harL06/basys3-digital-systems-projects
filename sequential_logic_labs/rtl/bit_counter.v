`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 16:51:39
// Design Name: 
// Module Name: bit_counter
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


module bit_counter(
    input clk,
    input reset,
    input [22:0] Q,
    input max_tick,
    output reg [22:0] num_one,
    output reg [22:0] num_zero
    );
    
    always @ (posedge clk or posedge reset) begin
        if (reset || max_tick) begin
            num_one = 0;
            num_zero =   0;
        end
        else begin
            if (Q[22] == 1)
                num_one = num_one + 23'd1;
            else if (Q[22] == 0)
                num_zero = num_zero + 23'd1;
        end
    end
endmodule
