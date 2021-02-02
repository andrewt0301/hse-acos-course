#
# Example: sqrt
#
    .data
src:
    .word   100
dst:
    .float  0
idst:
    .word   0
.text
    la       t0, src    # source integer
    lw       t2, 0(t0)
    fcvt.s.w f2, t2
    flw      f0, 4(t0)

    flt.s    t2, f2, f0 # check if <0 …
    bnez     t2, nosqrt # no root then
    fsqrt.s  f2, f2
nosqrt:
    fsw      f2, 4(t0)  # store float result
    fcvt.w.s t1, f2     # convert to integer
    sw       t1, 8(t0)  # store integer result

    li       a7, 2      # print float result
    fmv.s    fa0, f2
    ecall

    li       a7, 11    # print integer result
    li       a0, '\n'
    ecall

    li       a7, 1
    mv       a0, t1
    ecall
