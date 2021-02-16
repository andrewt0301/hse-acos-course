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

__Exception__ is an an unscheduled event that disrupts program execution.
__Interrupt__ is an exception that comes from outside of the processor.
 (Some architectures use the term interrupt for all exceptions.)
Exceptions require dealing with special system instructions and registers.

#### Control and Status Registers (CSRs)

The __Control and Status Registers (CSRs)__ are system registers provided by RISC-V to control monitor system states.
CSR’s can be read, written and bits can be set/cleared. 
Each CSR has a special name and is assigned a unique function.
In this course, we focus on the user privilege level.
We will use user-level CSRs to handle user-level exceptions.

__User-level CSRs__:

| __Number__ | __Priviledge__ | __Name__  | __Description__                    |
| __User Trap Setup__                                                          |
| 0x000  | URW        | ustatus  | User status register.                       |
| 0x004  | URW        | uie      | User interrupt-enable register.             |
| 0x005  | URW        | utvec    | User trap handler base address.             |
| __User Trap Handling__                                                       |
| 0x040  | URW        | uscratch | Scratch register for user trap handlers.    |
| 0x041  | URW        | uepc     | User exception program counter.             |
| 0x042  | URW        | ucause   | User trap cause.                            |
| 0x043  | URW        | utval    | User bad address or instruction.            |
| 0x044  | URW        | uip      | User interrupt pending.                     |
| __User Floating-Point CSRs__                                                 |
| 0x001  | URW        | fflags   | Floating-Point Accrued Exceptions.          |
| 0x002  | URW        | frm      | Floating-Point Dynamic Rounding Mode.       |
| 0x003  | URW        | fcsr     | Floating-Point Control and Status Register. |
| __User Counter/Timers__                                                      |
| 0xC00  | URO        | cycle    | Cycle counter for RDCYCLE instruction.      |
| 0xC01  | URO        | time     | Timer for RDTIME instruction.               |
| 0xC02  | URO        | instret  | Instructions-retired counter for RDINSTRET instruction. |
| 0xC80  | URO        | cycleh   | Upper 32 bits of cycle, RV32 only.          |
| 0xC81  | URO        | timeh    | Upper 32 bits of time, RV32 only.           |
| 0xC82  | URO        | instreth | Upper 32 bits of instret, RV32 only.        |

### System Instructions

__CSR Instructions:__

| csrrc  t0, fcsr, t1 | Read/Clear CSR: read from the CSR into t0 and clear bits of the CSR according to t1 |
| csrrci t0, fcsr, 10 | Read/Clear CSR Immediate: read from the CSR into t0 and clear bits of the CSR according to a constant |
| csrrs  t0, fcsr, t1 | Read/Set CSR: read from the CSR into t0 and logical or t1 into the CSR |
| csrrsi t0, fcsr, 10 | Read/Set CSR Immediate: read from the CSR into t0 and logical or a constant into the CSR |
| csrrw  t0, fcsr, t1 | Read/Write CSR: read from the CSR into t0 and write t1 into the CSR |
| csrrwi t0, fcsr, 10 | Read/Write CSR Immediate: read from the CSR into t0 and write a constant into the CSR |

__CSR Pseudo Instructions:__

| csrc  t1, fcsr      | Clear bits in control and status register |
| csrci fcsr, 100     | Clear bits in control and status register |
| csrr  t1, fcsr      | Read control and status register          |
| csrs  t1, fcsr      | Set bits in control and status register   |
| csrsi fcsr, 100     | Set bits in control and status register   |
| csrw  t1, fcsr      | Write control and status register         |
| csrwi fcsr, 100     | Write control and status register         |


__System Instructions:__

| ebreak | Pause execution |
| ecall  | Issue a system call : Execute the system call specified by value in a7 |
| uret   | Return from handling an interrupt or exception (to uepc) |
| wfi    | Wait for Interrupt |

#### Exceptions Supported in RARS (name and `ucause` value):

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
