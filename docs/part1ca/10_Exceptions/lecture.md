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
* [mmio_poll.s](
  https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/10_Exceptions/mmio_poll.s)

## Workshop

#### Outline

* Control and Status Registers
* System instructions
* Exceptions
* Exception handling
* Interrupts

#### Exceptions and Interrupts

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

|-----------------------|-|
| <nobr>csrrc  t0, fcsr, t1</nobr> | Read/Clear CSR: read from the CSR into t0 and clear bits of the CSR according to t1 |
| <nobr>csrrci t0, fcsr, 10</nobr> | Read/Clear CSR Immediate: read from the CSR into t0 and clear bits of the CSR according to a constant |
| <nobr>csrrs  t0, fcsr, t1</nobr> | Read/Set CSR: read from the CSR into t0 and logical or t1 into the CSR |
| <nobr>csrrsi t0, fcsr, 10</nobr> | Read/Set CSR Immediate: read from the CSR into t0 and logical or a constant into the CSR |
| <nobr>csrrw  t0, fcsr, t1</nobr> | Read/Write CSR: read from the CSR into t0 and write t1 into the CSR |
| <nobr>csrrwi t0, fcsr, 10</nobr> | Read/Write CSR Immediate: read from the CSR into t0 and write a constant into the CSR |

__CSR Pseudo Instructions:__

|-----------------------|-|
| <nobr>csrc  t1, fcsr</nobr>  | Clear bits in control and status register |
| <nobr>csrci fcsr, 100</nobr> | Clear bits in control and status register |
| <nobr>csrr  t1, fcsr</nobr>  | Read control and status register          |
| <nobr>csrs  t1, fcsr</nobr>  | Set bits in control and status register   |
| <nobr>csrsi fcsr, 100</nobr> | Set bits in control and status register   |
| <nobr>csrw  t1, fcsr</nobr>  | Write control and status register         |
| <nobr>csrwi fcsr, 100</nobr> | Write control and status register         |

__System Instructions:__

|-----------------------|-|
| ebreak              | Pause execution |
| ecall               | Issue a system call : Execute the system call specified by value in a7 |
| uret                | Return from handling an interrupt or exception (to uepc) |
| wfi                 | Wait for Interrupt | 

#### Exceptions

When an exception occurs the PC is written to the `uepc` register and
the exception cause code is written to the `ucause`.

__Exceptions Supported in RARS:__

* __INSTRUCTION_ADDR_MISALIGNED__ (`ucause` = 0)

  Code:
  ```assembly
      j main
  end:
      li a7, 10
      ecall
  main:
      la t0, end
      addi t0, t0, 2
      jr t0
  ```
  Result:
  ```
  Error in : Instruction load alignment error
  ucause = 0x0
  uepc = 0x00400006
  ```

* __INSTRUCTION_ACCESS_FAULT__ (`ucause` = 1)

  Code:
  ```assembly
    .data
  data:
    .word 99
    .word 100
  .text
    la t0, data
    jr t0
  ```
  Result:
  ```
  Error in : Instruction load access error
  ucause = 0x00000001
  uepc = 0x10010000
  ```

* __ILLEGAL_INSTRUCTION__ (`ucause` = 2)

  Code:
  ```assembly
    .text
  main:
    li    t0, 8
    csrrs zero, cycle, t0
  ```
  Result:
  ```
  Error in : Runtime exception at 0x00400004: Attempt to write to read-only CSR
  ucause = 0x00000002
  uepc = 0x00400004
  ```

* LOAD_ADDRESS_MISALIGNED (`ucause` = 4)

  Code:
  ```assembly
    .data
    .space 2
    .align 0
  data:
    .word 0xDEADBEEF
    .text
  main:
    la t0, data
    lw t1, 0(t0)
  ```
  Result:
  ```
  Error in: Load address not aligned to word boundary 0x10010002
  ucause = 0x00000004
  uepc = 0x00400008
  utval = 0x10010002
  ```

