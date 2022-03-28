# This scripts takes in one argument: TOP_FILE
# It will prompt for error if the argument is not passed in
# The passed in file is set as the Top source file
# The values of A and B are then set, the simulation is run for 3ns
#
# Usage: *** THIS WILL NOT WORK *** - https://stackoverflow.com/a/39223185
# $ vivado -mode batch -source test.tcl -tclargs file

if { $argc != 1 } {
    puts "Please pass in the source file you intend make Top."
    puts " The start_simulation.tcl script requires one source file."
    puts "For example, start_simulation.tcl MyAdder"
    puts "Please try again."
} else {

    launch_simulation

    set_property top [lindex $argv 0] [get_filesets sim_1]
    set_property top_lib xil_defaultlib [get_filesets sim_1]


    add_force A -radix bin {1111 0ns}
    add_force B -radix bin {1000 0ns}
    run 3 ns

    add_force A -radix bin {1011 0ns}
    add_force B -radix bin {1111 0ns}
    run 3 ns

    add_force A -radix bin {1100 0ns}
    add_force B -radix bin {1111 0ns}
    run 3 ns

}
