Computer Architecture Retake (2026)
---

1. What two memory segments grow towards each other?

   A. Stack
   B. Text
   C. Data
   D. Heap

   __Answer: A and D__

2. What data types will have the same sizes in both in 32-bit and 64-bit machines?

   A. `char`
   B. `long`
   C. `float`
   D. `double`
   E. `void *`

   __Answer: A, C and D__

3. You have a data struture with the following fields: `short a; char b; int c;`.
   What is its size in bytes (taking into account aligment)?

   __Answer: 8__

4. What is the largest possible value for a 6-bit signed integer (write it in binary format `xxxxxx`)?

   __Answer: 011111__

5. 64-bit value `0x0102030405060708` is stored in memory of a Little-Endian machine at address `0x0`. How its bytes are placed into memory (from `0x0` to `0x7`)?

   A. `0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08`
   B. `0x04, 0x03, 0x02, 0x01, 0x08, 0x07, 0x06, 0x05`
   C. `0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01`

   __Answer: C__

6. The value of signed 6-bit variable `x` is `100000` (binary).
   What is the value of `-x` (decimal)?

   __Answer: -128__

7. Which instruction can be used to swap values in two registers without using a temporary register (standard bit trick)? Type its name in CAPSLOCK.

   __Answer: XOR__
   
8. We have a signed 5-bit integer data type. What expressions will result in an integer overflow?

   A. `11 + 4`
   B. `11 + 5`
   C. `-11 - 4`
   D. `-11 - 5`

   __Answer: B__

9. This is a 32-bit floating-point value written in binary format:
   `01000000110010000000000000000000`.
   What is the decimal value for this binary representation? 

   __Answer: 6.25__

10. What RISC-V instruction is used to call a function by pointer (when function address is not known when the program is built)? Type its name in CAPSLOCK.

    __Answer: JALR__

11. Here are 4 RISC-V instructions in hexadecimal encoding. Which of them have the same opcode?

    A. `0x005282b3`
    B. `0x0062c333`
    C. `0x0002a283`
    D. `0x00032303`

    __Answer: C and D__

12. What register is used to store frame pointer in RISC-V?

    A. `a7`
    B. `t6`
    C. `s0`
    D. `s11`
    E. `tp`

    __Answer: C__

13. What type pipeline hazard can be avoided by using instruction reordering?

    A. Control hazard
    B. Data hazard
    C. Structural hazard

    __Answer: B__

14. How many clock cycles its takes to execute the following instuction sequence?
    We have a classical 5-stage pipeline that supports forwarding?

    ```assembly
    lw  x1, 0(x0)
    lw  x2, 8(x0)
    lw  x4, 16(x0)
    add x5, x1, x4
    add x3, x1, x2
    sw  x3, 24(x0)
    sw  x5, 32(x0)
    ```

    __Answer: 12__

15. What is the minimal required physical address size for 16-GB RAM (1 GB = 2 ** 30 bytes)? 

    __Answer: 34__

16. We have a 32-bit address and a 4-way associative cache with capacity of 8 KB and with block size of 64 bytes. What it the size of the cache tag in bits?

    __Answer: 21__

17. How many instances of L2 cache does an Intel processor with 16 CPUs have?

    A. 1
    B. 8
    C. 16

    __Answer: B__

18. What cache levels are typically separated into instruction and data caches (in Intel CPUs)?

    A. L1
    B. L2
    C. L3
  
    __Answer: A__

19. What type of parralelism implemented in modern CPU does require special instructions and registers?

    A. Instruction-level parallelism
    B. Data-level parallelism
    C. Thread-level parallelism

    __Answer: B__

20. What type pipeline hazard can be avoided by using loop unrolling reordering?

    A. Avoid control hazards
    B. Minimize cache miss rate
    C. Maximize load of the CPU pipline
    D. Reduce instruction count 

    __Answer: A and C__
