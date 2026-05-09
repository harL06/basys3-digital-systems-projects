`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 14:57:01
// Design Name: 
// Module Name: lfsr_23bit
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


module lfsr_18bit
    #(parameter seed = 18'hE6)
    //#(parameter seed = 18'h0)
    (
    input clk,
    input sh_en,
    input reset,
    output [17:0] Q_out,
    output reg max_tick_reg
    );
    
    reg [17:0] Q_state; // holds current state
    wire [17:0] Q_ns; // next state
    wire Q_fb; // feedback bit
    
    always @ (posedge clk or posedge reset) begin // async -> can be reset imediately
        if (reset) begin // if  reset is HIGH, set state to seed
            Q_state <= seed;
            max_tick_reg <= 1'b0;
        end
        else if (sh_en) begin // if not being reset (enabled) then set curr state to next state
            Q_state <= Q_ns;
            if (Q_ns == seed) // if next state is the beginning seed state while its enabled, then its looped
                max_tick_reg <= 1'b1;
            else
                max_tick_reg <= 1'b0;
        end
        else begin
            max_tick_reg <= 1'b0;
        end
    end
    
    //next state logic
    assign Q_fb = Q_state[10] ^ Q_state[17]; // feedback is bits 17 & 22 XOR'd
    assign Q_ns = {Q_state[16:0], Q_fb};
    
    // output logic
    assign Q_out = Q_state;
    
endmodule
