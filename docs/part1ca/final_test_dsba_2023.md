# Final Test: Computer Architecture

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Answer the theoretical questions in a few sentences (1-2 paragraphs for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

1. __TODO__

2. __TODO__

3. __TODO__

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
https://docs.google.com/spreadsheets/d/1kFGcUtLRKk0gWtb5wSuvZNMLMVCo-orDJdcM54Vl2Jw/edit?usp=sharing).

Variants for groups:

* [Group 211](2023_group211.md)
* [Group 212](2023_group212.md)
* [Group 213](2023_group213.md)
* [Group 214](2023_group214.md)
