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

1. Assume that `x11` is initialized to `11` and `x12` is initialized to `22`.
   Suppose you executed the code below on a version of the pipeline that does not handle data hazards.
   What would the final values of register `x15` be?
   Assume the register file is written at the beginning of the cycle and read at the end of a cycle.
   Therefore, an `ID` stage will return the results of a `WB` state occurring during the same cycle.

   ```assembly
   addi x11, x12, 5
   add  x13, x11, x12
   addi x14, x11, 15
   add  x15, x11, x11
   ```

1. Add NOP instructions to the code below so that it will run correctly on a pipeline that does not handle data hazards.

   ```assembly
   addi x11, x12, 5
   add  x13, x11, x12
   addi x14, x11, 15
   add  x15, x13, x12
   ```

1. Consider the fragment of RISC-V assembly below:

   ```assembly
   sw   x29, 12(x16)
   lw   x29, 8(x16)
   sub  x17, x15, x14
   beqz x17, label
   add  x15, x11, x14
   sub  x15, x30, x14
   ```

   Suppose we modify the pipeline so that it has only one memory (that handles both instructions and data).
   In this case, there will be a structural hazard every time a program needs to fetch an instruction during
   the same cycle in which another instruction accesses data.

   - Describe how a pipeline will stall when executing the code.
   - In general, is it possible to reduce the number of stalls/NOPs
     resulting from this structural hazard by reordering code?

1. Assume that the following sequence of instructions is executed on a five-stage pipelined datapath:

   ```assembly
   add x15, x12, x11
   ld  x13, 4(x15)
   ld  x12, 0(x2)
   or  x13, x15, x13
   sd  x13, 0(x15)
   ```

   - If there is no forwarding or hazard detection, insert NOPs to ensure correct execution.
   - Now change and/or rearrange the code to minimize the number of NOPs needed.
     You can assume register `x17` can be used to hold temporary values in your modified code.
   - If the processor has forwarding, but we forgot to implement the hazard detection unit,
     what happens when the original code executes?

## Homework

Finish the tasks and send them to the TA.

_Hint_: You can use the [Ripes](https://github.com/mortbopet/Ripes) graphical simulator to check your answers.
It visualizes execution of instructions in a pipeline using different options and can show
how assembly code containing hazards will be processed.

## References

* The Processor. Chapter 4 in [[CODR]](../../books.md).
* Pipelining: Basic and Intermediate Concepts. Appendix C in [[CAQA]](../../books.md).
* Instruction-Level Parallelism and Its Exploitation. Chapter 3 in [[CAQA]](../../books.md).
* [Instruction pipelining](https://en.wikipedia.org/wiki/Instruction_pipelining) (Wikipedia).
* [Hazard](https://en.wikipedia.org/wiki/Hazard_%28computer_architecture%29) (Wikipedia).   
* [Superscalar processor](https://en.wikipedia.org/wiki/Superscalar_processor) (Wikipedia).
* [Out-of-order execution](https://en.wikipedia.org/wiki/Out-of-order_execution) (Wikipedia).
* [Ripes - graphical processor simulator and assembly editor for the RISC-V ISA](https://github.com/mortbopet/Ripes).
