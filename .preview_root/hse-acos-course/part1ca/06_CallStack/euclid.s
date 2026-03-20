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
    read_int (t0)
    read_int (t1)

    mv  a0, t0
    mv  a1, t1
    jal euclid

    li  a7, 1
    ecall
    li a7, 10
    ecall

euclid:
    beq a0, a1, finish
    blt a0, a1, if_less
    sub a0, a0, a1
    j   euclid
if_less:
    sub a1, a1, a0
    j   euclid
finish:
    jr ra
