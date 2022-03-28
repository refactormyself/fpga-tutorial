# This script creates a Vivado Project named "BasicCircuits"
# It adds the properties for the TUL's Pynq-Z2 board
# It overwrites existing project in the location
# It adds all source files from the given folder
#
# Usage: $ vivado -source basic-circuits.tcl &


set PROJECT_NAME BasicCircuits

# ref: https://stackoverflow.com/a/23285361
#      https://stackoverflow.com/a/24177213
set SCRIPT_PATH [ file dirname [ file normalize [ info script ] ] ]
cd $SCRIPT_PATH

# this scripts assume its located at $REPO_ROOT/Scripts/CreateProjects
cd ../..
set REPO_ROOT [pwd]
set PROJECT_ROOT ${REPO_ROOT}/Projects/${PROJECT_NAME}

create_project ${PROJECT_NAME} ${PROJECT_ROOT} -force -part xc7z020clg400-1

set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property target_language verilog [current_project]

add_files -norecurse ${REPO_ROOT}/Sources/BasicCircuits

# update sources just like the GUI does automatically
update_compile_order -fileset sources_1
