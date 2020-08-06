 	#
 	# This program implements the Euclidean algorithm
 	# of finding the greatest common divisor:
 	#   https://en.wikipedia.org/wiki/Euclidean_algorithm
 	#
 	# Pseudocode:
 	#
 	#   while a ≠ b 
        #   if a > b
        #     a := a − b; 
        #   else
        #     b := b − a; 
        #   result = a
 	#
  	.text
 	
 	# Input a.
 	li	$v0, 5
  	syscall
 	move	$t0, $v0
 	
 	# Input b.
 	li	$v0, 5
 	syscall
 	move	$t1, $v0
 	
loop:
	# while a ≠ b 
	beq	$t0, $t1, done
	nop

	blt	$t0, $t1, if_less
	nop

if_greater:
	# if a > b
	subu	$t0, $t0, $t1
 	b	loop
	nop

if_less:
	# else
	subu	$t1, $t1, $t0
	b	loop
	nop

done:
	# Print result.
	li	$v0, 1
	move	$a0, $t0
	syscall
