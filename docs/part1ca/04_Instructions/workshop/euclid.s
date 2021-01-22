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

main:
    li  a7, 5
    ecall
    mv  t1, a0

    li  a7, 5
    ecall
    mv  t2, a0

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
    li  a7, 1
    mv  a0, t1
    ecall
