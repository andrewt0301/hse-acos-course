.globl	main
.text
main:
    la      t1, handler
    csrw    t1, utvec
    csrsi   ustatus, 1

loop:
    li      a7, 5       # Input address
    ecall
    beqz    a0, done    # If 0, then done
    andi    t0, a0, 3   # Is address multiple of 4?
    beqz    t0, read    # If yes, then read

write:
    andi    a0, a0, -4  # Write, erase 2 lower bits of address
    mv      t1, a0      # This is "virtual address"
    li      a7, 5       # Input value
    ecall
    mv      t0, a0      # Prepate t0
    sw      t0, (t1)    # Write a value to "virtual memory"
    b       loop

read:
    lw      t0, (a0)    # Read a value from "virtual memory"
    mv      a0, t0
    li      a7, 1       # Print the value
	ecall
    li      a0, '\n'    # Print new line
    li      a7, 11
    ecall
    b       loop

done:
    li      a7, 10      # Exit
    ecall
