`timescale 1ns / 1ps

module six_bit_less_tb;

reg  [5:0] A;
reg  [5:0] B;
wire Y;

six_bit_less uut (.A(A), .B(B), .Y(Y));

initial begin

// equal
A = 6'b000000; B = 6'b000000; #10;

// positive vs positive
A = 6'b000101; B = 6'b001001; #10;
A = 6'b001100; B = 6'b001010; #10;

// negative vs positive
A = 6'b110000; B = 6'b001000; #10;

// positive vs negative
A = 6'b001000; B = 6'b110000; #10;

// negative vs negative
A = 6'b111100; B = 6'b111010; #10;
A = 6'b110010; B = 6'b111000; #10;

// bit4 decides
A = 6'b001000; B = 6'b000100; #10;

// mid group decides
A = 6'b000110; B = 6'b000100; #10;

// bottom group decides
A = 6'b000001; B = 6'b000010; #10;

$finish;

end

endmodule