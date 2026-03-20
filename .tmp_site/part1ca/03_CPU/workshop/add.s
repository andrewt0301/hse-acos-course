#
# Inputs two integers and prints their sum.
#
    .text
main:
    # x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    # y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0

    # z: t2 = t0 + t1
    add t2, t0, t1

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
