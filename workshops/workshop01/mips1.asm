	.text
main:
	li $t1, 2
	li $t2, 5
	li $s1, 0xDEADBEEF               
        
        # R instructions
	add $t3, $t1, $t2
	sub $t4, $t1, $t2
	mul $t5, $t1, $t2
	div $t6, $t2, $t1

        # or
        #and
        # xor 
        
        # I instructions
	addi $s1, $zero, 5
	ori  $s2, $zero, 5     
