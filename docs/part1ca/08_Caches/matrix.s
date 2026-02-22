#
# This program generates random matrices and multiplies them.
#

.macro print_char(%x)
     li  a7, 11
     li  a0, %x
     ecall
.end_macro

    .text
    .globl main
main:
    li   a7, 5
    ecall

    # s0 = matrix size
    mv   s0, a0

    # s1 = matrix A
    call allocate_matrix
    mv   s1, a0
    mv   a1, s0
    li   a2, 13
    call generate_matrix

    # s2 = matrix B
    mv   a0, s0
    call allocate_matrix
    mv   s2, a0
    mv   a1, s0
    li   a2, 17
    call generate_matrix

    # s3 = matrix C
    mv   a0, s0
    call allocate_matrix
    mv   s3, a0
    mv   a1, s0
    call reset_matrix

    # C = A * B
    mv   a0, s0
    mv   a1, s1
    mv   a2, s2
    mv   a3, s3
    call multiply_matrices

    # Print matrix A
    mv   a0, s1
    mv   a1, s0
    call print_matrix
    print_char('\n')

    # Print matrix B
    mv   a0, s2
    mv   a1, s0
    call print_matrix
    print_char('\n')

    # Print matrix C
    mv   a0, s3
    mv   a1, s0
    call print_matrix
    print_char('\n')

    # Exit
    li a7, 10
    ecall

# Multiplies matrices: C = A * B
# Params:
#   a0 - matrix size
#   a1 - A matrix address
#   a2 - B matrix address
#   a3 - C matrix address
# multiply_matrices:
#   # TODO
#   ret

# Allocates a matrix of double values on the stack.
# Params:
#   a0 - matrix size
# Return:
#   a0 - matrix address
allocate_matrix:
    mul  a0, a0, a0 # N*N
    slli a0, a0, 3  # N*N*8
    li   a7, 9
    ecall
    ret

# Fills a matrix with random double values.
# Params:
#   a0 - matrix address
#   a1 - matrix size
#   a2 - random seed
generate_matrix:
    mv   t0, a0
    mul  t1, a1, a1
    li   t3, 10
    li   a7, 40
    mv   a0, zero
    mv   a1, a2
    ecall # random seed
generate_matrix.next:
    beqz  t1, generate_matrix.end

    li   a7, 41
    mv   a0, zero
    ecall # random int

    rem  a0, a0, t3
    addi a0, a0, 1
    fcvt.d.w ft0, a0
    fsd  ft0, 0(t0)
    addi t0, t0, 8
    addi t1, t1, -1
    j    generate_matrix.next
generate_matrix.end:
    ret

# Fills a matrix with zeros.
# Params:
#   a0 - matrix address
#   a1 - matrix size
reset_matrix:
    mul  a1, a1, a1
    fcvt.d.w ft0, zero
reset_matrix.next:
    beqz a1, reset_matrix.end
    fsd  ft0, 0(a0)
    addi a0, a0, 8
    addi a1, a1, -1
    j    reset_matrix.next
reset_matrix.end:
    ret

# Prints a matrix of double values.
# Params:
#   a0 - matrix address
#   a1 - matrix size
print_matrix:
    mv   t2, a0
    mv   t0, zero
print_matrix.next_row:
    beq  t0, a1, print_matrix.end_row
    mv   t1, zero
print_matrix.next_col:
    beq  t1, a1, print_matrix.end_col
    fld  fa0, 0(t2)
    li   a7, 3
    ecall
    addi t2, t2, 8
    print_char(' ')
    addi t1, t1, 1
    j    print_matrix.next_col
print_matrix.end_col:
    print_char('\n')
    addi t0, t0, 1
    j    print_matrix.next_row
print_matrix.end_row:
    ret
