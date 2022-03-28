`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module Reductions(
    input [7:0] In,
    output Out
    );
    XorReductions myParity(In, Out);
endmodule


module AndReductions(
    input [7:0] In,
    output Out
    );
    // outpus low if any of the input bits is low
    assign Out = &In;
endmodule

module OrReductions(
    input [7:0] In,
    output Out
    );
    // outpus low iff all of the input bits are low
    assign Out = |In;
endmodule


module XorReductions(
    input [7:0] In,
    output Out
    );
    // This is a Parity Check
    // outpus high if the number high bits in the input is odd.
    assign Out = ^In;
endmodule
