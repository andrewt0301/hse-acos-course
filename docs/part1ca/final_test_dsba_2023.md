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

Write a RISC-V assembly program that inputs integer value `x` and calculates
the value of the `f(x)` mathematical function according to the specified equations.

Requirements:

* `x` is assumed to be a non-negative value from `0` to `15`.
* `f(x)` __must be implemented as a single function and must comply with RISC-V calling conventions__.
* `f(x)` __must use callee-saved registers__ (`s0`, `s1`, etc.) to store intermediate results of calculations
  (these registers are saved to the stack and restored from the stack by `f(x)`).

The `f(x)` function is as follows (this is an __example__, find __your variant__ below):

    f(x) = -2 if x < 1
    f(x) = 8 * x**8 + 1 * x**5 - 6 * x**3 - 1 * x if x >= 1
    f(x) = 8**x + 4 if x == 3
    f(x) = -3 * x + -10 if x > 9

Evaluation criteria:

1. Correct program structure (input `x`, print `f(x)`, switch between cases of `x`) costs 1 point.
2. Each of the `f(x)` cases costs 1.5 points (must give a valid result).
3. Correct function implementation consts 1.5 points (call and result, passing argument and result).
4. Correct work with the stack costs 1.5 points (correct saving and loading registers).

### Variants

Choose your __variant number__ according to __your number in your group__.
See the lists of students [here](
https://docs.google.com/spreadsheets/d/1kFGcUtLRKk0gWtb5wSuvZNMLMVCo-orDJdcM54Vl2Jw/edit?usp=sharing).

Variants for groups:

* [Group 211](2023_group211)
* [Group 212](2023_group212)
* [Group 213](2023_group213)
* [Group 214](2023_group214)
