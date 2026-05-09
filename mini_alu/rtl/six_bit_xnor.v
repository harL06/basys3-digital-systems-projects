`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 11:28:32
// Design Name: 
// Module Name: six_bit_xnor
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


module six_bit_xnor(
    input [5:0] A, B,
    output [5:0] Y
    );
    
    // performs XNOR on every bit for A and B
    assign Y = A ~^ B;

endmodule
