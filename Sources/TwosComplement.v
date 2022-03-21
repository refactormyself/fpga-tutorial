`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//This gives as output the 2's compliment of the input 
// Does a compliment of all the bits ==> 1's TwosComplement
// and then add a 1 to the LSB
//////////////////////////////////////////////////////////////////////////////////

// 10100110

module TwosComplement(
    input [7:0] In,
    input [7:0] Out
    );
//    wire OnesCompOut[7:0];
    
//    OnesCompliment(In, OnesCompOut);
//    assign Out = OnesCompOut + 1;

    assign Out = ~In + 1;
endmodule
