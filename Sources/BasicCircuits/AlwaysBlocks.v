`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module AlwaysBlocks(
    input clk,
    input [3:0] D,
    output reg [3:0] Q
    );
    
    wire [3:0] normal;
    reg [3:0] special;
    
    always @ (negedge clk)
        special <= D;       // non-blocking assignment ONLY to a reg. 

    assign normal = ~special; // blocking assignment, ONLY to a wire. It is allowed in always blocks

    // it is possble to have multiple always blocks inside a module, however ...
    always @ (negedge clk)
//        special <= D;  // you assign the same signal again inside another always block 
        Q <= normal;
        assign normal = ~special;

endmodule

module Flop(
    input clk,
    input [3:0] D,
    output reg [3:0] Q
    );
    
    // This is a sequential always block, It has memory
    always @ (negedge clk)
        Q <= D;      
        
    // Though nothing specifiefies remembrance in this construct,
    // the previous state of Q is preserved (remembered) until the negedge of `clk` is set
    // At the start the value of Q is unknown !

endmodule

module Comb(
    input inv,
    input [3:0] data,
    output reg [3:0] out
    );
    
    // This is a Combinational always block, It has NO memory
    always @ (inv, data) // sensitive to any change in `inv` and `data`
        if (inv) out <= ~data; // we invert the data
        else     out <= data; // we return the data
        
    // This is a combinational circuit, it has no idea of the previous state
    // The key here is that:
    //    - *There is no condition/state (in `always block` and `if .. else` block) in which the output is not assigned a value
    //    - *All the components inside the always block is included in the sensitivity list ==> `always @(*)`
    // More NOTES: 
    //    - It's sensitive to everything (nothing is excluded), so it doesn't need to remenber any previous state, only needs to know that it has change
    //    - If a commponent is exclluded from the sentivity list, we don't know when or if it has changed, so the previous state persists at least from the
    //        perspective of this circuit. After many cycles we can still access that state - THIS IS MEMORY (Remembrance) ==> Combinatorial Circuit
    //    - Be careful to satisfy the stared conditions above when using an always block to describe a combinatorial circuit otw you'll design a sequential circuit
    //
    //    - `if .. else` are only used inside an always block
    //    - `casex` are used to check for "unknown' or 'i dont care'
    
    
    // NOTES: (Assigments in the always block)
    //  - Assignments are not effective until the end of the block (after the clock cycle)
    //  - All assignments are made in parallel and the process flow is not blocked
    //  e.g: a <= 2'b01;  b <= a;
    //  - the two assignments are done in parallel (at the same time. 
    //    Since at that specific time the value of `a` is not known,
    //    b is not yet equal to `2'b01` 
    //    The sequential circuit doesn't wait for a to be resolved, it continues the process flow <-- NON-BLOCKING
    //    the value of `b` is resolved after the always block
    //
    //  contrast e.g: assign a = 2'b01; assign b = a;
    //  - Here the Combinatorial circuit will wait for the value of `a` to be resolved and immediately assign it to `b`
    //    This waiting BLOCKS the process flow untitl `a` is resolved.  <--- BLOCKING
    //
    //  - Non-blocking statements allow operating on "old" values. This is needed to describe sequetial logic.
    //  - Blocking statements allow (enforce) a sequence of operations. Operates on immediately updated values
    //  - *** If the sensitivity is correct, blocks with non-blocking statements will always evaluate to teh same result.
    
    
     

endmodule

