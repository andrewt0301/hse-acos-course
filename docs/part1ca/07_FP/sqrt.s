#
# Example: sqrt (float)
#
    .data
src:
    .word   100
dst:
    .float  0
idst:
    .word   0

    .text
    la       t0, src      # source integer
    lw       t2, 0(t0)
    fcvt.s.w ft2, t2
    flw      ft0, 4(t0)

    flt.s    t2, ft2, ft0 # check if < 0 ...
    bnez     t2, nosqrt   # no root then
    fsqrt.s  ft2, ft2

nosqrt:
    fsw      ft2, 4(t0)   # store float result
    fcvt.w.s t1, ft2      # convert to integer
    sw       t1, 8(t0)    # store integer result

    li       a7, 2        # print float result
    fmv.s    fa0, ft2
    ecall

    li       a7, 11       # print new line
    li       a0, '\n'
    ecall

    li       a7, 1        # print integer result
    mv       a0, t1
    ecall
