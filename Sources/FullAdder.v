`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/21/2022 12:07:26 AM
// Design Name:
// Module Name: FullAdder
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

module FullAdder(
                 input  A,
                 input  B,
                 input  Cin,
                 output S,
                 output Cout
                 );
   wire                 and1Out;
   wire                 and2Out;
   wire                 and3Out;

   and(and1Out,A,B);
   and(and2Out,A,Cin);
   and(and3Out,Cin,B);

   or(Cout,and1Out,and2Out,and3Out);
   xor(S,A,B,Cin);

endmodule
