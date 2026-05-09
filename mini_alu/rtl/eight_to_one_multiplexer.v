`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 15:58:56
// Design Name: 
// Module Name: eight_to_one_multiplexer
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


module eight_to_one_mux(
    input [2:0] select,
    input [5:0] O0, O1, O2, O3, O4, O5, O6, O7, // 8 options which can be outputted
    output reg [5:0] Y
    );
    
    always @(*) begin
    case(select)
        3'b000: Y = O0;
        3'b001: Y = O1;
        3'b010: Y = O2;
        3'b011: Y = O3;
        3'b100: Y = O4;
        3'b101: Y = O5;
        3'b110: Y = O6;
        3'b111: Y = O7;
        endcase
    end
    
    
endmodule
