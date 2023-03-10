#
# Example that demonstrates MMIO in Digital Lab Sim.
#
# It works with hexadecimal keyword.
#
# See Help on Digital Lab Sim for details.
#
.macro exit
    li      a7, 10
    ecall
.end_macro

    .text
main:
    lui      s0, 0xffff0    # MMIO base

    la       t0, handler    # load handler address
    csrrw  zero, utvec, t0  # set utvec to the handlers address
    csrrsi zero, ustatus, 1 # set interrupt enable bit in ustatus
    li       t0, 0x100
    csrrw  zero, uie, t0    # enable handling of the specific interrupt

    li      t0, 0x8F        # enable interrupts in Digital Lab Sim
    sb      t0, 0x12(s0)    # scan
loop:
    wfi
    j       loop

end:
    exit

handler:
    li      t0, 0x1       # check first row
    sb      t0, 0x12(s0)  # scan
    lb      t1, 0x14(s0)  # get result
    bnez    t1, pressed   # process key pressed

    li      t0, 2         # check second row
    sb      t0, 0x12(s0)
    lb      t1, 0x14(s0)
    bnez    t1, pressed

    li      t0, 4         # check third row
    sb      t0, 0x12(s0)
    lb      t1, 0x14(s0)
    bnez    t1, pressed

    li      t0, 8         # check fourth row
    sb      t0, 0x12(s0)
    lb      t1, 0x14(s0)
    bnez    t1, pressed

pressed:
    li      t0, 0x8F      # enable interrupts in Digital Lab Sim
    sb      t0, 0x12(s0)  # scan

    uret                  # return to uepc
