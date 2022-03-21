
# Here is the constraint file for our project

# assign the pin for BTN1 (this is written on the board) == D20 (its in the usermanual)
# to the input in our verilog code
# This is a TCL program, thus anything inside a [] is a function.
# The function "getport" search the toplevel Module in this project (ie switchToLED) for 
# signals, or input /output with the name given in its argument.
set_property PACKAGE_PIN D20 [get_ports slideSwitch]

# we tell the ??? to expect a voltage of (3V3) 3.3V on the input pin (this is in the board's schematic diagram)
# the value is "CMOS Low Votage 63"
set_property IOSTANDARD LVCMOS33 [get_port slideSwitch]

# assign the pin for LD1 (this is written on the board) to the output in our verilog code
set_property PACKAGE_PIN P14 [get_ports led]

# for the output we are the one supplying the voltage not expecting it ...
# For the PYNQ-z2 LED the resistor is of 330 ohms, if decide to drive the LED with a 3.3V then the current drawn is (0.01A) 10mA.
set_property IOSTANDARD LVCMOS33 [get_ports led]
