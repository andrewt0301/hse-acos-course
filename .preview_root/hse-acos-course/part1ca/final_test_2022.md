# Final Test: Computer Architecture

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Answer the theoretical questions in a few sentences (1-2 paragraphs for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

1. Describe how integer and floating-point values are represented in the binary format:
   unsigned integers, 2's complement signed integers, and single-precision floating-point.
   Why floating-point exponents are biased?
   What is the difference between integer sign- and zero-extension?
   What is integer overflow? What are floating-point overflow and underflow?

2. Describe the concept of pipeline.
   List the 5 stages and give brief descriptions for them.
   What pipeline hazards are? List the types of hazards and the ways to prevent them (with brief definitions).
   Give an example of a hazard situation and how it can be handled.
   What is branch prediction is needed for?
   How the loop unrolling optimisation can help improve pipeline performance?

3. Give a brief description of how caching mechanism works (block, index, tag, valid bit, dirty bit).
   Give the definition of associativity (direct-mapped, set associative, fully associative).
   What is the difference between write-through and write-back?
   What is replacement policy (what type of policy do you know)?
   How many cache levels are typical for modern processors?
   What problem can caches create for multicore processors?

## Part 2. Programming Task

Write a RISC-V assembly program that inputs integer value `x` (assumed non-negative)
and calculates the value of the `f(x)` mathematical function according to the specified equations.
`f(x)` __must be implemented as a function and must comply with RISC-V calling conventions__.

The implemented function must use callee-saved registers (`s0`, `s1`, etc.) to 
store intermediate results of calculations.
These registers must be saved to the stack and restored when the function returns.

The `f(x)` function is as follows (this is an __example__, find __your variant__ below):

    f(x) = -2 if x < 1
    f(x) = 8 * x**8 + 1 * x**5 - 6 * x**3 - 1 * x if x >= 1
    f(x) = 8**x + 4 if x == 3
    f(x) = -3 * x + -10 if x > 9

### Variants

Choose your __variant number__ according to __your number in your group__.
See the lists of students [here](
https://docs.google.com/spreadsheets/d/1BES3ooOfdVui-ioTibUHbApOkOwa46IEdmel-Gn27L4/edit?usp=sharing).

Variants for groups:

* [Group 201](group201.md)
* [Group 202](group202.md)
* [Group 203](group203.md)
* [Group 204](group204.md)
