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

## Homework

__TODO__

## References

* [The RISC-V Instruction Set Manual. Volume I: Unprivileged ISA](
  https://github.com/riscv/riscv-isa-manual/releases/latest).
* [RISC-V Assembly Programmer's Manual](https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md)
