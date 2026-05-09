//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2026 09:17:26
// Design Name: 
// Module Name: 6bit_ripple_adder
// Project Name: 
// Target Devices: 
`timescale 1 ns/10 ps
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


module six_bit_ripple_adder(
    input [5:0] x, y,
    input sel,
    output [5:0] sum,
    output overflow, c_out
    );

    wire [6:0] carry;
    wire [6:0] added_val;
    assign carry[0] = sel;
    
    assign added_val[0] = y[0] ^ sel;
    assign added_val[1] = y[1] ^ sel;
    assign added_val[2] = y[2] ^ sel;
    assign added_val[3] = y[3] ^ sel;
    assign added_val[4] = y[4] ^ sel;
    assign added_val[5] = y[5] ^ sel;
        
    fullAdder add_bit0 (x[0], added_val[0], carry[0], sum[0], carry[1]);
    fullAdder add_bit1 (x[1], added_val[1], carry[1], sum[1], carry[2]);
    fullAdder add_bit2 (x[2], added_val[2], carry[2], sum[2], carry[3]);
    fullAdder add_bit3 (x[3], added_val[3], carry[3], sum[3], carry[4]);
    fullAdder add_bit4 (x[4], added_val[4], carry[4], sum[4], carry[5]);
    fullAdder add_bit5 (x[5], added_val[5], carry[5], sum[5], carry[6]);
    
    assign overflow = carry[5] ^ carry[6];
    assign c_out = carry[6];
    
endmodule
