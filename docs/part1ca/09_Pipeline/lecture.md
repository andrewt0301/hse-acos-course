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
  Try different pipeline options (single-cycle, 5 stages pipeline, with and without forwarding and
  hazards detection). 

__Ripes__

![Ripes](https://github.com/mortbopet/Ripes/raw/master/resources/images/animation.gif?raw=true)

#### Tasks

1. List 5 stages of a RISC-V pipeline. Describe the role of each of the stages.
1. Describe how the following instructions are executed by the pipeline:
   `add`, `addi`, `lw`, `sw`, `beq`, `jal`, and `lui`. What happens at each pipeline stage? 
1. Name 3 types of pipeline hazards and describe methods used to overcome them. 

1. Assume that `x11` is initialized to `11` and `x12` is initialized to `22`.
   Suppose you executed the code below on a version of the pipeline that does not handle data hazards
   (i.e., the programmer is responsible for addressing data hazards by inserting NOP instructions where necessary).
   What would the final values of registers `x13` and `x14` be?

   ```assembly
   addi x11, x12, 5
   add  x13, x11, x12
   addi x14, x11, 15
   ```

## Homework

Install Ripes (see in references) and play with it.
Try to visualize examples of assembly code containing hazards.

## References

* The Processor. Chapter 4 in [[CODR]](../../books.md).
* Pipelining: Basic and Intermediate Concepts. Appendix C in [[CAQA]](../../books.md).
* Instruction-Level Parallelism and Its Exploitation. Chapter 3 in [[CAQA]](../../books.md).
* [Instruction pipelining](https://en.wikipedia.org/wiki/Instruction_pipelining) (Wikipedia).
* [Hazard](https://en.wikipedia.org/wiki/Hazard_%28computer_architecture%29) (Wikipedia).   
* [Superscalar processor](https://en.wikipedia.org/wiki/Superscalar_processor) (Wikipedia).
* [Out-of-order execution](https://en.wikipedia.org/wiki/Out-of-order_execution) (Wikipedia).
* [Ripes - graphical processor simulator and assembly editor for the RISC-V ISA](https://github.com/mortbopet/Ripes).
