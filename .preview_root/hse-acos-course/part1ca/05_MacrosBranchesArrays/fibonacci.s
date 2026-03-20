#
# Example that calculates the Fibonacci sequence.
#
main:
    mv   t0, zero
    li   t1, 1

    li   a7, 5
    ecall
    mv   t3, a0
fib:
    beqz t3, finish
    add  t2, t1, t0
    mv   t0, t1
    mv   t1, t2
    addi t3, t3, -1
    j    fib
finish:
    li   a7, 1
    mv   a0, t0
    ecall
