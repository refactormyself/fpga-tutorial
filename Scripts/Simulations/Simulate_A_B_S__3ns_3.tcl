# relaunch_sim
restart

# add_force {/Ops_Assign_Concat_Bitwidth/In} -radix bin {1111 0ns}

add_force A -radix dec {150 0ns}
add_force B -radix dec {255 0ns}
add_force S  {0 0ns}
run 3 ns

add_force A -radix dec {100 0ns}
add_force B -radix dec {33 0ns}
add_force S  {1 0ns}
run 3 ns

add_force A  -radix dec {50 0ns}
add_force B  -radix dec {50 0ns}
add_force S  {0 0ns}
run 3 ns
