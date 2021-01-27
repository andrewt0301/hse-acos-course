# Example: a recursive function that calculates a factorial.
#
# ﻿int fact (int n){
#    if (n < 1) {
#        return 1;
#     } else {
#        return n * fact(n - 1);
#    }
# }
    .text
main:
    li a7, 5
    ecall

    # call fact(a0)
    jal ra, fact

    li a7, 1
    ecall
exit:
    li a7, 10
    ecall

fact:
    # if a0 (n) < 1
    addi t0, a0, -1
    bge  t0, zero, fact_else
    # return 1
    li   a0, 1
    jalr zero, 0(ra)

    # else
fact_else:
    # save old a0 and ra to stack
    addi sp, sp, -8
    sw   ra,  4(sp)
    sw   a0,  0(sp)

    addi a0, a0, -1
    jal  ra, fact
    mv   t1, a0

    # restore old a0 and ra from stack
    lw   a0, 0(sp)
    lw   ra, 4(sp)
    addi sp, sp, 8

    # return a0 * fact(a0 - 1)
    mul  a0, a0, t1
    jalr zero, 0(ra)
