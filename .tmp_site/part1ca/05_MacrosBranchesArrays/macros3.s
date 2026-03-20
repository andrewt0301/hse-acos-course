#
# Example demonstrating using the .eqv directive.
#
    .eqv VAL 0x123
    .eqv X t0
    .eqv Y t1
    .eqv SUM addi Y, X, VAL
main:
    li X, 0x111
    SUM
