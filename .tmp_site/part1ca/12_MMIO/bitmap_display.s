#
# Example that demonstrates MMIO in Bitmap Display.
#
    .eqv   ALLSIZE 0x20000      # videomemory size (in words)
    .eqv   BASE    0x10010000   # MMIO base
    .text
    li s0, BASE
again:
    mv   a0, zero
    li   a1, ALLSIZE             # Max 512*Y+X + 1
    li   a7, 42
    ecall                        # random 512*Y+X

    slli t2, a0, 2               # make an address by multiplying to 4
    add  t2, s0, t2

    mv   a0, zero
    li   a1, 0x1000000           # MAX RGB value + 1
    li   a7, 42
    ecall                         # random color

    sw   a0, 0(t2)
    j    again