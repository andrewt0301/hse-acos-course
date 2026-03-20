Lecture 4
---

# Linking and loading

## Lecture

Slides ([PDF](OS_Lecture_04.pdf), [PPTX](OS_Lecture_04.pptx)).

### Outline

* Linking ([example](https://github.com/andrewt0301/hse-acos-course/tree/master/docs/part2os/04_Linking/linking))
* Relocatable object files
* Executable and Linkable Format (ELF)
* Shared libraries
* Linked libraries
* Library interpositioning
* Position-independent code
* [Address space layout randomization](https://github.com/andrewt0301/hse-acos-course/tree/master/docs/part2os/04_Linking/aslr)

### Examples

#### Tools for Manipulating Object Files

* [ar](https://man7.org/linux/man-pages/man1/ar.1.html) -
  creates static libraries, and inserts, deletes, lists, and extracts members.
* [strings](https://man7.org/linux/man-pages/man1/strings.1.html) -
  lists all of the printable strings contained in an object file.
* [strip](https://man7.org/linux/man-pages/man1/strip.1.html) -
  deletes symbol table information from an object file.
* [nm](https://man7.org/linux/man-pages/man1/nm.1.html) -
  lists the symbols defined in the symbol table of an object file.
* [size](https://man7.org/linux/man-pages/man1/size.1.html) -
  lists the names and sizes of the sections in an object file.
* [readelf](https://man7.org/linux/man-pages/man1/readelf.1.html) -
  displays the complete structure of an object file, including all of the information
  encoded in the ELF header. Subsumes the functionality of `size` and `nm`.
* [objdump](https://man7.org/linux/man-pages/man1/objdump.1.html) -
  the mother of all binary tools. Can display all of the information in an object file.
  Its most useful function is disassembling the binary instructions in the `.text` section.
* [ldd](https://man7.org/linux/man-pages/man1/ldd.1.html) -
  lists the shared libraries that an executable needs at run time.

#### Executable and Linkable Format (ELF)

`main.o` (relocatable object file):
```
riscv64-unknown-linux-gnu-gcc -c main.c -O1 -march=rv64g
riscv64-unknown-linux-gnu-objdump -r -d main.o

main.o:     file format elf64-littleriscv

Disassembly of section .text:

0000000000000000 <main>:
   0:	ff010113          	addi	sp,sp,-16
   4:	00113423          	sd	ra,8(sp)
   8:	00200593          	li	a1,2
   c:	00000537          	lui	a0,0x0
			c: R_RISCV_HI20	array
			c: R_RISCV_RELAX	*ABS*
  10:	00050513          	mv	a0,a0
			10: R_RISCV_LO12_I	array
			10: R_RISCV_RELAX	*ABS*
  14:	00000097          	auipc	ra,0x0
			14: R_RISCV_CALL	sum
			14: R_RISCV_RELAX	*ABS*
  18:	000080e7          	jalr	ra # 14 <main+0x14>
  1c:	00813083          	ld	ra,8(sp)
  20:	01010113          	addi	sp,sp,16
  24:	00008067          	ret
```

`sum.o` (relocatable object file):
```
tatarnikov@akos:~/sum$ riscv64-unknown-linux-gnu-gcc -c sum.c -O1 -march=rv64g
tatarnikov@akos:~/sum$ riscv64-unknown-linux-gnu-objdump -r -d sum.o

sum.o:     file format elf64-littleriscv

Disassembly of section .text:

0000000000000000 <sum>:
   0:	02b05a63          	blez	a1,34 <.L4>
			0: R_RISCV_BRANCH	.L4
   4:	00050793          	mv	a5,a0
   8:	fff5871b          	addiw	a4,a1,-1
   c:	02071693          	slli	a3,a4,0x20
  10:	01e6d713          	srli	a4,a3,0x1e
  14:	00450513          	addi	a0,a0,4
  18:	00a70733          	add	a4,a4,a0
  1c:	00000513          	li	a0,0

0000000000000020 <.L3>:
  20:	0007a683          	lw	a3,0(a5)
  24:	00a6853b          	addw	a0,a3,a0
  28:	00478793          	addi	a5,a5,4
  2c:	fee79ae3          	bne	a5,a4,20 <.L3>
			2c: R_RISCV_BRANCH	.L3
  30:	00008067          	ret

0000000000000034 <.L4>:
  34:	00000513          	li	a0,0
  38:	00008067          	ret
```

`main` (executable object file):
```
riscv64-unknown-linux-gnu-gcc -o main main.o sum.o
riscv64-unknown-linux-gnu-objdump -x -d main

main:     file format elf64-littleriscv

Disassembly of section .text:

   ...

0000000000010430 <main>:
   10430:	ff010113          	addi	sp,sp,-16
   10434:	00113423          	sd	ra,8(sp)
   10438:	00200593          	li	a1,2
   1043c:	83018513          	addi	a0,gp,-2000 # 12030 <array>
   10440:	010000ef          	jal	ra,10450 <sum>
   10444:	00813083          	ld	ra,8(sp)
   10448:	01010113          	addi	sp,sp,16
   1044c:	00008067          	ret

0000000000010450 <sum>:
   10450:	02b05a63          	blez	a1,10484 <sum+0x34>
   10454:	00050793          	mv	a5,a0
   10458:	fff5871b          	addiw	a4,a1,-1
   1045c:	02071693          	slli	a3,a4,0x20
   10460:	01e6d713          	srli	a4,a3,0x1e
   10464:	00450513          	addi	a0,a0,4 # 12004 <__TMC_END__+0x4>
   10468:	00a70733          	add	a4,a4,a0
   1046c:	00000513          	li	a0,0
   10470:	0007a683          	lw	a3,0(a5)
   10474:	00a6853b          	addw	a0,a3,a0
   10478:	00478793          	addi	a5,a5,4
   1047c:	fee79ae3          	bne	a5,a4,10470 <sum+0x20>
   10480:	00008067          	ret
   10484:	00000513          	li	a0,0
   10488:	00008067          	ret
```

#### Library Interpositioning

* [Compile-time](https://github.com/andrewt0301/hse-acos-course/tree/master/docs/part2os/04_Linking/interpos_comp) 
* [Link-time](https://github.com/andrewt0301/hse-acos-course/tree/master/docs/part2os/04_Linking/interpos_link)
* [Load-time/run-time](https://github.com/andrewt0301/hse-acos-course/tree/master/docs/part2os/04_Linking/interpos_runt)

## Workshop

### Outline

* Creating static libraries
* Creating shared libraries
* Library interpositioning
* Make scripts

### Practice

* [Part 1](libs.md) (Static and shared libraries)
* [Part 2](make.md) (Make files)
* [Part 3](cmake/CMakeLists.txt) (CMake)

## Homework

_Write and submit to GitHub the program described below._
_An instruction on how to work with GitHub is [here](../../software/git.md)_.

### Task

1. Improve Task 1 from [Part 1](libs.md):
   * Provide _link-time_ interpositioning for the `fred` and `john` functions
   * Provide _load-time_ interpositioning for the `bill` and `sam` functions
   * Create a Make script to build the program

Note: interposed functions can just print a message like "fred is called".

## References

* Linking. Chapter 7 in [[CSPP]](../../books.md)
* Section 2.5. in [[OSC]](../../books.md)
* Chapters 41 and 42 in [[TLPI]](../../books.md)
* [Address space layout randomization](
  https://en.wikipedia.org/wiki/Address_space_layout_randomization) (Wikipedia)
