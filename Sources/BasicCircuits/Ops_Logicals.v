`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module Ops_Logicals(
    input [7:0] A,
    input [7:0] B,
    input S,
    output[3:0] outMutex4,
    output[7:0] outMutex8,
    output out1,
    output out2,
    output out3,
    output outTenar,
    output outComp
    
    );
    
    IsEqual eq(.A(A), .B(B), .out(out1));
    IsGreater grt(.A(A), .B(B), .out(out2));
    IsLess less(.A(A), .B(B), .out(out3));
    
    
    //Tenary
    assign outTenar = (A > B) ? 2'b10 : 2'b01;
    
    Comparator4Bit_1 cmp(A, B, outComp);
    
    MyMUX mux1 (A, B, S, outMutex4);
    
    // MyMUX_Param #(8) mux2 (A, B, S, outMutex8);
    MyMUX_Param #(.width(8)) mux2 (A, B, S, outMutex8);
    
endmodule


// This is implemented with 8 XOR gates
// We exploit it property that: it give a 1 iff both inputs are true otw gives 0 
module IsEqual(
    input [7:0] A,
    input [7:0] B,
    input out
    );
    
    assign out = (A == B);
endmodule

// To implement this: 
// find (B - A), if there is a "carry" then A < B else A >= B
module IsLess(
    input [7:0] A,
    input [7:0] B,
    input out
    );
    
    assign out = (A < B);
endmodule

module IsGreater(
    input [7:0] A,
    input [7:0] B,
    input out
    );
    
    assign out = (A > B);
endmodule

//// Code for COMPARATOR

module MyXnor(
    input A,
    input B,
    input out
    );
    
    assign out = ~(A ^ B); // Not Xor
endmodule

module MyAnd(
    input A,
    input B,
    input out
    );
    
    assign out = (A & B);
endmodule

// 4 Bit comparator
module Comparator4Bit_1(
    input [3:0] A,
    input [3:0] B,
    input out
    );
    
    wire XnorResult [3:0]; // we use array here, not a bus!
    wire AndResult [1:0];
    
    MyXnor xnor0 ( .A(A[0]), .B(B[0]), .out(XnorResult[0]) );
    MyXnor xnor1 ( .A(A[1]), .B(B[1]), .out(XnorResult[1]) );
    MyXnor xnor2 ( .A(A[2]), .B(B[2]), .out(XnorResult[2]) );
    MyXnor xnor3 ( .A(A[3]), .B(B[3]), .out(XnorResult[3]) );
    
    MyAnd and0 ( .A(XnorResult[0]), .B(XnorResult[1]), .out(AndResult[0]) );
    MyAnd and1 ( .A(XnorResult[2]), .B(XnorResult[3]), .out(AndResult[1]) );

    MyAnd and2 ( .A(AndResult[0]), .B(AndResult[1]), .out(out) );

endmodule

module Comparator4Bit_2(
    input [3:0] A,
    input [3:0] B,
    input out
    );
    
    wire [3:0] XnorResult;

    assign XnorResult = ~(A ^ B);
    
    assign out = &XnorResult;

endmodule

module Comparator4Bit_3(
    input [3:0] A,
    input [3:0] B,
    input out
    );
    
    assign out = (A == B) ? 1'b1: 1'b0;

endmodule

module MyMUX(
    input [3:0] A,
    input [3:0] B,
    input S,
    input [3:0] out
    );

    assign out = S ? A : B;

endmodule

module MyMUX_Param
    // we can parameterise the module
    #(parameter width = 8) // default value is 8
    
    (
    input [width-1:0] A,
    input [width-1:0] B,
    input s,
    input [width-1:0] out
    );

    assign out = s ? A : B;

endmodule
