Lecture 3
---

# Computer Architecture and Assembly Language

## Lecture

Slides ([PDF](CA_Lecture_03.pdf), [PPTX](CA_Lecture_03.pptx)).

#### Outline:

* Computer organization.
* Processor.
* CPU performance.
* Instruction set architecture (ISA).
* RISC and RISC-V.
* Assembly language.

## Workshop

#### Outline

* Getting familiar with the [RARS](https://github.com/TheThirdOne/rars) simulator.
* Getting familiar with RISC-V registers.
* Getting familiar with RARS system calls to input/output integer values.
    * _PrintInt_ (number 1)
    * _PrintHex_ (number 34)
    * _PrintBinary_ (number 35)
    * _PrintIntUnsigned_ (number 36)
    * _ReadInt_ (number 5)
* Practicing with RISC-V arithmetic and bitwise instructions.
    * _Arithmetic_: `add`, `sub`, `addi`
    * _Bitwise_: `and, `or`, `xor`, `andi`, `ori`, `xori`
    * _Shifts_: `sll`, `srl`, `sra`, `slli`, `srli`, `srai`
    * _Comparison_: `slt`, `sltu`, `slti`, `sltiu`
    * _Multiplication_: `mul`, `rem`, `div`, `divu`, `remu`

#### Tasks

__TODO__

1. Write a program that inputs integer value `x` and prints it in the following formats:
   decimal, unsigned, hexadecimal, and binary.

1. Write a program that inputs two integer values `x` and `y`, calculates the result of the
   following expressions, and prints the result.

       x + y + 5 
       (x - y) << 3
       (x + y) >> 2
       (x + 5) + (x - 7)

1. Write a program that inputs two integer values `x` and `y`, swaps them with the _XOR_
   operation, and outputs them back. 

## Homework

__TODO__

## References

* [RISC-V web site](https://riscv.org/).
* [RISC-V](https://en.wikipedia.org/wiki/RISC-V) (Wikipedia).
* RISC-V instructions. Chapters 1 and 2 in [[CODR]](../../books.md).
* [The RISC-V Instruction Set Manual. Volume I: Unprivileged ISA](
  https://github.com/riscv/riscv-isa-manual/releases/latest).
* [RISC-V Greencard](
  https://github.com/andrewt0301/hse-acos-course/raw/master/related/greencard-20181213.pdf).
* [RISC-V Assembly Programmer's Manual](https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md)
* [Central Processing Unit](https://en.wikipedia.org/wiki/Central_processing_unit) (Wikipedia).
* [Motherboard](https://en.wikipedia.org/wiki/Motherboard) (Wikipedia).
* [System Bus](https://en.wikipedia.org/wiki/System_bus) (Wikipedia).
* [Instruction Set Architecture](
  https://en.wikipedia.org/wiki/Instruction_set_architecture) (Wikipedia).
