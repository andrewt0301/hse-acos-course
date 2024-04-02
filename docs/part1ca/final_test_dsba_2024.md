# Final Test: Computer Architecture

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Answer the theoretical questions in a few sentences (1-2 paragraphs for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

1. __Integer and floating-point format__.
   Describe how integers are represented in the binary format (unsigned integers, 2's complement).
   What is the difference between integer sign- and zero-extension?
   What is integer overflow?
   Explain the floating-point format (sign, exponent, fraction). Describe single and double precision.
   What is implicit `1.` in fraction?  Why exponents are biased (and what is bias)?
   What are floating-point overflow and underflow?

2. __Pipeline__.
   Describe the concept of pipeline.
   List the 5 stages and give brief descriptions for them.
   What pipeline hazards are? List the types of hazards and the ways to prevent them (with brief definitions).
   Give an example of a hazard situation and how it can be handled.
   What is branch prediction is needed for?
   How the loop unrolling optimization can help improve pipeline performance?

3. __Caches__.
   Give a brief definition of a cache. Why do we need it?
   Explain how caching works (block, index, tag, valid bit, dirty bit).
   Give the definition of associativity (direct-mapped, set associative, fully associative).
   What is the difference between write-through and write-back?
   What is replacement policy (what types of policy do you know)?
   How many cache levels are typical for modern processors?
   What problem can caches create for multicore processors?

## Part 2. Programming Task

Write a RISC-V assembly program that implements function `f(x)` according
to the specified formula (individual for each of the students).
The task is split into 7 subtasks (steps).
This is done to be able to evaluate incomplete solutions.

Assessment criteria:

1. Tasks 1-4 (full solution) give 1 points each.
2. Tasks 5-7 (full solution) give 2 points each.
3. Full solution of all tasks gives 10 points.

Ejudge contests by groups:

* [Group 221](http://84.201.145.249/cgi-bin/new-client?contest_id=250)
* [Group 222](http://84.201.145.249/cgi-bin/new-client?contest_id=251)
* [Group 223](http://84.201.145.249/cgi-bin/new-client?contest_id=252)
* [Group 224](http://84.201.145.249/cgi-bin/new-client?contest_id=253)
