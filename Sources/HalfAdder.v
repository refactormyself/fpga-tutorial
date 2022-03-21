`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/21/2022 12:07:26 AM
// Design Name:
// Module Name: HalfAdder
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


module HalfAdder(
    input A,
    input B,
    output C,
    output S
    );

    and(C,A,B);
    xor(S,A,B);
endmodule
