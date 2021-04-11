# Final Test: Computer Architecture (Retake)

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Answer the theoretical questions in a few sentences (1-2 paragraphs for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

1. Describe how integer and floating-point values are represented in the binary format:
   unsigned integers, 2's complement signed integers, and single-precision floating-point.
   Give an explanation with an examples of how a signed and unsigned integer values are added.

1. Describe the concept of pipeline.
   List the 5 stages and give brief descriptions for them.
   What advantages and disadvantages does pipelining have?

1. Give a brief definition of an interrupt. For what reasons can it be raised?
   Briefly explain how interrupt handler is implemented. What main actions does it perform?
   List the main CSR registers used for interrupt handling.
   
1. Give a brief description of the caching mechanism (block, index, tag).
   Give the definition of associativity (direct-mapped, associative, fully associative).
   How many cache levels are typical for modern processors?
   What problem can caches create for multicore processors? 

## Part 2. Programming Task

Write a RISC-V assembly program that inputs integer value `x` and calculates the value of
the `f(x)` mathematical function according to the specified equations.
`f(x)` __must be implemented as a function and must comply with RISC-V calling conventions__.

The implemented function must use callee-saved registers (`s0`, `s1`, etc.) to 
store intermediate results of calculations.
These registers must be saved to the stack and restored when the function returns.

The `f(x)` function is as follows:

    f(x) = -2 if x < 0
    f(x) = 8 * x**8 + 1 * x**5 - 6 * x**3 - 1 * x if x >= 0
    f(x) = 8**x + 4 if x == 3
    f(x) = -3 * x + -10 if x > 9
