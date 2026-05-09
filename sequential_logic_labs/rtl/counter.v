`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2026 10:29:21
// Design Name: 
// Module Name: counter
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


module counter(
    input [4:0] button_input,
    input clk, reset,
    output [3:0] anode_sel,
    output [6:0] led_out
    );
    
    wire [7:0] Q;
    wire [4:0] buttons;
    reg [7:0] Q_next;
    
    d_ff_reset DFF0 (.clk(clk), .reset(reset), .q(Q[0]), .d(Q_next[0]));
    d_ff_reset DFF1 (.clk(clk), .reset(reset), .q(Q[1]), .d(Q_next[1]));
    d_ff_reset DFF2 (.clk(clk), .reset(reset), .q(Q[2]), .d(Q_next[2]));
    d_ff_reset DFF3 (.clk(clk), .reset(reset), .q(Q[3]), .d(Q_next[3]));
    d_ff_reset DFF4 (.clk(clk), .reset(reset), .q(Q[4]), .d(Q_next[4]));
    d_ff_reset DFF5 (.clk(clk), .reset(reset), .q(Q[5]), .d(Q_next[5]));
    d_ff_reset DFF6 (.clk(clk), .reset(reset), .q(Q[6]), .d(Q_next[6]));
    d_ff_reset DFF7 (.clk(clk), .reset(reset), .q(Q[7]), .d(Q_next[7]));
    
    debouncer DB (.reset(reset), .button_in(button_input), .button_out(buttons), .clk(clk));
    
    seven_segment_controller SEG (.clk(clk), .reset(reset), .temp(Q), .LED_out(led_out), .anode_select(anode_sel));
    
    always @ (*) begin
        Q_next = Q;
        if (buttons[0] == 1 || buttons[3] == 1) begin
            Q_next = Q + 1;
        end
        if (buttons[2] == 1 || buttons[1] == 1) begin
            Q_next = Q - 1;
        end
        if (buttons[4] == 1) begin
            Q_next = 22;
        end
    end
    
    
endmodule
