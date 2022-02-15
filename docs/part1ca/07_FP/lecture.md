<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [['$$','$$'], ['\\(','\\)']],
      processEscapes: true
    }
  });
</script>

Lecture 7
---

# Floating-Point Format

## Lecture

Slides ([PDF](CA_Lecture_07.pdf), [PPTX](CA_Lecture_07.pptx)).

#### Outline

* Floating-point format.
* Standard IEEE 754.
* Floating-point instructions.
* Programs with floating-point operations.

#### Examples:

* [sqrt.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/07_FP/sqrt.s)
* [sqrtd.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/07_FP/sqrtd.s)
* [e.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/07_FP/e.s)

## Workshop

1. Find decimal values for the following binary values:

    ```
    0.0
    0.01
    0.010
    0.0011
    0.00110
    0.001101
    0.0011010
    0.00110011
    ```

1. Find binary values for the following fractions:

   ```
   1/2
   1/8
   3/4
   5/16
   11/32
   ```

1. Find binary values for the following decimal values:

   ```
   0.5
   0.25
   0.125
   1.125
   5.875
   3.1875
   ```

1. Write program `fprint.s` that inputs a single and double floating-point value
   and prints them in the binary format.

1. Write program `fprint2.s` that separately prints fields (sign, fraction, exponent)
   of single and double floating-point values.
   The code of the previous program can be partially reused. 

1. Write program `farithm.s` that inputs three double values `a`, `b`, and `c`,
   calculates the result of expression `a + b - c`, and prints the result.   

1. Write program `even_back.s` that does the following: 

   Input an integer value `N` and then `N` float values.
   Output line by line only even ones, in reversed order.
   To decide whether a float number is even, it must be converted (rounded) to an integer value.

   Input:
   ```
   6,1
   12.3
   -11.0
   3.25
   88.01
   0.0
   1.25
   ```
   Output:
   ```
   0.0
   88.01
   12.3
   ```

1. Write program `no_dups.s` that does the following:

   Inputs an integer `N` value and then N double values.
   Outputs all the doubles, skipping duplicated ones.

   Input:
   ```
   8
   12.025
   34.5
   -12.0
   23.25
   12.025
   -12.0
   56.75
   9.125
   ```
   Output:
   ```
   12.025
   34.5
   -12.0
   23.25
   56.75
   9.125
   ```

## Homework

1. Write program `fraction_truncate.s` that does the following:

   Input three cardinals — `A`, `B` and `n`.
   Output double float `F` that has exact `n` decimal places of `A/B`.
   You need to write a subroutine than accepts double `f=A/B` in `fa0` and integer `n` in `a0`
   and returns rounded double `F` in `fa0`.

   Hint: $$10^n*A/B < 2^{31}$$

   Input:
   ```
   123
   456
   7
   ```
   Output:
   ```
   0.2697368
   ```

   Spoiler:
   $$10^n*A/B < 2^{31}$$ means that you can just take an integer part of it,
   then divide the result back to $$10^n$$

1. Write program `cubic_root.s` that does the following:

   Input double (positive or negative) values $$1 <= |A| <= 1000000$$ and $$0.00001<= ɛ <=0.01$$.
   Calculate a cubical root of A with closeness $$<=ɛ$$ (you do not need to round the result).

   HINT: You always can calculate a cubic power of something!

   Input:
   ```
   1000
   0.0001
   ```
   Output:
   ```
   9.99995
   ```

   Spoiler: suppose solution is between M and N (M < N).
   Select $$K=(M+N)/2$$ and if $$|K^3|>|A|$$ then solution is between M and K, else it is between K and N.

1. Write program `leibpi.s` that does the following: 

   Calculate π value using [Leibniz formula for π](https://en.wikipedia.org/wiki/Leibniz_formula_for_π)
   accurate to N decimal places. Input N, output the result.
   Use function defined in [FractionTruncate](#fractiontruncate) to truncate out other digits.
   Keep in mind that the exact formula is calculating π/4, you probably should start with 4 instead 1
   to gain exact accuracy. Warning: the algorithm is _slow_, do not panic, but keep code as simple as possible.

   Input:
   ```
   4
   ```
   Output:
   ```
   3.1416
   ```

   Hint: to gain performance, keep anything in registers.

## References

* [Standard IEEE 754](https://en.wikipedia.org/wiki/IEEE_754) (Wikipedia).
* [Standard IEEE 754-2008](ieee-754-2008.pdf).
* Floating point. Section 3.5 in [[CODR]](../../books.md).
* Floating point. Section 2.4 in [[CSPP]](../../books.md).
* [RISC-V Assembly Programmer's Manual](
  https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md).
* [RISC-V Formal Specifications in nML](
  https://github.com/andrewt0301/ispras-microtesk-riscv/tree/master/microtesk-riscv/src/main/arch/riscv/model).
