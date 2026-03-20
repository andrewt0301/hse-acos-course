    .text
    
.macro exit
    li a7, 10
    ecall
.end_macro

# Main function
main:
    li a7, 5       # Enter element count
    ecall

    mv s1, a0      # s1 stores element count
    slli s2, a0, 2 # s2 stores size in bytes (N * 4)
    sub sp, sp, s2 # Allocares 4 * N on stack
    mv s0, sp      # s0 stores array address

    mv a0, s0
    mv a1, s1
    call read

    mv a0, s0
    mv a1, s1
    call print

    mv a0, s0
    mv a1, s1
    call func

    li a7, 1
    ecall

    add sp, sp, s2 # Deletes array from stack

    exit

# Reads integer values and stores them in an array.
# a0 - address of array start
# a1 - number of elements
read:
    mv t0, a0
    mv t1, a1
read.loop:
    beqz t1, read.done
    li a7, 5
    ecall
    sw a0, 0(t0)
    addi t0, t0, 4
    addi t1, t1, -1
    j read.loop
read.done:
    ret

# Prints the contents of an integer array
# a0 - address of array start
# a1 - number of elements
print:
    mv t0, a0
    mv t1, a1
print.loop:
    beqz t1, print.done
    li a7, 1
    lw a0, 0(t0)
    ecall
    li a7, 11
    li a0, ' '
    ecall
    addi t0, t0, 4
    addi t1, t1, -1
    j print.loop
print.done:
    li a7, 11
    li a0, '\n'
    ecall
    ret

# You must submit this function:
#
# The function computes the distance between the smallest and the largest element
# in the array and returns it in (a0).
#
# a0 - address of array start
# a1 - number of elements
func:
    addi sp, sp, -12
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)

    mv s0, a0 # Current address (p)
    mv s1, a1 # Element count (N)
    li s2, 1  # Current element index (i)

    beqz s1, func.done
    lw t0, 0(s0) # Min value (arr[0])
    mv t1, t0    # Max value (arr[0])
    li t2, 0     # Min index
    li t3, 0     # Max index
    addi s0, s0, 4

func.loop:
    beq s2, s1, func.done # if i == N -> done
    lw t4, 0(s0)
func.check_min:
    ble t0, t4, func.check_max # if min <= x -> check_max
    mv t0, t4
    mv t2, s2
    j func.continue
func.check_max:
    bge t1, t4, func.continue # if max => x -> continue
    mv t1, t4
    mv t3, s2 
func.continue:
    addi s0, s0, 4
    addi s2, s2, 1
    j func.loop

func.done:
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12
    
    sub a0, t3, t2
    ret
