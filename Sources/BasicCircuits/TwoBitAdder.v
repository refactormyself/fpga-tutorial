`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module TwoBitAdder(
    input [1:0] A,
    input [1:0] B,
    output [2:0] S
    );
    wire halfAdderOut;
     
    HalfAdder halfAdder(
    .A(A[0]), .B(B[0]), .C(halfAdderOut),
    .S(S[0])
    );
    
    FullAdder fullAdder(
    .A(A[1]), .B(B[1]), .Cin(halfAdderOut),
    .S(S[1]), .Cout(S[2])
    );
    
endmodule
