restart
add_force clk {1 0ns}
add_force D {1111 0ns}
run 3 ns

add_force clk {1 0ns}
add_force D {1001 0ns}
run 3 ns

add_force clk {0 0ns}
add_force D {1101 0ns}
run 3 ns
