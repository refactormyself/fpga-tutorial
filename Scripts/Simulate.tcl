restart
add_force B -radix hex {2 0ns}
add_force A -radix hex {3 0ns}
run 10 ns

add_force B -radix hex {1 0ns}
add_force A -radix hex {2 0ns}
run 10 ns
