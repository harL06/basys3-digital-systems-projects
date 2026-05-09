`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 10:34:20
// Design Name: 
// Module Name: alu
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


module alu(
    input [5:0] A, B,
    input [2:0] fxn,
    output [5:0] X
    );
    
    // wires for each of the operation outputs
    wire [5:0] neg_A;
    wire [5:0] neg_B;
    wire less_than_bit;
    wire [5:0] A_less_B;
    wire [5:0] A_xnor_B;
    wire [5:0] A_add_B;
    wire [5:0] A_sub_B;
    
    // wires for the full adder's carry and overflow, these will not be used as outputs
    wire negA_overflow, negA_cout;
    wire negB_overflow, negB_cout;
    wire add_overflow, add_cout;
    wire sub_overflow, sub_cout;
    
    // uses 6 bit ripple adder to subtract A from zero, negating A
    six_bit_ripple_adder negate_A 
        (.x(6'b000000), .y(A), .sel(1'b1), .sum(neg_A), .overflow(negA_overflow), .c_out(negA_cout));
        // uses 6 bit ripple adder to subtract B from zero, negating B
    six_bit_ripple_adder negate_B 
        (.x(6'b000000), .y(B), .sel(1'b1), .sum(neg_B), .overflow(negB_overflow), .c_out(negB_cout));
    // uses 6 bit ripple adder with sel set to zero to do adding
    six_bit_ripple_adder add 
        (.x(A), .y(B), .sel(1'b0), .sum(A_add_B), .overflow(add_overflow), .c_out(add_cout));
    // uses 6 bit ripple adder with sel set to one to do subtracting
    six_bit_ripple_adder subtract 
        (.x(A), .y(B), .sel(1'b1), .sum(A_sub_B), .overflow(sub_overflow), .c_out(sub_cout));
    // uses xnor module to perform bitwise XNOR on A and B
    six_bit_xnor six_xnor (.A(A), .B(B), .Y(A_xnor_B));
    // uses the less than module to set result to the boolean result of A<B
    six_bit_less six_less (.A(A), .B(B), .Y(A_less_B));
    
    // Use multiplexer to choose between which result to output based on FXN value
    eight_to_one_mux mux (.select(fxn), .O0(A), .O1(B), 
    .O2(neg_A), .O3(neg_B), .O4(A_less_B), .O5(A_xnor_B), 
    .O6(A_add_B), .O7(A_sub_B), .Y(X));
    
endmodule
