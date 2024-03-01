.globl	main
.text
main:	la	t1 handler
	csrw	t1 utvec
	csrsi	ustatus 1
	
loop:	li	a7 5		# Ввод адреса
	ecall
	beqz	a0 done		# Если 0, конец
	andi	t0 a0 3		# Кратен ли 4
	beqz	t0 read		# Если да — чтение

write:	andi	a0 a0 -4	# Запись, затираем 2 бита
	mv	t1 a0		# Это «виртуальный» адрес
	li	a7 5		# Вводим значение
	ecall
	mv	t0 a0		# Готовим t0
	sw	t0 (t1)		# Сохраняем знеачение в «виртуальной памяти»
	b 	loop

read:	lw	t0 (a0)		# Читаем значение из «виртуальной памяти»
	mv	a0 t0
	li	a7 1		# Выводим значение
	ecall
	li	a0 '\n'		# И перевод строки
	li	a7 11
	ecall
	b 	loop

done:	li	a7 10
	ecall
