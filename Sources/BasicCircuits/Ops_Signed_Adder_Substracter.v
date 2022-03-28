`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module Ops_Signed_Adder_Substracter(
                 input [3:0] A,
                 input [3:0]  B,
                 output [4:0] SumU,
                 output [4:0] SumS,
                 output [4:0] SubU,
                 output [4:0] SubS,
                 output [4:0] Mul,
                 output [4:0] Div,
                 output [4:0] Mod,
                 output [4:0] SqrSum,
                 output [4:0] HalfSum,
                 output [4:0] ArithSqrSum,
                 output [4:0] ArithHalfSum
                 );
    
    //NOTE 1: Given a binary value say '1101', without any assumption it's impossible to 
    // determine the decimal representation`.
    // The normal assumption is that its "Unisigned", so it rep. decimal '13'
    // But it may be a "signed" value, it this case it rep. '-3'
    // For "unsigned" its normal conversion since all bits are used.
    // For "signed" the MSB (leftmost bit) rep. the sign: (1 == -ve; 0 == +ve)
    //      = To get the actual value, we then find the 2's compliment of the whole value
    
    // NOTE 2: What range of values can be represented by an n-bit binary 
    // If it's unsigned: 0 .. (2^n) -1
    //      e.g: for 4 bits we can rep 0 .. 15 (16 -1)
    // If it's signed -2^(n-1) to +2^(n-1) -1
    //      e.g: for 4 bits we can rep. -8 ... +7 (8-1)  
    //                          this is 1000 ... 0111
    
    Unsigned_4bit_Adder u_adder(.A(A), .B(B), .Sum(SumU));
    Signed_4bit_Adder s_adder(.A(A), .B(B), .Sum(SumS));
    Unsigned_4bit_Suber u_suber(.A(A), .B(B), .Sum(SubU));
    Signed_4bit_Suber s_suber(.A(A), .B(B), .Sum(SubS));
    
    Unsigned_4bit_Multiplier multer(.A(A), .B(B), .Sum(Mul));
    Unsigned_4bit_Divider diver(.A(A), .B(B), .Sum(Div));
    Unsigned_4bit_Modulo mod(.A(A), .B(B), .Sum(Mod));

    assign SqrSum = (A + B) << 1;
    assign HalfSum = (A + B) >> 1;
    
    assign ArithSqrSum = (A + B) <<< 1;
    assign ArithHalfSum = (A + B) >>> 1;
    
endmodule

    // NOTE 3: 
    // Adding n-bits gives at most (n+1)-bits
    // Multiplying n-bits gives at most (2n)-bits
    
    // NOTE 4:
    // A - B is implemented as A + (2's complement of B)
    
    // NOTE 5:
    // Raw implementation of Multiplication  would invlove series of And-gates and Adders
    // If we are multiplying 'A' by a constant number 'n', we LEFT SHIFT 'A' by 'm': n = 2^m 
    // If we are multiplying 'A' by a constant number 'n', we LEFT SHIFT 'A' by 'm': n = 2^m 
    // If we are substracting 'A' by a constant number 'n', we RIGHT SHIFT 'A' by 'm': n = 2^m
    
    // NOTE 6:
    // Bit shiting is an efficient operation because it does not need any gate
    // (1111 >> 2) we simply ground the 2 left-most bits to get '0011' 
    // (1111 << 2) we simply ground the 2 right-most bits to get '1100' 

module Unsigned_4bit_Adder(
                 input [3:0] A,
                 input [3:0] B,
                 output [4:0]Sum
                 );
    assign Sum = A + B;
    
endmodule

module Signed_4bit_Adder(
                 input [3:0] A,
                 input [3:0] B,
                 output [4:0] Sum
                 );
    assign Sum = $signed(A) + $signed(B);
    
endmodule

module Unsigned_4bit_Suber(
                 input [3:0] A,
                 input [3:0] B,
                 output [4:0]Sum
                 );
    assign Sum = A - B;
    
endmodule

module Signed_4bit_Suber(
                 input [3:0] A,
                 input [3:0] B,
                 output [4:0] Sum
                 );
    assign Sum = $signed(A) - $signed(B);
    
endmodule

module Unsigned_4bit_Multiplier(
                 input [3:0] A,
                 input [3:0] B,
                 output [4:0]Sum
                 );
    assign Sum = A * B;
    
endmodule


module Unsigned_4bit_Divider(
                 input [3:0] A,
                 input [3:0] B,
                 output [4:0]Sum
                 );
    assign Sum = A / B;
    
endmodule

module Unsigned_4bit_Modulo(
                 input [3:0] A,
                 input [3:0] B,
                 output [4:0]Sum
                 );
    assign Sum = A % B;
    
endmodule