`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 12:42:37 AM
// Design Name: 
// Module Name: TwoBitAdder
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
