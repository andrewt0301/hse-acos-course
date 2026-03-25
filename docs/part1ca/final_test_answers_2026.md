Computer Architecture Test (2026)
---

1. What is stored in a compiled program (executable file)?

   A. Local variables
   B. Global variables
   C. Literals (constants)
   D. Instructions
   E. Dynamic variables

   __Answer: B, C, D__

2. What data types will have different sizes in 32-bit and 64-bit machines?

   A. `char`
   B. `short`
   C. `int`
   D. `long`
   E. `float`
   F. `double`
   G. `void *`

   __Answer: D and G__

3. You have a data struture with the following fields: `char a; short b; unsigned char c; int d;`.
   What is its size in bytes (taking into account aligment)?

   __Answer: 12__

4. What is the lowest possible value for a 5-bit signed integer (write it in binary format `xxxxxx`)?

  __Answer: 10000__

5. 64-bit value `0xDEADBEEFBAADF00D` is stored in memory of a Little-Endian machine at address `0x0`.
   How its bytes are placed into memory (from `0x0` to `0x7`)?

   A. `0xde, 0xad, 0xbe, 0xef, 0xba, 0xad, 0xf0, 0x0d`
   B. `0x0d, 0xf0, 0xad, 0xba, 0xef, 0xbe, 0xad, 0xde`
   C. `0xdo, 0xof, 0xda, 0xab, 0xfe, 0xeb, 0xda, 0xed`

   __Answer: B__

6. The value of signed 16-bit variable `x` is `0x8000` (hexadecimal).
   What is the value of `-x` (decimal)?

  __Answer: -32768__

7. Which bit trick can be used to check whether the value of `x` is a power of two?

   A. `x & (x + 1)`
   B. `x & (x - 1)`
   C. `x | (x + 1)`
   D. `x | (x - 1)`

   __Answer: B__
   
8. We have a signed 4-bit integer data type. What expressions will result in an integer overflow?

   A. `5 + 3`
   B. `5 - 3`
   C. `-5 + 3`
   D. `-5 - 3`

  __Answer: A__

9. This is a 32-bit floating-point value written in binary format: `11000000011100000000000000000000`.
   What is the decimal value for this binary representation? 

  __Answer: -3.75__

10. What RISC-V instruction can read the current value of the program counter (PC)? Write its name in CAPSLOCK.

  __Answer: AUIPC__

11. Here are 4 RISC-V instructions in hexadecimal encoding. Which of them have the same opcode?

   A. `0x00000303`
   B. `0x00000293`
   C. `0x00002023`
   D. `0x00002283`

   __Answer: A and D__

12. The following RISC-V program has a bug.
    What register does function `A` need to save before calling function `B` and to restore after to fix the problem? Type its name in small letters.

    ```assembly
    main:
      addi a0, zero, 10
      jal A
      li a7, 1
      ecall
      li a7, 10
      ecall
    A:
      addi a0, a0, 5
      jal B
      addi t1, zero, 1
      add a0, a0, t1
      ret
    B:
      addi t0, zero, 100
      mul  a0, a0, t0
      ret
    ```

    __Answer: ra__ 

13. What type pipeline hazards can be avoided by using separate instruction and data caches?

    A. Control hazard
    B. Data hazard
    C. Structural hazard
    D. Memory hazard

    __Answer: C__

14. How many clock cycles its takes to execute the following instuction sequence?
    We have a classical 5-stage pipeline that supports forwarding?

    ```assembly
    lw   x1, 0(x0)
    lw   x2, 8(x0)
    add  x3, x1, x2
    addi x3, x3, 10
    sw   x3, 24(x0)
    lw   x4, 16(x0)
    add  x5, x1, x4
    sw   x5, 32(x0)
    ```

    __Answer: 14__

15. What is the typical size (in bits) of virtual address in modern 64-bit Intel processors? 

   __Answer: 48__

16. We have a 32-bit address and a 2-way accosiative cache that contains
    128 entries with block size of 64 bytes. What it the tag size in bits?

    __Answer: 20__

17. How many instances of L3 caches does a 24-core Intel Core i7 have?

    __Answer: 1__

18. How many hardware threads per core does Intel Core i7 support?

   __Answer: 2__

19. What type of parralelism implemented in modern CPU does NOT require assistance of a programmer?

   A. Instruction-level parallelism
   B. Data-level parallelism
   C. Thread-level parallelism

  __Answer: A__

20. How many 32-bit integer values can be added simultaneously using Intel's AVX2 SIMD instructions. 

  __Answer: 8__
