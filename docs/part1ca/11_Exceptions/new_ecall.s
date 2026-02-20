.text
.globl	main
main:	la	t1 handler
	csrw	t1 utvec
	csrsi	ustatus 1

        # Считать N и выделить N скрытых регистров
        li      a7 5
        ecall
        li      a7 100
        ecall

        # Считать номер
rloop:  li      a7 5
        ecall
        beqz    a0 rdone
        bltz    a0 rread
        # положительный — это запись
        mv      t0 a0
        li      a7 5
        ecall
        mv      a1 a0
        mv      a0 t0
        li      a7 102
        ecall
        b       rloop
rread:  neg     a0 a0
        li      a7 101
        ecall
        li      a7 1
        ecall
        li      a0 '\n'
        li      a7 11
        ecall
        b       rloop

rdone:	li	a7 10
	ecall
