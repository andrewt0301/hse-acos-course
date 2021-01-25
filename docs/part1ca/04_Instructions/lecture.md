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
* Understand the use of labels and branch instructions.
* Practice writing programs with conditions and loops.

#### Tasks


1. Encode the following instructions to the binary format (see the rules in
   the ISA specification):

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

1. Get familiar with RISC-V pseudoinstructions (`mv`, `li`, `la`, `b`, `j`, etc).
   What instructions are used to replace them when a program is assembled:

       mv t0, t1
       li t0, 0x12345678
       li t0, 16
       b  label
       j  label
       la label
       
    Note: Add `label` to some place in your code. See what code will be generated in
    the `Execute` panel of RARS. 

1. Write a program that inputs an integer value `x` and prints `-1` if it is negative, `0` if it equals 0,
   and `1` if it is positive.
   
   On if the solutions is this:
   
       main:
           li   a7, 5
           ecall
          
           mv   t0, zero
           beqz a0, done
           li   t0, 1
           blt  zero, a0, done  
           li   t0, -1
       done:
           li a7, 1
           mv a0, t0
           ecall

   Propose any other solution?

1. Write a program that inputs two integer values `x` and `y` and prints first the smallest
   of them and then the largest of them.

## Homework

Finish tasks 1-5 and send the programs to your team assistant.
The rest of the tasks are moving to the next siminar.

## References

* [The RISC-V Instruction Set Manual. Volume I: Unprivileged ISA](
  https://github.com/riscv/riscv-isa-manual/releases/latest).
* [RISC-V Assembly Programmer's Manual](https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md)
* [Opcode](https://en.wikipedia.org/wiki/Opcode) (Wikipedia).
* [Addressing Mode](https://en.wikipedia.org/wiki/Addressing_mode) (Wikipedia).
