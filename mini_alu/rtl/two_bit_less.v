`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 12:18:04
// Design Name: 
// Module Name: two_bit_less
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


module two_bit_less(
    input [1:0] A, B,
    output less, eq
    );
    
    // output is a 1 if A is less than B
    assign less = (~A[1] & B[1]) | ((A[1] ~^ B[1]) & (~A[0] & B[0]));
    assign eq = (A[0] ~^ B[0]) & (A[1] ~^ B[1]);
    
endmodule
