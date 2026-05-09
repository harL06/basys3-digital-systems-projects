`timescale 1ns / 1ps

module alu_tb;

reg  [5:0] A;
reg  [5:0] B;
reg  [2:0] fxn;
wire [5:0] X;

alu uut (.A(A), .B(B), .X(X), .fxn(fxn));

initial begin
    
A = 6'b010010; // Board number 18 in binary

fxn = 3'b110;

B = 6'b000000; #10;   // 18 + 0  = 18
B = 6'b000001; #10;   // 18 + 1  = 19
B = 6'b000110; #10;   // 18 + 6  = 24
B = 6'b111111; #10;   // 18 + (-1) = 17
B = 6'b111100; #10;   // 18 + (-4) = 14

fxn = 3'b111;
B = 6'b000000; #10;   // 18 - 0  = 18
B = 6'b000001; #10;   // 18 - 1  = 17
B = 6'b000110; #10;   // 18 - 6  = 12
B = 6'b010010; #10;
B = 6'b100110; #10;   // 18 - (-26) = 44 → overflow behaviour


$finish;

end

endmodule