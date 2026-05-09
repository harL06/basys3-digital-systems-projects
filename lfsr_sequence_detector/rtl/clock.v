`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 18:35:49
// Design Name: 
// Module Name: clock
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


module clock
    (
    input CCLK,
    input [31:0] clkscale,
    output reg clk
    );
    
    reg [31:0] clkq = 0; //clock init registr
    
    always @ (posedge CCLK) begin
        clkq<=clkq+1; //increment
        if (clkq>=clkscale) begin // when incrementer reaches clock scale, flip clock output
            clk <= ~clk;
            clkq <= 0;
        end
    end
    
endmodule
