`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
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
