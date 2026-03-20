#
# Example: sqrt (double)
#
    .data
src:
    .word   100
dst:
    .double  0
idst:
    .word  0

    .text
    la       t0, src      # source integer
    lw       t2, 0(t0)
    fcvt.d.w ft2, t2
    fld      ft0, 8(t0)

    flt.d    t2, ft2, ft0 # check if < 0 ...
    bnez     t2, nosqrt   # no root then
    fsqrt.d  ft2, ft2

nosqrt:
    fsd      ft2, 8(t0)   # store float result
    fcvt.w.d t1, ft2      # convert to integer
    sw       t1, 16(t0)   # store integer result

    li       a7, 3
    fmv.d    fa0, ft2
    ecall

    li       a7, 11
    li       a0, '\n'
    ecall

    li       a7, 1
    mv       a0, t1
    ecall
