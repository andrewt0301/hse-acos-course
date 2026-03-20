#
# Example that demonstrates MMIO in Digital Lab Sim.
#
# It works with Seven segment display.
#
# See Help on Digital Lab Sim for details.
#
    .text
main:
    lui   t3, 0xffff0    # MMIO address high half
    li    t1, 0xdb
    sb    t1, 0x10(t3)   # (0xffff0000+0x10)
    li    t2, 0x66
    sb    t2, 0x11(t3)   # (0xffff0001+0x10)
