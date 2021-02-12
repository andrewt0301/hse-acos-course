#
# Example with a trivial exception handler that just return to the next instruction.
#
     .text
     j main
handler: # Just ignore it by moving epc (65) to the next instruction
     csrrw   t0, 65, zero
     addi    t0, t0, 4
     csrrw   zero, 65, t0
     uret
main:
     la     t0, handler
     csrrw  zero, 5, t0   # set utvec (5) to the handlers address
     csrrsi zero, 0, 1    # set interrupt enable bit in ustatus (0)
     lw     zero, 0(zero) # trigger trap for Load access fault

     li a7, 10
     ecall
