`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 18:44:44
// Design Name: 
// Module Name: output_mux
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


module output_mux(
    input [22:0] Q,
    input sel,
    output reg [14:0] led_out
    );
    
    always @(*) begin
        if (!sel)
            led_out = Q[14:0];
        else
            led_out = {10'b0, Q[22:15]};
    end
endmodule
