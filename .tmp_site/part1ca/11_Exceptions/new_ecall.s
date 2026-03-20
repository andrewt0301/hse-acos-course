.text
.globl	main
main:	la	t1, handler
	csrw	t1, utvec
	csrsi	ustatus, 1

        # Read 'size' and allocate 'size' of "hidden registers"
        li      a7, 5
        ecall
        li      a7, 100
        ecall

        # Read a number
rloop:  li      a7, 5
        ecall
        # Zero means - done
        beqz    a0, rdone
        bltz    a0, rread
        # Positive means - write
        mv      t0, a0
        # Read value
        li      a7, 5
        ecall
        mv      a1, a0
        mv      a0, t0
        li      a7, 102
        ecall
        b       rloop

        # Negative means - read
rread:  neg     a0, a0
        li      a7, 101
        ecall
        li      a7, 1
        ecall
        li      a0, '\n'
        li      a7, 11
        ecall
        b       rloop

rdone:	li	a7, 10
	ecall
