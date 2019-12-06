#
# int fact (int n)
# {
#      if (n < 1) return (1);
#            else return (n * fact(n – 1));
# }
#
	.text
	.globl main
main:
	li	$v0, 5
	syscall
	
	move 	$a0, $v0
	jal	fact
	
	move 	$a0, $v0
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall

fact:
	addi	$sp, $sp, -8 # adjust stack for 2 items
	sw	$ra, 4($sp)  # save the return address
	sw	$a0, 0($sp)  # save the argument n
      
	slti	$t0, $a0, 1     # test for n < 1
	beq	$t0, $zero, L1  # if n >= 1, go to L1
	
	addi	$v0, $zero, 1 # return 1
	addi	$sp, $sp, 8   # pop 2 items off stack
	jr	$ra           # return to caller
L1:
	addi	$a0, $a0, -1  # n >= 1: argument gets (n – 1)
	jal	fact          # call fact with (n –1)
      
	lw	$a0, 0($sp) # return from jal: restore argument n
	lw	$ra, 4($sp) # restore the return address
	addi	$sp, $sp, 8 # adjust stack pointer to pop 2 items

	mul	$v0, $a0, $v0 # return n * fact (n – 1)
	jr	$ra           # return to the caller
