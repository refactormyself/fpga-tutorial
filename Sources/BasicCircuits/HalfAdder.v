`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module HalfAdder(
    input A,
    input B,
    output C,
    output S
    );

    and(C,A,B);
    xor(S,A,B);
endmodule