# Final Test: Computer Architecture

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Answer the theoretical questions in a few sentences (1-2 sentences for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

Assessment criteria:

* Answers to each of the question four topics (data formats, pipeline, caches, interrupts) have
  the same weight and can give up to 2.5 points each.
* Answers to subquestions are evaluated as a whole (they are numbered
  in order not to be missed). Generally, the most basic questions come first.

Questions:

* __Integer and floating-point formats__.
  1. Describe how integers are represented in the binary format (unsigned integers, 2's complement).
  2. What is the difference between integer sign- and zero-extension?
  3. What is the difference between arithmetical and logical shift?
  4. What is integer overflow?
  5. Explain the floating-point format (sign, exponent, fraction). Describe single and double precision.
  6. What is implicit `1.` in fraction?
  7. Why exponents are biased and what is bias?
  8. What are floating-point overflow and underflow?

* __Pipeline__.
  1. Describe the concept of pipeline.
  2. List the 5 stages and give brief descriptions for them.
  3. What pipeline hazards are?
  4. List the types of hazards and the ways to prevent them (with brief definitions).
  5. Give an example of a hazard situation and how it can be handled.
  6. What is branch prediction is needed for?
  7. How the loop unrolling optimization can help improve pipeline performance?

* __Caches__.
  1. Give a brief definition of a cache. Why do we need it?
  2. Explain how caching works (block, index, tag, valid bit, dirty bit).
  3. Give the definition of associativity (direct-mapped, set associative, fully associative).
  4. What is the difference between write-through and write-back?
  5. What is replacement policy (what types of policy do you know)?
  6. How many cache levels are typical for modern processors?
  7. What problem can caches create for multicore processors?

* __Interrupts__.
  1. Give a brief definition of an interrupt.
  2. For what reasons can it be raised (list the types of interrupts you know)?
  3. Briefly explain how an interrupt handler is implemented (what main actions does performs).
  4. List the main CSR registers used for interrupt handling and briefly explain their purposes.
  5. Explain the idea of vectored interrupt handling.

## Part 2. Programming Task

Write a RISC-V assembly program that implements function `f(x)` according
to the specified formula (individual for each of the students).
The task is split into 7 subtasks (steps).
This is done to be able to evaluate incomplete solutions.

Assessment criteria:

1. Tasks 1-4 (full solution) give 1 points each.
2. Tasks 5-7 (full solution) give 2 points each.
3. Full solution of all tasks gives 10 points.

Ejudge contest: http://84.201.145.249/cgi-bin/new-client?contest_id=260
