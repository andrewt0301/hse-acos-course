# Lecture 4

# RISC-V Instructions

## Lecture

Slides ([PDF](CA_Lecture_04.pdf), [PPTX](CA_Lecture_04.pptx)).

#### Outline:

* Stored program concept.
* Memory layout.
* RISC-V ISA base and extensions.
* Instruction encoding (R, I, S, SB, U, and UJ formats).

## Workshop

#### Outline

* Discuss the tasks from the previous seminar.
* Get familiar with the RISC-V ISA Specification (instruction types, encodings, etc.).
* Practice with encoding and decoding instructions.
* Get familiar with pseudoinstructions.
* Practice writing programs with conditions and loops.

#### Tasks


1. Encode the following instructions to the binary format (see the rules in the ISA specificion):

   * R-type:

         add  t3, t1, t2

   * I-type:   

         ori  s0, t1, 0x123
         lw   t1, 0x8(t0)
         
   * S-type:
   
         sw   t1, 0x8(t0)

   * SB-type:

         beq t2, t3, 16
         beq t2, t3, -8

   * U-type:
   
         lui  t0, 0x12345

   * UJ-type:

         jal zero, 16

1. Decode the following hexademical values to instructions:

       0x98765437
       0x00744433
       0x0080006f
       0xfff37293
       0x00000463
       0x00032823

1. Get familiar with RISC-V pseudoinstructions (`mv`, `li`, `la', `b`, `j`, etc).
   What instructions are used to replace them when a program is assembled:

       mv t0, t1
       li t0, 0x12345678
       li t0, 16
       b  label
       j  label
       la label

__TODO__

1. Write a program that inputs two positive integer values `x` and `y`, finds their greates common divisor,
   and prints the result. Use the Euclidean algorithm. The solution is [here](
   https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/04_Instructions/workshop/euclid.s). 

1. Write a program that inputs two unsigned integer values `x` and `y`, calculates `x ** y`
   (`x` raised to the power of `y`), and prints the result. The exponentiation should be implemented
   as a multiplication in a loop. If an overflow occurs, the program must exit the loop and
   print an error message. 

## Homework

Finish the tasks and send the programs to your team assistant.

## References

* [The RISC-V Instruction Set Manual. Volume I: Unprivileged ISA](
  https://github.com/riscv/riscv-isa-manual/releases/latest).
* [RISC-V Assembly Programmer's Manual](https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md)
