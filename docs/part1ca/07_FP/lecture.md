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

1. Write program `fraction_truncate.s` that does the following%

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

__TODO__

## Homework

__TODO__

## References

* [Standard IEEE 754](https://en.wikipedia.org/wiki/IEEE_754) (Wikipedia).
* [Standard IEEE 754-2008](ieee-754-2008.pdf).
* Floating point. Section 3.5 in [[CODR]](../../books.md).
* Floating point. Section 2.4 in [[CSPP]](../../books.md).
* [RISC-V Assembly Programmer's Manual](https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md).