* __LOAD_ACCESS_FAULT__ (`ucause` = 5)

  Code:
  ```assembly
  .text
  main:
    la t0, main
    lw t1, 0(t0)
  ```
  Result:
  ```
  Error in: Runtime exception at 0x00400008: Cannot read directly from text segment!0x00400000
  ucause = 0x00000005
  uepc = 0x00400008
  utval = 0x00400000
  ```

* STORE_ADDRESS_MISALIGNED (`ucause` = 6)

  Code:
  ```assembly
    .data
    .space 2
    .align 0
  data:
    .word 0
    .text
  main:
    la t0, data
    li t1, 0xDEADBEEF
    sw t1, 0(t0)
  ```
  Result:
  ```
  Error in: Runtime exception at 0x00400010: Store address not aligned to word boundary 0x10010002
  ucause = 0x00000006
  uepc = 0x00400010
  utval = 0x10010002
  ```

* STORE_ACCESS_FAULT (`ucause` = 7)

  Code:
  ```assembly
  .text
  main:
    la t0, main
    li t1, 0xDEADBEEF
    sw t1, 0(t0)
  ```
  Result:
  ```
  Error in: Runtime exception at 0x00400010: Cannot write directly to text segment!0x00400000
  ucause = 0x00000007
  uepc = 0x00400010
  utval = 0x00400000
  ```

* __ENVIRONMENT_CALL__ (`ucause` = 8)

  Code:
  ```assembly
    .text
  main:
    li a7, 100
    ecall
  ```
  Result:
  ```  
  Error in: Runtime exception at 0x00400008: invalid or unimplemented syscall service: 100 
  ucause = 0x00000004
  uepc = 0x00400008
  ```

#### Exception Handling

When an exception occurs the following actions are performed:

* the `uie` (interrupt enable) bit in the status word is set to 0;
* the `ucause` register is set to indicate which event has occurred;
* the `uepc` is set to the last instruction that was executing when system trapped;
* the PC is set to `utvec` value;
  in case of vectored exception handling, the PC is set `utvec` base address + 4 * `utcause`.

In order to have a working exception handler, the program must:

* set utvec to the address of the handler code (the lowest two bits are special);
* set the bits corresponding to the handled interrupts in uie;
* set the interrupt enable (lowest) bit in ustatus to enable the handler. 

The simplest user-level exception handler that just returns control to the next (PC+4) instruction: 

```assembly
handler:
     # Just ignore it by moving uepc to the next instruction
     csrrw t0, uepc, zero
     addi  t0, t0, 4
     csrrw zero, uepc, t0
     uret
```

The user-level handler can be registered in the following way:

```assembly
     la     t0, handler      # load handler address to t0
     csrrw  zero, utvec, t0  # set utvec to the handlers address
     csrrsi zero, ustatus, 1 # set interrupt enable bit in ustatus
```

## Homework

__TODO__

## References

* Chapter 6: “N” Standard Extension for User-Level Interrupts in 
  [The RISC-V Instruction Set Manual Volume II: Privileged Architecture](
  https://github.com/riscv/riscv-isa-manual/releases/latest).
* [RISC-V Assembly Programmer's Manual](https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md).
* The Processor. Chapter 4 in [[CODR]](../../books.md).
* Pipelining: Basic and Intermediate Concepts. Appendix C in [[CAQA]](../../books.md).
* Instruction-Level Parallelism and Its Exploitation. Chapter 3 in [[CAQA]](../../books.md).
* [RISC-V Assembly Language Programmer Manual. Part I](https://shakti.org.in/docs/risc-v-asm-manual.pdf).
* [Interrupt](https://en.wikipedia.org/wiki/Interrupt) (Wikipedia).
* [Superscalar processor](https://en.wikipedia.org/wiki/Superscalar_processor) (Wikipedia).
* [Out-of-order execution](https://en.wikipedia.org/wiki/Out-of-order_execution) (Wikipedia).
* [Ripes - graphical processor simulator and assembly editor for the RISC-V ISA](
  https://github.com/mortbopet/Ripes).
