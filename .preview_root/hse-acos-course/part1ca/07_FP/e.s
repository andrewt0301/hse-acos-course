#
# Example: calculates e as an infinite sum: 1/n! + 1/(n-1)! + ...
#          with the specified precision ε = 1/(10 ** k))
#
    .data
one:
    .double 1
ten:
    .double 10

    .text
main:
    fld     f2, one, t0   # 1
    fsub.d  f4, f4, f4    # n = 0
    fmv.d   f6, f2        # n!
    fmv.d   f8, f2        # here will be e
    fld     f10, ten, t0  # here will be ε
    fmv.d   f0, f2        # decimal length k

    li      a7, 5
    ecall
enext:
    blez    a0, edone     # 10 ** (k+1)
    fmul.d  f0, f0, f10
    addi    a0, a0, -1
    j       enext
edone:
    fdiv.d  f10, f2, f0   # ε

loop:
    fadd.d  f4, f4, f2    # n = n+1
    fmul.d  f6, f6, f4    # n! = (n-1)! * n
    fdiv.d  f0, f2, f6    # next summand
    fadd.d  f8, f8, f0
    flt.d   t0, f0, f10   # next summand < ε
    beqz    t0, loop

    li      a7, 3         # output a double
    fmv.d   fa0, f8
    ecall
