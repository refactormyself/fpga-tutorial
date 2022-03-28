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


// TODO:
// A short cut for finding the 2's compliment
// - Start from the LSB (right-most bit)
// - Write all all the bit values until you enounter a '1'
// - write that '1` down
// - invert all the bits that comes after it