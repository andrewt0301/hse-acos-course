Lecture 9
---

# Virtual Memory

## Lecture

Slides ([PDF](CA_Lecture_09.pdf), [PPTX](CA_Lecture_09.pptx)).

#### Outline

* Virtual memory and physical memory
* Virtual and physical addresses
* Address translation and page table
* Translation lookaside buffer (TLB)

#### Examples

Address sizes for various real CPUs.

```
Architecture:             x86_64
CPU op-mode(s):           32-bit, 64-bit
Address sizes:            48 bits physical, 48 bits virtual
Byte Order:               Little Endian
CPU(s):                   24
On-line CPU(s) list:      0-23
Vendor ID:                AuthenticAMD
Model name:               AMD Ryzen AI 9 HX 370 w/ Radeon 890M
```
```
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          46 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   24
  On-line CPU(s) list:    0-23
Vendor ID:                GenuineIntel
  Model name:             13th Gen Intel(R) Core(TM) i7-13700
```
```
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          39 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   16
  On-line CPU(s) list:    0-15
Vendor ID:                GenuineIntel
  Model name:             12th Gen Intel(R) Core(TM) i7-1260P
```
```
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          39 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   8
  On-line CPU(s) list:    0-7
Vendor ID:                GenuineIntel
  Model name:             Intel(R) Core(TM) i7-8665U CPU @ 1.90GHz
```

Modern CPUs are limited to 48-bit virtual addresses because this is more
than enough for modern data volumes (2 ** 48 = 256 TB). Using 48 bits
rather than 64 simplifies hardware (smaller cache tags and TLBs) and page tables.

What address types are used for caching?

| _Cache Level_ |	_Addressing Type_	| _Explanation_ |
| L1 Cache	  | VIPT (Virtually Indexed, Physically Tagged) |	It uses the virtual address for fast indexing while simultaneously performing a TLB lookup to get the physical tag. This allows cache access to start before the address translation is even finished. |
| L2 Cache	  | PIPT (Physically Indexed, Physically Tagged) | This level is addressed entirely by the physical address. It is more accurate for a larger cache but requires the virtual-to-physical translation to be complete before the search begins. |
| L3 Cache	  | PIPT (Physically Indexed, Physically Tagged) | Since L3 is shared across all cores (Smart Cache), it must use physical addresses to maintain consistency between different processes and cores. |

## Workshop


#### Tasks

1. Consider a virtual memory system that can address a total of 32 GB (2**35 bytes).
   You have unlimited hard drive space, but are limited to 2 GB (2**31 bytes) of semiconductor  (physical) memory. Assume that virtual and physical pages are each 4 KB in size.
   * How many bits is the physical address?
   * What is the maximum number of virtual pages in the system?
   * How many physical pages are in the system?
   * How many bits are the virtual and physical page numbers?
   * How many page table entries will the page table contain?

__TODO__

#### Examples:

* [PseudoVM.s](https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/09_VM/PseudoVM.s)

## Homework

1. Programming task "PseudoVM".

Write an exception handler that imitates "virtual memory" for "forbidden" addresses.
A "forbidden" address is any address that causes exceptions
`LOAD_ACCESS_FAULT` and `STORE_ACCESS_FAULT` when we try to access it (read or write).
This is not supported for address `0x0` (it is reserved).

![Memory configuration](MemConfig.png)

It is suggested to create a table (array) that will store records
`"virtual address":value` (pairs of 4-byte values).
The capacity of the table is 16 records (i.e. `2*4*16=128` bytes).
Address `0x0` can be used to specify an empty record.

"Virtual memory" works only with instructions `lw` and `sw`
that use register `t0` as a source/destination for values
(other registers are not checked).

Reading from an address works in the following way:
* If the address is present in the table, the value stored in the table is returned.
* If the address is missing from the table, `0` is returned.

Writing to an address works in the following way:
* If the address is present in the table, the value stored in the record is updated.
* If the address is missing from the table, but the table has free records,
  a new record `"virtual address":value` is placed into the table.
* If the address is missing from the table and its full (no free records), nothing happens.

Notes:
* Everything is done in the handler (starts with the `handler` label)
  that handles the two exceptions.
* The handler must save and restore all registers it uses (some area in the `.data` section).
* This __[main program](
  https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/09_VM/PseudoVM.s)__
  will be merged with the handler (you must submit only the handler).
* The main program reads addresses from user input:
  address divisible by `4` are used for reading, others - for writing.  
* Examples of an input and output for the program are below.

Input:
```
21
123
22
1234
20
1001
100500
1000
100
-70001
-70001
-70000
-70004
0
```

Output:
```
1234
100500
0
0
-70001
```

## References

* Virtual Memory. Section 8.4 in [[DDCA]](../../books.md#ddca).
* Large and Fast: Exploiting Memory Hierarchy. Chapter 5 in [[CODR]](../../books.md#codr). 
* Ulrich Drepper. [What Every Programmer Should Know About Memory](
  https://github.com/andrewt0301/hse-acos-course/blob/master/related/cpumemory.pdf).
* [Translation lookaside buffer](https://en.wikipedia.org/wiki/Translation_lookaside_buffer) (Wikipedia).
