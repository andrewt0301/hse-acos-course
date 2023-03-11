Lecture 12
---

# Memory-Mapped I/O (MMIO)

## Lecture

Slides ([PDF](CA_Lecture_12.pdf), [PPTX](CA_Lecture_12.pptx)).

#### Outline

* I/O devices
* Direct memory access (DMA)
* Memory-mapped I/O (MMIO)
* Drivers
* RARS MMIO device emulators

#### Examples

* [digit_lab1.s](digit_lab1.s)
* [digit_lab2.s](digit_lab2.s)
* [digit_lab3.s](digit_lab3.s)
* [bitmap_display.s](bitmap_display.s)
* [mmio_poll.s](mmio_poll.s)
* [mmio_interrupt.s](mmio_interrupt.s)

## Workshop

1. Input a floating-point number, round it to one digit to the left of decimal point (e.g. `3.5`)
   and display it in the Digital Sim Lab display.
   User [digit_lab1.s](digit_lab2.s) as a starting program.

# Homework

Solve the following tasks:

1. Modify the [digit_lab2.s](digit_lab2.s) program
   to display keys pressed in the hexadecimal keyword in the digital display (as decimal values, e.g. `F` == `15`).
   Use the workshop task as a basis.

2. Write a program (based on `digit_lab2.s`) that inputs an integer value `X` (with the `ReadInt` system call)
   and then uses `Digital Sim Lab` to enter 32-bit integers (8 hexadecimal digits) `Y`.
   It repeats entering integers until the entered `Y` is not equal to `X`. Then it prints `FOUND` and exits.
   If `Y` equals `0` the program must print `STOPPED` and exit.

3. Write a program that draws a square with size 64×64 dots in the middle of `Bitmap Display`
   (see the `Tools` menu of RARS) with size 128×128 dots.
   The color and the thickness of lines in dots is specified by the user (use the `ReadInt` system call).
   See [bitmap_display.s](bitmap_display.s) as an example.

3. __Bonus task (2 bonus points)__. [EightSectors](../Tasks/homeworks.md#eightsectors)

Commit the programs to your private GitHub account. Place them into the folder `ca/lab08`.

## References

* [Memory-mapped I/O](https://en.wikipedia.org/wiki/Memory-mapped_I/O) (Wikipedia).
* [Direct memory access](https://en.wikipedia.org/wiki/Direct_memory_access) (Wikipedia).
