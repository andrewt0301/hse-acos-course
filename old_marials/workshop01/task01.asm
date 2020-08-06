# The program inputs three integer number x, y, and z and prints 
# the result of the following expression (x + z) * (y - z).
	.text
	.globl main
main:
	# inputs x into $t0
        li $v0, 5
        syscall
        add $t0, $zero, $v0

	# inputs y into $t1
        li $v0, 5
        syscall
        add $t1, $zero, $v0

	# inputs z into $t2
        li $v0, 5
        syscall
        add $t2, $zero, $v0

	# Puts x + z into $t3
        add $t3, $t0, $t2

        # Puts x - z into $t4
        sub $t4, $t1, $t2
        
        # Puts (x + z) * (y - z) into $t5
        mul $t5, $t3, $t4
        
        # Prints the result.
        li  $v0, 1
        add $a0, $t5, $zero
        syscall
