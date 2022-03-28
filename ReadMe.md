## What is this?
Notes/Collection of basic Hardware designs I am creating while learning to program an FPGA. 
- I am using the [TUL's Pynq-Z2 Board](board_file/pynq-z2/A.0/pynq_z2.jpg).
- I am using verilog
- My Vivado version is 2020.2

## What's inside?

### - SCRIPTS:
- *`Scripts/CreateProjects/basic-circuits.tcl`*     
This script creates a Vivado Project named "BasicCircuits" in the *Projects* directory (it creates it if it doesnt exist). It adds the properties for the TUL's Pynq-Z2 board. Existing project at the same location will be overwritten. It adds all source files from *`Sources/BasicCircuits/`*.   
Usage: `$ vivado -source basic-circuits.tcl &`

- *`Scripts/Simulations/`*
The tcl scripts in this folder can be used to automatically 'force' set constant values during design simulations. They are named in form:    
`Simulate_input1_input2__10ns_2.tcl`   
This would set values for two input wires with the specific names. The simulation with run for 10 nanoseconds and in 2 cycles.

### - VERILOG CODE:

