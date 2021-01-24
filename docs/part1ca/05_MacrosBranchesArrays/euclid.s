#
# Calculates the greatest common divisor of two values using the Euclidean algorithm.
#
# function gcd(a, b)
#    while a ≠ b
#        if a > b
#            a := a − b
#        else
#            b := b − a
#    return a

    .include "macrolib.s"
main:
    read_int (t1)
    read_int (t2)

loop:
    beq t1, t2, finish

    slt t0, t1, t2
    bne t0, zero, if_less

    sub t1, t1, t2
    b   loop

if_less:
    sub t2, t2, t1
    b   loop

finish:
    print_int (t1)

