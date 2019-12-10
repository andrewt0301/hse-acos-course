	.data
	# Reserve space in memory for a string.
str:
	.space 1024
	
	.text
main:
	# Read string
	la	$a0, str
	# Max chars to read (including zero at the end)
	la	$a1, 200
	li 	$v0, 8
	syscall
	
	# Print string
	la	$a0, str
	li	$v0, 4
	syscall

	# Get string length
	la	$s0, str
	move	$s1, $s0
len_loop:
	lb	$t0, ($s1)
	beqz	$t0, len_done
	add	$s1, $s1, 1
	b	len_loop
len_done:
	# $s0 - string start address
	# $s1 - string end address
	# $s2 - string length
	
	# Please note that if a sting length size is less than 200
	# its last character (before zero) is new line.
	# If you do not want it to be excluded from the string,
	# you can decrement the string end address.
	# See documentation on the syscall 8. 
	sub	$s2, $s1, $s0
	beqz	$s2, print_length # Empty string
	# Decrement string length.
	sub	$s1, $s1, 1
	sub	$s2, $s2, 1
	
print_length:
	# Print String length	
	move	$a0, $s2
	li	$v0, 1
	syscall
	# Print new line
	li	$a0, 10
	li	$v0, 11
	syscall
	
	# Print string by characters.
	la	$t0, str
print_loop:
	beq	$t0, $s1, print_done
	lb	$t1, ($t0)
	
	# Print character
	move	$a0, $t1
	li	$v0, 11
	syscall

	# Print space
	li	$a0, ' '
	li	$v0, 11
	syscall

	add	$t0, $t0, 1
	b	print_loop

print_done:
	li	$v0, 10
	syscall

	
