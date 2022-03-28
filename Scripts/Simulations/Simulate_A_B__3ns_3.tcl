# relaunch_sim
restart

# add_force {/Ops_Assign_Concat_Bitwidth/In} -radix bin {1111 0ns}

add_force A -radix bin {1111 0ns}
add_force B -radix bin {1000 0ns}
run 3 ns

add_force A -radix bin {1011 0ns}
add_force B -radix bin {1111 0ns}
run 3 ns

add_force A -radix bin {1100 0ns}
add_force B -radix bin {1111 0ns}
run 3 ns
