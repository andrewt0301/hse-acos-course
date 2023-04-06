# Final Test: Computer Architecture

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Answer the theoretical questions in a few sentences (1-2 paragraphs for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

__TODO__

## Part 2. Programming Task

Write a RISC-V assembly program that inputs integer value `x` and calculates
the value of the `f(x)` mathematical function according to the specified equations.

Requirements:

* `x` is assumed to be a non-negative value from `0` to `12`.
* `f(x)` __must be implemented as a single function and must comply with RISC-V calling conventions__.
* `f(x)` __must use callee-saved registers__ (`s0`, `s1`, etc.) to store intermediate results of calculations
  (these registers are saved to the stack and restored from the stack by `f(x)`).

The `f(x)` function is as follows (__this is an example__, find __your variant__ below):

    ```
    f(x) = -2 * x + 4 if x < 5
    f(x) = -4**x - 4 if x >= 5
    f(x) = 5 * x**7 - 2 * x**4 - 2 * x if x == 7
    f(x) = -7 if x > 9
    ```

Evaluation criteria:

1. Correct program structure (input `x`, print `f(x)`, switch between cases of `x`) costs 1 point.
2. Each of the `f(x)` cases costs 1.5 points (must give a valid result).
3. Correct function implementation consts 1.5 point (call and result, passing argument and result).
4. Correct work with the stack costs 1.5 points (correct saving and loading registers).

### Variants

Choose your __variant number__ according to __your number in your group__.

See the lists of students [here](
https://docs.google.com/spreadsheets/d/1nj-iDom2phr24SIESSsPhYvFh9nPEcd_dx1wgLftckg/edit?usp=sharing).

See the variants [here](group200.md).
