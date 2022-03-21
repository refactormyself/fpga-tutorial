`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 01:28:27 PM
// Design Name: 
// Module Name: MyFullAdder
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


module MyFullAdder(
     input  A,
     input  B,
     input  Cin,
     output S,
     output Cout
     );
     assign S = A^B^Cin;
     assign Cout = (A&B) | (A&Cin) | (B&Cin);
endmodule
