`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2022 07:56:35 PM
// Design Name: 
// Module Name: switchToLED
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

module switchToLED(
    input slideSwitch,
    output led
    );
    
// This is basically create a wire between the pin constrained to "slideSwitch" and the pin constrained to the "led"
// The contraining is done in the constrained file.
    assign led = slideSwitch;
    
endmodule
