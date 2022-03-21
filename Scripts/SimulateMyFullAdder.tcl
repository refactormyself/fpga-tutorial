restart
add_force A {1 0ns}
add_force B {1 0ns}
add_force Cin {1 0ns}
run 10 ns

add_force A {1 0ns}
add_force B {0 0ns}
add_force Cin {0 0ns}
run 10 ns
