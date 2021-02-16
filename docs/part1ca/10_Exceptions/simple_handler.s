#
# Example with a trivial exception handler that just return to the next instruction.
#
     .text
     j main
handler:
     # Just ignore it by moving uepc to the next instruction
     csrrw  t0, uepc, zero  # load exception PC into t0
     addi   t0, t0, 4       # increment t0
     csrrw  zero, uepc, t0  # update exception PC
     uret                   # return to uepc
main:
     la     t0, handler
     csrrw  zero, utvec, t0  # set utvec (5) to the handlers address
     csrrsi zero, ustatus, 1 # set interrupt enable bit in ustatus (0)
     lw     zero, 0(zero)    # trigger trap for Load access fault

     li     a7, 10
     ecall
