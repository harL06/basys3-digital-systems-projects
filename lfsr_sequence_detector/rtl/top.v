`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 17:52:42
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
    #(parameter N=16) //length of coutner vector
    (
    input reset,
    input CCLK,
    input mux_sel,
    output [14:0] led_out,
    //output [N-1:0] out
    output [3:0] anode_sel,
    output [6:0] seg_led,
    output lfsr_max_tick
    );
    
    wire lfsr_LSB;
    wire [17:0] lfsr_out;
    lfsr_18bit LFSR ( // LFSR generating psudeorandom sequence
        .clk(clk_scaled), 
        .reset(reset), 
        .sh_en(!reset),
        .Q_out(lfsr_out), 
        .max_tick_reg(lfsr_max_tick)
    );
    
    wire fsm_out; // outputs HIGH when codeworkd detected
    wire [2:0] fsm_state; // for debug, state of FSM
    fsm FSM (
        .clk(clk_scaled),
        .reset(reset),
        .in(lfsr_out[0]),
        .out(fsm_out),
        .state(fsm_state)
    );
    
    wire [N-1:0] counter_out;
    counter #(N) COUNT ( // init counter with output vector lenth
        .clk(clk_scaled),
        .reset(reset),
        .in(fsm_out),
        .out(counter_out)
    );
    
    output_mux #(18) MUX ( //output mux to allow for full LFSR output on LEDs
        .Q(lfsr_out),
        .sel(mux_sel),
        .led_out(led_out)
    );
    
    
    seven_segment_controller SEV_SEG ( // displays counter output on 7-seg
        .clk(CCLK),
        .reset(reset),
        .value(counter_out[13:0]),
        .anode_select(anode_sel),
        .LED_out(seg_led)
    );
    
    wire clk_scaled; // scaled clock for FSM and LFSR
    clock clock_scale(
        .CCLK(CCLK),
        .clk(clk_scaled),
        .clkscale(32'd5000000)
    );
   
    
endmodule
