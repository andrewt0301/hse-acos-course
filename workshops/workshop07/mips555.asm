###########################################################

.macro exit
	li	$v0, 10
 	syscall
.end_macro

###########################################################

.macro print_double(%r)
 	mov.d	$f12, %r
 	li	$v0, 3
 	syscall
 	endl
.end_macro

###########################################################

.macro input_int(%r)
 	li	$v0, 5
 	syscall
 	move	%r, $v0    
.end_macro

###########################################################

.macro print_int(%r)
 	move	$a0, %r
 	li	$v0, 1
 	syscall
.end_macro

###########################################################

.macro endl
 	li	$v0, 11
 	li	$a0, 10
	syscall
.end_macro

###########################################################

   	.data
zero:
	.double 0.0
one:
	.double 1.0
four:
	.double 4.0
ten:
	.double 10.0

###########################################################
   	.text
    
	input_int($a0)
	move $s0, $a0

 	# 10 ** (-N) 
 	jal	pow_10_minus
 	
 	# (10 ** (-N)) * 4
 	l.d	$f4, four
 	mul.d	$f4, $f0, $f4
 
###########################################################

 	# Plus or Minus
 	move	$t0, $zero

	# PI starts from 4.0
	l.d	$f6, four

 	# Prev (starts with 0)
 	l.d	$f8, zero

 	# Divisor start from 3
 	li	$t1, 3

cycle:
	# Curr = 4 / $t1
	move	$a0, $t1
	jal	div_4
	mov.d	$f10, $f0

 	# Prev + Curr
 	add.d    $f20, $f8, $f10

 	# (Prev + Curr) <= 10 ** (-N)
 	c.le.d	$f20, $f4
 	bc1t	cycleEnd
    
	bnez	$t0, plus
minus:
	sub.d	$f6, $f6, $f10
	b	next
plus:
	add.d	$f6, $f6, $f10
next:
#	endl
#	print_double($f6)  # PI
#	print_double($f8)  # Prev
#	print_double($f10) # Cur
# 	print_double($f20) # Sum
#	endl

	mov.d	$f8, $f10   # Prev = Curr
	not	$t0, $t0     # Minus ->plus -> minus -> ...
	addiu	$t1, $t1, 2  # 3 -> 5 -> 7

	b cycle
    
cycleEnd:
	print_double($f6)
	exit
    
 #############################################################################
 #
 # Returns 10 ** (-$a0)
 #
 
pow_10_minus:
  	l.d	$f0, one
  	l.d	$f2, ten 
pow_start:
	blez	$a0, pow_end
    	div.d	$f0, $f0, $f2
    	subu	$a0, $a0, 1
   	b	pow_start
pow_end:
   	jr	$ra

##############################################################################
#
#  Returns 4.0 / a0 (FP) 
#

div_4:
	l.d	$f0, four
   	mtc1	$a0, $f2
    	cvt.d.w	$f2, $f2
    	div.d	$f0, $f0, $f2
	jr	$ra
