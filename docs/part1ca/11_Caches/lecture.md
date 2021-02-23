Lecture 11
---

# Memory and caches

## Lecture

Slides ([PDF](CA_Lecture_11.pdf), [PPTX](CA_Lecture_11.pptx)).

#### Outline:

* Processor-memory performance gap
* Types of memory devices
* Principle of locality and memory hierarchy
* Cache memory (direct-mapped, set-associative, fully-associative)
* Writing and replacement policies
* Multi-level caches
* Performance considerations

## Workshop

#### Outline

__TODO__

#### Examples

Linear memory accesses:

```assembly
    .eqv    START   0x10010000
    .eqv    SZ      512
    .text
    li     t1, START
    addi   t2, t1, SZ
loop:
    lw      t0, 0(t1)
    addi    t1, t1, 4
    blt     t1, t2, loop
```

#### Tasks

1. Find the AMAT for a processor with a 1 ns clock cycle time, a miss penalty of 20 clock cycles,
   a miss rate of 0.05 misses per instruction, and a cache access time (including hit detection) of 1 clock cycle.
   Assume that the read and write miss penalties are the same and ignore other write stalls.

1. Assuming a cache of 4096 blocks, a four-word block size, and a 64-bit address,
   find the total number of sets and the total number of tag bits for caches that are
   direct-mapped two-way and four-way set associative, and fully associative.

__TODO__

## Homework

__TODO__

## References

* Large and Fast: Exploiting Memory Hierarchy. Chapter 5 in [[CODR]](../../books.md). 
* Ulrich Drepper. [What Every Programmer Should Know About Memory](
  https://github.com/andrewt0301/hse-acos-course/blob/master/related/cpumemory.pdf).
* [CPU cache](https://en.wikipedia.org/wiki/CPU_cache) (Wikipedia).
* [Memory hierarchy](https://en.wikipedia.org/wiki/Memory_hierarchy) (Wikipedia).
* [Cache hierarchy](https://en.wikipedia.org/wiki/Cache_hierarchy) (Wikipedia).
* [Cache oblivious_algorithm](https://en.wikipedia.org/wiki/Cache-oblivious_algorithm) (Wikipedia).
* [Matrix multiplication algorithm](https://en.wikipedia.org/wiki/Matrix_multiplication_algorithm) (Wikipedia).
