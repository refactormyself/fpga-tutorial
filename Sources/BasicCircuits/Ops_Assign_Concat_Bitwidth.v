`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module Ops_Assign_Concat_Bitwidth(
    input [3:0] In,
    output [2:0] Out1,
    output [4:0] Out2
    );
    
    
//    assign Out1 = In;  // here In[2:0] is assigned 
//    assign Out2 = In;   // here all of In[3:0] is aasigned to Out2[3:0] 
    
    assign Out1 = In[3:1]; // here we are specific about the bits to be assigned.
    
    // NOTE 1: if we unccomment the first assignment to Out1, unlike normal programming
    // the value will not be overwritten, instead we have two connection into the port Out1
    // if we simulated it we get 
    // '1' -  when the simulator is sure all connections will always result in a 1 (high voltage - Shows GREEN color)   
    // '0' -  when the simulator is sure all connections will always result in a 0 (low voltage - Shows GREEN color)   
    // 'X' -  when the simulator is NOT sure, because all connections may result in a 1 or 0   (Shows RED color ==> MAY not be a problem, CONFIRM !) 
    // 'Z' -  when the simulator is sure that there is no connection or a set value for this port (Shows BLUE color ==> PROBLEM !)   
    
    // SIDE NOTE:
    // Impedance reduces to resistance in circuits carrying steady direct current. 
    // The magnitude of the impedance Z of a circuit is equal to the maximum value of the potential difference,
    // or voltage, V (volts) across the circuit, divided by the maximum value of the current I (amperes) through the circuit,
    // or simply Z = V/I.
    

    // NOTE 2: ...
    
    // NOTE 3: it is helpful to read In[3:0] as "bits 3 to bit zero of In"
    // so In ==> {In[3], In[3], In[2], In[1], In[0]}
    assign Out1 = {In[3], In[3], In[2], In[1], In[0]}; // {} is for concertenating bits
    
    // NOTE 4: Since Out2[4] from above is left unassigned, it will always be given a value of 0.
    // But what if we want it to always have the value '1', this means we want to connect it to Vcc
    // We may be tempted to do this :
    assign Out2 = {1, In}; // Concertenate the literal 1 to the start of 'In'
    
    // BUT just that '1' is a 32-bit integer value! (but it works, since we pick the last bit!)
    // This is the correct way to achieve our goal:
    assign Out2 = {1'b1, In}; 
    
    // NOTE 4 contd: "1'b1" means researve 1 bit; store in a (b) binary of the value 1
    // the form is:
    // "NumOfBits"'"Base""Value"
    // Bases : b/B - binary; d/D - decimal; o/O - octal; h/H - hexadecimal
    // "2'd3" means researve 2 bits; store in a (d) decimal of the value 3 
    
    // WatchOut: If the value has nore bits than you reserve, only the lower bits are assigned!
    // so "2'd5" ==> "01" instead of "101"
    
    // NOTE 5: We concatenate outputs and verilog will see it has a single unit
    // 
    assign {Out1, Out2}  = {In, In}; // Out1 ==> In[3:1]; Out2 ==> {In[0], In}
    
//    wire wireArray[2:0]; // this is an array NOT a Bus which we have previously used

endmodule
