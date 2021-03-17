# Final Test: Computer Architecture

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

## Part 2. Programming Task

Write a RISC-V assembly program that inputs integer value `x` and calculates the value of
the `f(x)` function according to the specified equations.
`f(x)` must be implemented as a function and must comply with RISC-V calling conventions.

The implemented function must use callee-saved registers (`s0`, `s1`, etc.) to 
store intermediate results of calculations.
These registers must be saved to the stack and restored when the function returns.

Example of an `f(x)` function:

    f(x) = 5^x + -5 if x < -9
    f(x) = -5 if x >= -9
    f(x) = -10*x + 10 if x == 3
    f(x) = 2*x^8 - 5*x^4 + 10*x^3 - 4*x if x > 9

### Variants

Choose your variant number according to your number in the [list of students](
https://docs.google.com/spreadsheets/d/1RkbWDML8gzofGkz288NcYIuEtrKMY4jPowxYSxt1m1Q/edit#gid=0).

Note: the `^` symbol means "power".

#### Group 191

1. Variant
     ```
     f(x) = -9^x + -4 if x < -10
     f(x) = -1 if x >= -10
     f(x) = 1*x^5 - 4*x^4 - 8*x^2 + 8*x if x == -2
     f(x) = 6*x + 3 if x > 2
     ```
1. Variant
     ```
     f(x) = 8*x + -10 if x < -4
     f(x) = 3^x + -1 if x >= -4
     f(x) = 3 if x == 0
     f(x) = 9*x^8 - 9*x^5 - 1*x^2 - 2*x if x > 4
     ```
1. Variant
     ```
     f(x) = 7 if x < -3
     f(x) = 3*x + -2 if x >= -3
     f(x) = 7*x^8 + 3*x^5 - 1*x^4 + 6*x if x == 4
     f(x) = 3^x + 5 if x > 8
     ```
1. Variant
     ```
     f(x) = -7*x + 5 if x < -10
     f(x) = -3^x + 7 if x >= -10
     f(x) = 6*x^8 + 10*x^4 + 7*x^3 - 5*x if x == -5
     f(x) = -6 if x > 4
     ```
1. Variant
     ```
     f(x) = 3 if x < -10
     f(x) = 6*x^7 - 3*x^6 - 5*x^3 - 7*x if x >= -10
     f(x) = -3^x + 3 if x == 1
     f(x) = -8*x + 2 if x > 6
     ```
1. Variant
     ```
     f(x) = 1*x^8 + 8*x^5 - 6*x^4 + 4*x if x < -1
     f(x) = 2*x + 5 if x >= -1
     f(x) = 5^x + -5 if x == 1
     f(x) = 2 if x > 2
     ```
1. Variant
     ```
     f(x) = 6*x^5 - 8*x^4 - 4*x^2 + 9*x if x < -2
     f(x) = -6 if x >= -2
     f(x) = -4*x + -7 if x == 2
     f(x) = 9^x + 5 if x > 6
     ```
1. Variant
     ```
     f(x) = 4*x^7 + 5*x^5 - 7*x^3 + 5*x if x < -6
     f(x) = 1*x + -3 if x >= -6
     f(x) = -10 if x == -3
     f(x) = 5^x + -5 if x > 0
     ```
1. Variant
     ```
     f(x) = 2 if x < -9
     f(x) = -7^x + -9 if x >= -9
     f(x) = 2*x^8 + 9*x^5 - 2*x^2 - 10*x if x == -4
     f(x) = -10*x + -8 if x > 0
     ```
1. Variant
     ```
     f(x) = 9 if x < -9
     f(x) = 8^x + -9 if x >= -9
     f(x) = 9*x^8 + 10*x^7 + 9*x^4 - 5*x if x == -6
     f(x) = -6*x + -6 if x > 9
     ```
1. Variant
     ```
     f(x) = -5 if x < -2
     f(x) = -7*x + -5 if x >= -2
     f(x) = -5^x + 5 if x == 2
     f(x) = 8*x^5 + 6*x^4 + 9*x^2 - 1*x if x > 9
     ```
1. Variant
     ```
     f(x) = 10*x^8 - 1*x^6 - 5*x^4 - 5*x if x < 0
     f(x) = 2*x + -3 if x >= 0
     f(x) = 4 if x == 5
     f(x) = 8^x + 8 if x > 7
     ```
1. Variant
     ```
     f(x) = 3*x^7 - 3*x^5 + 6*x^3 + 5*x if x < -1
     f(x) = -3*x + 5 if x >= -1
     f(x) = 2^x + -6 if x == 5
     f(x) = -7 if x > 9
     ```
1. Variant
     ```
     f(x) = 4*x^8 + 2*x^5 - 6*x^3 + 5*x if x < -6
     f(x) = -6*x + -4 if x >= -6
     f(x) = -9^x + 3 if x == -4
     f(x) = 7 if x > 7
     ```
1. Variant
     ```
     f(x) = 2*x + 6 if x < -6
     f(x) = 9 if x >= -6
     f(x) = 5*x^6 - 8*x^5 - 4*x^3 + 3*x if x == -5
     f(x) = 2^x + -9 if x > -4
     ```
1. Variant
     ```
     f(x) = 2 if x < -1
     f(x) = 10*x^8 - 1*x^6 + 4*x^3 + 7*x if x >= -1
     f(x) = 4^x + 9 if x == 4
     f(x) = -9*x + 10 if x > 6
     ```
1. Variant
     ```
     f(x) = 1*x + -6 if x < -9
     f(x) = -5^x + 7 if x >= -9
     f(x) = 9*x^8 + 1*x^4 - 1*x^3 - 10*x if x == -1
     f(x) = -10 if x > 7
     ```
1. Variant
     ```
     f(x) = 4*x + 6 if x < 7
     f(x) = -9 if x >= 7
     f(x) = -1^x + -10 if x == 8
     f(x) = 2*x^8 - 7*x^7 + 2*x^2 + 4*x if x > 9
     ```
1. Variant
     ```
     f(x) = -5 if x < -5
     f(x) = -2*x + -10 if x >= -5
     f(x) = -10^x + 8 if x == -2
     f(x) = 9*x^8 - 1*x^7 + 1*x^6 - 9*x if x > 8
     ```
1. Variant
     ```
     f(x) = 9*x^8 - 4*x^5 - 4*x^3 - 6*x if x < -6
     f(x) = -9 if x >= -6
     f(x) = -8*x + -10 if x == -4
     f(x) = 6^x + -1 if x > 8
     ```
1. Variant
     ```
     f(x) = 10*x^8 - 6*x^5 + 2*x^3 - 9*x if x < -8
     f(x) = -10 if x >= -8
     f(x) = -9*x + 5 if x == -1
     f(x) = -1^x + -3 if x > 9
     ```
1. Variant
     ```
     f(x) = 6 if x < 1
     f(x) = 10*x + -7 if x >= 1
     f(x) = 5*x^5 + 6*x^4 + 10*x^3 - 1*x if x == 2
     f(x) = 2^x + -7 if x > 9
     ```
1. Variant
     ```
     f(x) = 8 if x < 1
     f(x) = 6*x^8 - 7*x^6 + 2*x^5 + 6*x if x >= 1
     f(x) = -10^x + -4 if x == 4
     f(x) = -8*x + 8 if x > 6
     ```
1. Variant
     ```
     f(x) = 1^x + 7 if x < -8
     f(x) = -9*x + -2 if x >= -8
     f(x) = 9*x^7 + 3*x^5 - 4*x^3 - 7*x if x == 5
     f(x) = -2 if x > 9
     ```
1. Variant
     ```
     f(x) = 5^x + -1 if x < -6
     f(x) = 10*x^8 + 7*x^7 + 5*x^3 + 8*x if x >= -6
     f(x) = 3*x + 9 if x == 4
     f(x) = 3 if x > 8
     ```
1. Variant
     ```
     f(x) = -6*x + -9 if x < -10
     f(x) = -6^x + -1 if x >= -10
     f(x) = 2 if x == -1
     f(x) = 2*x^8 - 4*x^6 + 10*x^3 + 9*x if x > 5
     ```

#### Group 192

1. Variant
     ```
     f(x) = 10*x^6 - 8*x^4 + 7*x^3 + 5*x if x < -6
     f(x) = -10^x + -9 if x >= -6
     f(x) = 9*x + 9 if x == -4
     f(x) = 7 if x > 0
     ```
1. Variant
     ```
     f(x) = -6 if x < 1
     f(x) = 7*x^7 - 3*x^5 + 9*x^2 - 7*x if x >= 1
     f(x) = 2^x + -7 if x == 2
     f(x) = 2*x + -1 if x > 5
     ```
1. Variant
     ```
     f(x) = -3*x + 6 if x < -6
     f(x) = -7^x + -2 if x >= -6
     f(x) = 6*x^5 - 9*x^3 + 3*x^2 - 9*x if x == -3
     f(x) = -4 if x > 8
     ```
1. Variant
     ```
     f(x) = 8*x + 10 if x < -6
     f(x) = 1 if x >= -6
     f(x) = -7^x + 5 if x == 4
     f(x) = 3*x^8 - 6*x^5 + 8*x^3 - 1*x if x > 5
     ```
1. Variant
     ```
     f(x) = -7^x + -3 if x < -9
     f(x) = -9 if x >= -9
     f(x) = -6*x + 8 if x == -5
     f(x) = 7*x^8 - 4*x^3 - 6*x^2 - 6*x if x > 3
     ```
1. Variant
     ```
     f(x) = -1^x + 10 if x < -9
     f(x) = 2*x^7 + 4*x^6 + 5*x^5 + 5*x if x >= -9
     f(x) = 7*x + 1 if x == -1
     f(x) = -4 if x > 3
     ```
1. Variant
     ```
     f(x) = -3 if x < -5
     f(x) = 1^x + -6 if x >= -5
     f(x) = 5*x + -10 if x == -3
     f(x) = 1*x^8 - 10*x^7 + 9*x^2 + 7*x if x > 7
     ```
1. Variant
     ```
     f(x) = -5 if x < -6
     f(x) = 3*x + -7 if x >= -6
     f(x) = 6*x^6 + 1*x^5 + 1*x^3 + 10*x if x == 0
     f(x) = -4^x + -1 if x > 9
     ```
1. Variant
     ```
     f(x) = 9 if x < -6
     f(x) = 5*x^6 + 3*x^5 - 2*x^4 - 3*x if x >= -6
     f(x) = 9^x + 1 if x == 0
     f(x) = 2*x + -10 if x > 5
     ```
1. Variant
     ```
     f(x) = 8*x^8 + 7*x^5 + 9*x^3 + 10*x if x < -10
     f(x) = 8^x + -9 if x >= -10
     f(x) = -6*x + -4 if x == -3
     f(x) = -5 if x > 1
     ```
1. Variant
     ```
     f(x) = 5*x^7 + 3*x^5 + 5*x^4 + 10*x if x < -10
     f(x) = 5^x + 6 if x >= -10
     f(x) = 9*x + 5 if x == 6
     f(x) = 8 if x > 7
     ```
1. Variant
     ```
     f(x) = -3 if x < 4
     f(x) = 4^x + -3 if x >= 4
     f(x) = 7*x + -6 if x == 6
     f(x) = 2*x^6 - 4*x^3 - 8*x^2 - 10*x if x > 7
     ```
1. Variant
     ```
     f(x) = 4^x + -10 if x < -9
     f(x) = 10*x^5 - 2*x^4 - 2*x^2 + 7*x if x >= -9
     f(x) = -7 if x == -2
     f(x) = -9*x + 4 if x > -1
     ```
1. Variant
     ```
     f(x) = 4^x + 6 if x < 1
     f(x) = -4 if x >= 1
     f(x) = 3*x^5 - 6*x^3 - 5*x^2 + 10*x if x == 8
     f(x) = 4*x + 8 if x > 9
     ```
1. Variant
     ```
     f(x) = 5*x^8 + 4*x^4 - 4*x^2 + 3*x if x < -1
     f(x) = -9*x + -3 if x >= -1
     f(x) = -9 if x == 0
     f(x) = 8^x + -9 if x > 2
     ```
1. Variant
     ```
     f(x) = 6*x^7 - 7*x^5 - 6*x^4 - 10*x if x < -4
     f(x) = -7^x + -3 if x >= -4
     f(x) = 2*x + 8 if x == -3
     f(x) = -1 if x > 4
     ```
1. Variant
     ```
     f(x) = 7^x + 10 if x < -5
     f(x) = -9 if x >= -5
     f(x) = 5*x + -9 if x == -2
     f(x) = 6*x^5 + 4*x^3 + 9*x^2 + 10*x if x > 7
     ```
1. Variant
     ```
     f(x) = -3^x + 7 if x < -2
     f(x) = -10*x + 10 if x >= -2
     f(x) = 8*x^8 - 6*x^5 + 3*x^3 + 5*x if x == 3
     f(x) = -2 if x > 8
     ```
1. Variant
     ```
     f(x) = 1*x^8 + 9*x^6 - 6*x^4 + 5*x if x < -4
     f(x) = 9 if x >= -4
     f(x) = 8^x + -8 if x == 6
     f(x) = 2*x + 6 if x > 7
     ```
1. Variant
     ```
     f(x) = -6^x + 3 if x < -10
     f(x) = 7*x + 8 if x >= -10
     f(x) = 8 if x == -1
     f(x) = 10*x^8 + 1*x^3 + 9*x^2 - 6*x if x > 9
     ```
1. Variant
     ```
     f(x) = -1 if x < -8
     f(x) = -2*x + -7 if x >= -8
     f(x) = 4*x^6 - 6*x^4 + 2*x^2 - 7*x if x == 1
     f(x) = -2^x + 5 if x > 8
     ```
1. Variant
     ```
     f(x) = 8*x + 8 if x < -10
     f(x) = 8 if x >= -10
     f(x) = 6*x^5 - 8*x^4 + 9*x^3 - 3*x if x == 4
     f(x) = 8^x + 2 if x > 9
     ```
1. Variant
     ```
     f(x) = 2*x^6 - 2*x^5 + 2*x^4 - 1*x if x < 1
     f(x) = -9^x + 4 if x >= 1
     f(x) = -9 if x == 6
     f(x) = -4*x + 3 if x > 8
     ```
1. Variant
     ```
     f(x) = -9 if x < 7
     f(x) = -4^x + -2 if x >= 7
     f(x) = -1*x + -5 if x == 8
     f(x) = 7*x^6 - 8*x^5 - 6*x^4 + 9*x if x > 9
     ```
1. Variant
     ```
     f(x) = 6^x + -10 if x < -7
     f(x) = 6*x^6 - 4*x^4 + 7*x^2 + 5*x if x >= -7
     f(x) = 6 if x == -2
     f(x) = -1*x + 5 if x > 6
     ```
1. Variant
     ```
     f(x) = 10 if x < -2
     f(x) = -3*x + 10 if x >= -2
     f(x) = -10^x + -5 if x == 1
     f(x) = 4*x^7 - 5*x^4 + 4*x^2 + 8*x if x > 2
     ```
1. Variant
     ```
     f(x) = 2 if x < -5
     f(x) = 2*x^7 + 2*x^6 + 8*x^5 - 2*x if x >= -5
     f(x) = -1*x + 4 if x == 5
     f(x) = 2^x + -9 if x > 7
     ```

#### Group 193

1. Variant
     ```
     f(x) = -8*x + -6 if x < -10
     f(x) = -3^x + -7 if x >= -10
     f(x) = 10 if x == -9
     f(x) = 2*x^7 + 9*x^6 - 10*x^5 - 1*x if x > 2
     ```
1. Variant
     ```
     f(x) = 2*x^7 - 3*x^4 + 6*x^3 - 5*x if x < -6
     f(x) = 4 if x >= -6
     f(x) = -5^x + 2 if x == 0
     f(x) = -7*x + -10 if x > 5
     ```
1. Variant
     ```
     f(x) = -6 if x < -9
     f(x) = -5^x + 6 if x >= -9
     f(x) = 9*x^8 - 2*x^3 - 4*x^2 - 4*x if x == -5
     f(x) = 6*x + 7 if x > 1
     ```
1. Variant
     ```
     f(x) = 1 if x < -4
     f(x) = 8^x + 5 if x >= -4
     f(x) = 10*x + -3 if x == -1
     f(x) = 4*x^7 + 5*x^4 + 8*x^3 - 4*x if x > 1
     ```
1. Variant
     ```
     f(x) = -1*x + 6 if x < -9
     f(x) = -10 if x >= -9
     f(x) = 8*x^8 - 2*x^7 + 5*x^5 + 3*x if x == -2
     f(x) = -9^x + 6 if x > 4
     ```
1. Variant
     ```
     f(x) = -3*x + 7 if x < -8
     f(x) = 2^x + -7 if x >= -8
     f(x) = 1 if x == -5
     f(x) = 5*x^7 + 10*x^4 - 2*x^2 - 4*x if x > 4
     ```
1. Variant
     ```
     f(x) = -3 if x < -10
     f(x) = -8*x + -5 if x >= -10
     f(x) = -6^x + -6 if x == -7
     f(x) = 7*x^7 - 10*x^5 - 2*x^2 - 4*x if x > 4
     ```
1. Variant
     ```
     f(x) = 3^x + 1 if x < 5
     f(x) = -2*x + -4 if x >= 5
     f(x) = 5*x^7 + 9*x^4 - 7*x^3 - 3*x if x == 6
     f(x) = -4 if x > 7
     ```
1. Variant
     ```
     f(x) = 4*x^7 - 2*x^3 + 7*x^2 + 10*x if x < -1
     f(x) = 1 if x >= -1
     f(x) = 2*x + -3 if x == 5
     f(x) = -4^x + -7 if x > 7
     ```
1. Variant
     ```
     f(x) = 9*x^6 + 9*x^4 + 8*x^2 + 9*x if x < -6
     f(x) = -6 if x >= -6
     f(x) = 2^x + 10 if x == -4
     f(x) = -4*x + -10 if x > 9
     ```
1. Variant
     ```
     f(x) = -8*x + 10 if x < -8
     f(x) = 2^x + 6 if x >= -8
     f(x) = 2 if x == 4
     f(x) = 9*x^5 + 5*x^4 + 7*x^3 - 5*x if x > 7
     ```
1. Variant
     ```
     f(x) = -9^x + -2 if x < -5
     f(x) = -6 if x >= -5
     f(x) = 9*x^8 + 4*x^5 + 9*x^4 - 1*x if x == -4
     f(x) = 7*x + -2 if x > 5
     ```
1. Variant
     ```
     f(x) = 3*x + -6 if x < 0
     f(x) = 9*x^7 - 1*x^4 - 3*x^3 - 5*x if x >= 0
     f(x) = -7 if x == 8
     f(x) = 5^x + 6 if x > 9
     ```
1. Variant
     ```
     f(x) = -4 if x < -8
     f(x) = -7^x + 8 if x >= -8
     f(x) = 6*x + 7 if x == -2
     f(x) = 2*x^8 - 7*x^5 + 5*x^2 - 8*x if x > 7
     ```
1. Variant
     ```
     f(x) = 2*x^8 - 3*x^3 - 5*x^2 + 9*x if x < 1
     f(x) = -1^x + 6 if x >= 1
     f(x) = -9 if x == 3
     f(x) = -10*x + -8 if x > 6
     ```
1. Variant
     ```
     f(x) = -9^x + 2 if x < -8
     f(x) = 7 if x >= -8
     f(x) = 5*x^8 + 1*x^6 - 1*x^3 - 5*x if x == 5
     f(x) = -8*x + 10 if x > 9
     ```
1. Variant
     ```
     f(x) = 4^x + 8 if x < 1
     f(x) = 3*x^7 + 6*x^4 + 3*x^3 - 3*x if x >= 1
     f(x) = 7*x + 1 if x == 3
     f(x) = -9 if x > 6
     ```
1. Variant
     ```
     f(x) = 6*x^8 + 1*x^7 - 6*x^3 + 8*x if x < -9
     f(x) = -9*x + 8 if x >= -9
     f(x) = -7 if x == 3
     f(x) = -7^x + 4 if x > 5
     ```
1. Variant
     ```
     f(x) = -5*x + 5 if x < -2
     f(x) = -8 if x >= -2
     f(x) = 3*x^7 + 8*x^6 - 5*x^5 - 9*x if x == -1
     f(x) = -3^x + -7 if x > 5
     ```
1. Variant
     ```
     f(x) = -3^x + 8 if x < -1
     f(x) = 2*x^7 - 8*x^6 - 2*x^2 - 3*x if x >= -1
     f(x) = -6*x + 4 if x == 3
     f(x) = 10 if x > 6
     ```
1. Variant
     ```
     f(x) = 3*x + -7 if x < -3
     f(x) = 4^x + -3 if x >= -3
     f(x) = 10*x^5 - 8*x^4 + 6*x^2 - 8*x if x == -1
     f(x) = -10 if x > 3
     ```
1. Variant
     ```
     f(x) = 5^x + 9 if x < -6
     f(x) = -4*x + -4 if x >= -6
     f(x) = 2*x^8 + 4*x^4 - 5*x^2 - 4*x if x == -1
     f(x) = 7 if x > 0
     ```
1. Variant
     ```
     f(x) = -3 if x < -10
     f(x) = 7*x + 9 if x >= -10
     f(x) = 7*x^8 - 1*x^4 - 4*x^3 - 1*x if x == -1
     f(x) = -1^x + -7 if x > 9
     ```
1. Variant
     ```
     f(x) = 9^x + 3 if x < -9
     f(x) = 8 if x >= -9
     f(x) = 7*x^5 - 3*x^3 - 4*x^2 - 4*x if x == 4
     f(x) = -3*x + -7 if x > 9
     ```
1. Variant
     ```
     f(x) = -4 if x < -6
     f(x) = -6^x + 10 if x >= -6
     f(x) = 1*x^8 + 10*x^6 - 5*x^4 - 1*x if x == 1
     f(x) = 2*x + 6 if x > 4
     ```
1. Variant
     ```
     f(x) = -2*x + -7 if x < -4
     f(x) = 1 if x >= -4
     f(x) = -8^x + 8 if x == 0
     f(x) = 6*x^7 - 9*x^5 - 7*x^3 - 2*x if x > 4
     ```
1. Variant
     ```
     f(x) = 5*x^7 + 10*x^6 + 10*x^5 + 6*x if x < -2
     f(x) = -3*x + -1 if x >= -2
     f(x) = -7 if x == 2
     f(x) = 4^x + 7 if x > 4
     ```
