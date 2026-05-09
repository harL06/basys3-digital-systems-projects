`timescale 1ns / 1ps

module two_bit_less_tb;

reg  [1:0] A;
reg  [1:0] B;
wire L;
wire E;

two_bit_less uut (.A(A), .B(B), .less(L), .eq(E));

initial begin

A = 2'b00; B = 2'b00; #10;
A = 2'b00; B = 2'b01; #10;
A = 2'b00; B = 2'b10; #10;
A = 2'b00; B = 2'b11; #10;

A = 2'b01; B = 2'b00; #10;
A = 2'b01; B = 2'b01; #10;
A = 2'b01; B = 2'b10; #10;
A = 2'b01; B = 2'b11; #10;

A = 2'b10; B = 2'b00; #10;
A = 2'b10; B = 2'b01; #10;
A = 2'b10; B = 2'b10; #10;
A = 2'b10; B = 2'b11; #10;

A = 2'b11; B = 2'b00; #10;
A = 2'b11; B = 2'b01; #10;
A = 2'b11; B = 2'b10; #10;
A = 2'b11; B = 2'b11; #10;

$finish;

end

endmodule