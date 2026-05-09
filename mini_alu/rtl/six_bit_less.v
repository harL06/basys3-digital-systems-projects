`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 15:21:30
// Design Name: 
// Module Name: six_bit_less
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


module six_bit_less(
    input [5:0] A, B,
    output [5:0] Y
    );
    
    wire top_less; // top bit (after sign indication in MSB)
    wire top_eq;
    wire mid_less; // middle two bits
    wire mid_eq;
    wire bot_less; // bottom two bits
    wire bot_eq;
    wire less_bit; // single bit to store bool result
    
    // compare the middle two values and see if they are less/equal
    two_bit_less mid (.A(A[3:2]), .B(B[3:2]), .less(mid_less), .eq(mid_eq));
    // compare the bottom two values and see if they are less/equal
    two_bit_less bot (.A(A[1:0]), .B(B[1:0]), .less(bot_less), .eq(bot_eq));
    
    assign top_less = ~A[4] & B[4];
    assign top_eq   = A[4] ~^ B[4];
    
    assign less_bit = (A[5] & ~B[5]) | // if A is neg and B is not, A must be less
    ((A[5] ~^ B[5]) & // if the signs are the same (both pos or both neg), compare remaining digits
    (top_less | // if MSB is less, must be less
    (top_eq & mid_less) | // if MSB is equal and mid is less, must be less
    (top_eq & mid_eq & bot_less))); // if MSB and middle two are equal and the bottom is less, must be less
    
    assign Y = {5'b00000, less_bit};
endmodule
