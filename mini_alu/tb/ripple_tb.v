// Listing 1.7
// The `timescale directive specifies that
// the simulation time unit is 1 ns  and
// the simulation timestep is 10 ps
`timescale 1 ns/10 ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2026 09:48:27
// Design Name: 
// Module Name: ripple_tb
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


module ripple_tb;
   // signal declaration
   reg  [5:0] in1;
   reg  [5:0] in2;
   reg select;
   wire  [5:0] test_out;
   wire v, cout;
   

   // instantiate the circuit under test
   six_bit_ripple_adder uut
      (.x(in1), .y(in2), .sel(select), .sum(test_out), .overflow(v), .c_out(cout));

   //  test vector generator
   initial
   begin
   // both positive
      select = 1'b00;
      in1 = 6'b000100;
      in2 = 6'b001001;
      # 20;
      select = 1'b01;
      # 20;
      
    // both negative
      select = 1'b00;
      in1 = 6'b111000;
      in2 = 6'b111101;
      # 20;
      select = 1'b01;
      # 20;
      
      // 1 pos 1 neg
      select = 1'b00;
      in1 = 6'b000111;
      in2 = 6'b101101;
      # 20;
      select = 1'b01;
      # 20;
      
      // zeros
      select = 1'b00;
      in1 = 6'b000000;
      in2 = 6'b000000;
      # 20;
      select = 1'b01;
      # 20;
      
      // given
      select = 1'b00;
      in1 = 6'b000001;
      in2 = 6'b000100;
      # 20;
      
      // overglo
      select = 1'b00;
      in1 = 6'b011111;
      in2 = 6'b011110;
      # 20;

      $stop;
   end
   

endmodule
