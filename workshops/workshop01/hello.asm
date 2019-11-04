# First program in MIPS assembly language.
#	Prints "Hello World!"
	.data
str:
	.asciiz "Hello, world!"
	.text
	.globl main
main:
	la $a0, str
	li $v0, 4
	syscall	