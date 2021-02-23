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

#### Tasks

1. Assuming a cache of 4096 blocks, a four-word block size, and a 64-bit address,
   find the total number of sets and the total number of tag bits for caches that are
   direct-mapped two-way and four-way set associative, and fully associative.

1. Consider a virtual memory system that can address a total of 2<sup>50</sup> bytes.
   You have unlimited hard drive space, but are limited to 2 GB of semiconductor (physical) memory.
   Assume that virtual and physical pages are each 4 KB in size.
   * How many bits is the physical address?
   * What is the maximum number of virtual pages in the system?
   * How many physical pages are in the system?
   * How many bits are the virtual and physical page numbers?
   * How many page table entries will the page table contain?

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
