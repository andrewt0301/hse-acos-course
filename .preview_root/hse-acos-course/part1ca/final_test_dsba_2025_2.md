# Final Test: Computer Architecture (Retake)

The grade formula is as follows:

__Grade = 0.4 * Theory + 0.6 * Programming__

## Part 1. Theoretical Questions

Please save your answers to a text file and send it to the lecturer.

Answer the theoretical questions in a few sentences (1-2 sentences for a question).

Use __your own words__.
Copy-paste from external sources and other students will result in 100% penalty.

Assessment criteria:

* Answers to each of the question three topics (data formats, CPU, memory, interrupts) have
  the same weight and can give up to 2.5 points each.
* Answers to subquestions are evaluated as a whole (they are numbered
  in order not to be missed). Generally, the most basic questions come first.

Questions:

* __Data formats__.
  1. Describe how integers are represented in the binary format (unsigned integers, 2's complement).
  2. What is the difference between integer sign- and zero-extension?
  3. What is the difference between arithmetical and logical shift?
  4. What is integer overflow?
  5. Explain the floating-point format (sign, exponent, fraction). Describe single and double precision.
  6. What is implicit `1.` in fraction?
  7. Why exponents are biased and what is bias?
  8. What are floating-point overflow and underflow?

* __CPU__.
  1. Describe the concept of pipeline. List the 5 pipeline stages with brief descriptions.
  2. What pipeline hazards are? List hazards and ways to prevent them.
  3. Give an example of a hazard situation and how it can be handled. 
  4. Explain what branch prediction is needed for.
  5. Explain the idea of multiple-issue (superscalar) processor and out-of-order execution.
  6. List the types of thread-level parallelism with brief explanation.
  7. How the loop unrolling optimization can help improve performance?
  8. What CPU does your laptop/desktop have (model name)? How many cores does it have?

* __Memory__.
  1. Describe the idea of memory hierarchy. Why do we need it?
  2. Explain what a cache is and how it works (block, index, tag, valid bit, dirty bit).
  3. Give the definition of associativity (direct-mapped, set associative, fully associative).
  4. What is the difference between write-through and write-back?
  5. What is replacement policy (what types of policy do you know)?
  6. Explain how CPU translates virtual addresses into physical.
  7. What is a TLB miss and what is a page fault?
  8. How many caches does your laptop/desktop have?

* __Interrupts and I/0__.
  1. Give a brief definition of an interrupt.
  2. For what reasons can it be raised (list the types of interrupts you know)?
  3. Briefly explain how an interrupt handler is implemented (what main actions does performs).
  4. List the main CSR registers used for interrupt handling and briefly explain their purposes.
  5. Explain the idea of vectored interrupt handling.
  6. What purpose do timer interrupts serve?
  7. What techniques for I/O operations do you know?

## Part 2. Programming Task

Write a RISC-V assembly program that implements function `f(x)` according
to the specified formula (individual for each of the students).
The task is split into 7 subtasks (steps).
This is done to be able to evaluate incomplete solutions.

Assessment criteria:

1. Tasks 1-4 (full solution) give 1 points each.
2. Tasks 5-7 (full solution) give 2 points each.
3. Full solution of all tasks gives 10 points.

Ejudge contest is [here](http://158.160.144.239/cgi-bin/new-client?contest_id=275).

