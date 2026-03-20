Lecture 5
---

# Dynamic Memory Allocation

## Lecture

Slides ([PDF](OS_Lecture_05.pdf), [PPTX](OS_Lecture_05.pptx)).

#### Outline

* Heap management and dynamic memory allocation
* [malloc](https://man7.org/linux/man-pages/man3/malloc.3.html) package
* Internal and external fragmentation
* Implicit and explicit lists, segregated lists, sorting blocks by size
* Headers and footers
* Placement policies
* Splitting and coalescing

#### Example

Simple `malloc` [implementation](memory/malloc.c) based on an implicit list and the first-fit policy
(full project is [here](https://github.com/andrewt0301/hse-acos-course/tree/master/docs/part2os/05_Strings/memory)).

Try using it to allocate memory for various programs. For example:
```cpp
#include <iostream>
#include <string>
#include <vector>

int main() {
  std::string s = "Hello World!";
  std::cout << s << std::endl;
  std::vector<int> v(20, 0);
  int *pp = new int[10];
  delete pp;
  std::string text = "This is some random very long text!";
  return 0;
}
```
```bash
make runcpp
gcc -Wall -g -shared -fpic -o libmalloc.so malloc.c
g++ test.cpp -o testcpp
LD_PRELOAD="./libmalloc.so" ./testcpp
malloc(73728)
malloc is initialized
start=0x56f5dd354000
end=  0x56f5dd355000
head= 0x56f5dd354008
malloc(73728) = 0x56f5dd354008
malloc(1024)
malloc(1024) = 0x56f5dd366010
Hello World!
malloc(80)
malloc(80) = 0x56f5dd366418
malloc(40)
malloc(40) = 0x56f5dd366470
free(0x56f5dd366470)
malloc(36)
malloc(36) = 0x56f5dd366470
free(0x56f5dd366470)
free(0x56f5dd366418)
```

#### Tasks

To practice with memory-allocation algorithms, do the following exercises:

1. Change the implementation to support the next-fit strategy. How will this affect memory utilization?
2. Improve the `realloc` implementation in the example:
   * If the new size is smaller than the original size of the block, split the block
     (the remaining part becomes in empty block).
   * If the next block is empty and is sufficiently large, extend the current block instead
     of freeing it, allocating a new one, and copying data. 
3. Improve memory utilization: footers are used for coalescing adjacent free blocks and required only for free blocks.
   This means that, for allocated blocks, they can be a part of the payload. To know whether the previous block
   is allocated or free, we can use lower bits of the current block's header. Block size is always multiple of 8,
   which means that 3 lower bits are 0. The 0th bit is already used to store the block status (allocated or free).
   The remaining two are vacant.
4. Improve performance of free block search: maintain an explicit double-linked list of free nodes.
   This would allow skipping allocated nodes when searching. Pointers to the previous and next free node can
   be stored inside the body (payload) of a free block. This means that the minimal block size will be 24 bytes:
   4 (header) + 8 (pointer to prev) + 8 (pointer to next) + 4 (footer).
   Also, it is often recommended to align blocks. So, the recommended size is 32 bytes (+8 bytes alignment padding). 

## Workshop

Workshop on strings in C language is [here](strings/workshop.md).

See the __Homework__ in the workshop materials.

# References

* Dynamic Memory Allocation. Section 9.9 in [[CSPP]](../../books.md)
* Interlude: Memory API. Chapter 14 in [[COMET]](../../books.md)
* Free-Space Management. Chapter 17 in [[COMET]](../../books.md)
* Memory Allocation. Chapter 7 in [[TLPI]](../../books.md)
* Donald Knuth. [The Art of Computer Programming](
  https://en.wikipedia.org/wiki/The_Art_of_Computer_Programming).
  Volume 1. Fundamental algorithms. Section 2.5. Dynamic storage allocation.
* [C dynamic memory allocation](https://en.wikipedia.org/wiki/C_dynamic_memory_allocation) (Wikipedia)
* [Buddy memory allocation](https://en.wikipedia.org/wiki/Buddy_memory_allocation) (Wikipedia)
* [Slab allocation](https://en.wikipedia.org/wiki/Slab_allocation) (Wikipedia)
* [Malloc tutorial](https://danluu.com/malloc-tutorial/)
* [Memory Allocators](https://github.com/mtrebi/memory-allocators)
* [glibc's malloc](https://sourceware.org/glibc/wiki/MallocInternals) (example of real-word malloc implementation)
* [jemalloc](https://jemalloc.net/) (example of real-word malloc implementation)
* [mimalloc](https://en.wikipedia.org/wiki/Mimalloc) (example of real-word malloc implementation)
