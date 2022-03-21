`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 05:18:51 PM
// Design Name: 
// Module Name: AndOrCircuit
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


module AndOrCircuit(
    output out,
    input in1,
    input in2,
    input in3
    );
    
    wire andOut;
    and(andOut, in1, in2);
    or(out, in3, andOut);
endmodule
