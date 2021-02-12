Lecture 10
---

# Exceptions and interrupts. Multiple issue.

## Lecture

Slides ([PDF](CA_Lecture_10.pdf), [PPTX](CA_Lecture_10.pptx)).

#### Outline

* Exceptions and interrupts
* Multiple issue (static and dynamic)

#### Examples:

* [simple_handler.s](
  https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/10_Exceptions/simple_handler.s)

## Workshop

Exceptions in RARS (name and `ucause` value):

* INSTRUCTION_ADDR_MISALIGNED (0)
* INSTRUCTION_ACCESS_FAULT (1)
* ILLEGAL_INSTRUCTION (2)
* LOAD_ADDRESS_MISALIGNED (4)
* LOAD_ACCESS_FAULT (5)
* STORE_ADDRESS_MISALIGNED (6)
* STORE_ACCESS_FAULT (7)
* ENVIRONMENT_CALL (8)

__TODO__

## Homework

__TODO__

## References

* Chapter 6: “N” Standard Extension for User-Level Interrupts in 
  [The RISC-V Instruction Set Manual Volume II: Privileged Architecture](
  https://github.com/riscv/riscv-isa-manual/releases/latest).
* The Processor. Chapter 4 in [[CODR]](../../books.md).
* Pipelining: Basic and Intermediate Concepts. Appendix C in [[CAQA]](../../books.md).
* Instruction-Level Parallelism and Its Exploitation. Chapter 3 in [[CAQA]](../../books.md).
* [RISC-V Assembly Language Programmer Manual. Part I](https://shakti.org.in/docs/risc-v-asm-manual.pdf).
* [Interrupt](https://en.wikipedia.org/wiki/Interrupt) (Wikipedia).
* [Superscalar processor](https://en.wikipedia.org/wiki/Superscalar_processor) (Wikipedia).
* [Out-of-order execution](https://en.wikipedia.org/wiki/Out-of-order_execution) (Wikipedia).
* [Ripes - graphical processor simulator and assembly editor for the RISC-V ISA](
  https://github.com/mortbopet/Ripes).
