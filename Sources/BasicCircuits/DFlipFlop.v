`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module DFlipFlop(
    input clk,
    input [3:0] D,
    input R,
    input Enb,
    output [3:0] Q,
    output [3:0] Qrs,
    output [3:0] Qra,
    output [3:0] Qrae
    );
    
    DFF fflop (clk, D, Q);
    DFFResetSync fflopRs (clk, D, R, Qrs);
    DFFResetAsync fflopRa (clk, D, R, Qra);
    DFFResetAsyncEnable fflopRae (clk, D, R, Enb, Qrae);

endmodule

      
    // NOTE 0: Inside an 'alwaya block" the `assign` statement is NOT used
    // instead `<=` , a Non-Blocking assignment is used
    // the `assign .. = ..` is a Blocking assignment
      
    // NOTE 1: Q (LHS) must be a reg type or integer/time/genvar
    
    // NOTE 2: the `input` and `ouput` are implicitly of wire types. The `wire` is
    // ommited for convinience. So we could write `input wire clk, output wire out`
    // the input and output simply dennotes the direction of the wire.
    
    // SIDENOTE: all LHS of an `assign .. = ..` statement MUST be of a `wire` type


module DFF(
    input clk,
    input [3:0] D,
    output reg [3:0] Q
    );
    
    always @(posedge clk)
        Q <= D; // reads "Q gets D"
      
endmodule

module DFFResetSync(
    input clk,
    input [3:0] D,
    input R, // reset 
    output reg [3:0] Q
    );
    
    always @(posedge clk)
        if(R == 1'b1)
            Q <= 4'b0000;
        else
            Q <= D;
      
endmodule

module DFFResetAsync(
    input clk,
    input [3:0] D,
    input R, // reset 
    output reg [3:0] Q
    );
    
    always @(posedge clk or posedge R)
        if(R == 1'b1)
            Q <= 4'b0000;
        else
            Q <= D;
      
endmodule

module DFFResetAsyncEnable(
    input clk,
    input [3:0] D,
    input R, // reset signal
    input enb, // enable signal
    output reg [3:0] Q
    );
    
    always @(posedge clk or posedge R)
    begin
        if(R == 1'b1)
            Q <= 4'b0000;
        else if (enb)
            Q <= D;
    end  
endmodule
