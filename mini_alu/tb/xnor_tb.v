`timescale 1ns / 1ps

module six_bit_xnor_tb;

reg  [5:0] A;
reg  [5:0] B;
wire [5:0] Y;

six_bit_xnor uut (.A(A), .B(B), .Y(Y));

initial begin

A = 6'b000000; B = 6'b000000; #10;
A = 6'b111111; B = 6'b111111; #10;
A = 6'b101010; B = 6'b101010; #10;
A = 6'b101010; B = 6'b010101; #10;
A = 6'b110011; B = 6'b100011; #10;

$finish;

end

endmodule