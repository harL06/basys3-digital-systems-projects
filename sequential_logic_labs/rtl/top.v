`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 18:38:45
// Design Name: 
// Module Name: top
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


module top
    #(parameter clock_scaling = 32'd50000000)
    (
    input CCLK,
    input reset,
    input select,
    output max_tick,
    output [14:0] led_out 
    );
    
    wire clk;
    wire [22:0] q; // LFSR State
    
    clock clk_scale (.CCLK(CCLK), .clkscale(clock_scaling), .clk(clk)); // clock scaling
    lfsr_23bit LFSR (.clk(clk), .sh_en(!reset), .reset(reset), .Q_out(q), .max_tick_reg(max_tick)); // LSFR
    output_mux MUX (.Q(q), .sel(select), .led_out(led_out)); // MUX to map state to LED output
    
endmodule
