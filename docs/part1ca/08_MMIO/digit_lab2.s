#
# Example that demonstrates MMIO in Digital Lab Sim.
#
    lui     s0, 0xffff0            # MMIO base
    mv      s1, zero               # counter
    mv      s2, zero               # previous value
    li      s3, 20                 # counter limit
loop:
    mv      t1, zero               # scans accumulator
    li      t0, 1                  # 1st row
    sb      t0, 0x12(s0)           # scan
    lb      t0, 0x14(s0)           # get result
    or      t1, t1, t0             # apply it to accumulator
    li      t0, 2                   # 1nd row
    sb      t0, 0x12(s0)
    lb      t0, 0x14(s0)
    or      t1, t1, t0
    li      t0, 4                   # third row
    sb      t0, 0x12(s0)
    lb      t0, 0x14(s0)
    or      t1, t1, t0
    li      t0, 8                   # fourth row
    sb      t0, 0x12(s0)
    lb      t0, 0x14(s0)
    or      t1, t1, t0

    beq     t1, s2, same
    sb      t1, 0x10(s0)           # write accumulator to LED

    mv      a0, t1                 # print binary
    li      a7, 35
    ecall
    li      a0, 10
    li      a7, 11
    ecall

    addi    s1, s1, 1              # counter increment
    sb      s1, 0x11(s0)           # write counter to another LED
    mv      s2, t1
same:
    ble     s1, s3, loop

    li      a7, 10
    ecall
