Lecture 9
---

# Processor and Pipeline. Instruction-level parallelism.

## Lecture

Slides ([PDF](CA_Lecture_09.pdf), [PPTX](CA_Lecture_09.pptx)).

#### Outline

* Processor datapath
* Pipelining, pipeline stages (IF, ID, EX, MEM, WB)
* Hazards: structure hazard, data hazard, control hazard
* Forwarding, stalling, reordering, speculation  

## Workshop

#### Outline

* Discuss pipeline stages and possible hazards
* Discuss ways to avoid hazards and to minimize their negative effects
* Practice detecting hazads in fragments of code (discuss ways to overcome them)
* Use the Ripes RISC-V simularor to illustate how a RISC-V pipeline works and how it handles hazards.

## Homework

Install Ripes (see in references) and play with it.

## References

* The Processor. Chapter 4 in [[CODR]](../../books.md).
* Pipelining: Basic and Intermediate Concepts. Appendix C in [[CAQA]](../../books.md).
* Instruction-Level Parallelism and Its Exploitation. Chapter 3 in [[CAQA]](../../books.md).
* [Instruction pipelining](https://en.wikipedia.org/wiki/Instruction_pipelining) (Wikipedia).
* [Hazard](https://en.wikipedia.org/wiki/Hazard_%28computer_architecture%29) (Wikipedia).   
* [Superscalar processor](https://en.wikipedia.org/wiki/Superscalar_processor) (Wikipedia).
* [Out-of-order execution](https://en.wikipedia.org/wiki/Out-of-order_execution) (Wikipedia).
* [Ripes - graphical processor simulator and assembly editor for the RISC-V ISA](https://github.com/mortbopet/Ripes).
