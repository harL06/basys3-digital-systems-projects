`timescale 1ns / 1ps

// 6 states -> 3 bit vec can hold 8
// A - 000
// B - 001
// C - 010
// D - 011
// E - 100
// F - 101


module fsm(
    input in,
    input clk,
    input reset,
    output reg [2:0] state,
    output reg out
    );
    
    reg [2:0] next_state;
    
    always @ (posedge  clk or posedge reset) begin
        if (reset) //alway start from State A on reset
            state <= 3'b000;
        else
            state <= next_state;
    end
    
    always @ (*) begin // next state logic
        case (state)
            3'b000: begin // state A
                if (in == 1'b0)
                    next_state <= 3'b000;
                else
                    next_state <= 3'b001;
            end
            
            3'b001: begin // state B
                if (in == 1'b0)
                    next_state <= 3'b010;
                else
                    next_state <= 3'b001;
            end
            
            3'b010: begin // state C
                if (in == 1'b0)
                    next_state <= 3'b011;
                else
                    next_state <= 3'b001;
            end
            
            3'b011: begin // state D
                if (in == 1'b0)
                    next_state <= 3'b000;
                else
                    next_state <= 3'b100;
            end
            
            3'b100: begin // state E
                if (in == 1'b0)
                    next_state <= 3'b101;
                else
                    next_state <= 3'b001;
            end
            
            3'b101: begin // state F
                if (in == 1'b0)
                    next_state <= 3'b011;
                else
                    next_state <= 3'b001;
            end
            default:
                next_state <= 3'b000;
        endcase
    end
    
    always @ (*) begin //outputt logic
        if (state == 3'b101) // outputs a 1 if in state F
            out <= 1'b1;
        else
            out <= 1'b0; // output zero for all states that aren't F
    end
    
endmodule
