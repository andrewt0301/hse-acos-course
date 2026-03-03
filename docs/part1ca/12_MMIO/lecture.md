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

_NOTE: The tasks from this workshop may take time. If one workshop is not enough to solve them,
you may take some time from the next workshop (if it does not have a lot of practical materials)._

1. Study and run the examples from the lecture.

1. Input a floating-point number, round it to one digit to the right of decimal point (e.g. `3.5`)
   and display it in the `Digital Sim Lab` display.
   Use [digit_lab1.s](digit_lab1.s) as a starting program.

1. Modify the [digit_lab2.s](digit_lab2.s) program
   to display keys pressed in the hexadecimal keyword in the digital display (as decimal values, e.g. `F` == `15`). Use the workshop task as a basis.

1. Write a program (based on [digit_lab2.s](digit_lab2.s)) that inputs an integer value `X`
   (with the `ReadInt` system call) and then uses `Digital Sim Lab`
   to enter 32-bit integers (8 hexadecimal digits) `Y`.
   It repeats entering integers until the entered `Y` is equal to `X`. Then it prints `FOUND`
   and exits. If `Y` equals `0` the program must print `STOPPED` and exit.

1. Write a program that draws a square with size 64×64 dots in the middle of `Bitmap Display`
   (see the `Tools` menu of RARS) with size 128×128 dots.
   The color and the thickness of lines in dots is specified by the user (use the `ReadInt` system call). See [bitmap_display.s](bitmap_display.s) as an example.

## Homework

Solve the following tasks and submit them into Ejudge:

1. ###### FullRainbow

   Write a program that fills `RARS Bitmap Display` with vertical stripes
   of equal width (+1 pixel), which are painted with the specified colors.
   The colors are input as decimal numbers one per line until `0` is met.
   `0` means the end of the input and is not considered as a color.
   The total number of colors is `N <= 100`.

   * Parameters of `Bitmap Display`: unit size is `2×2`; display size is `512×256`.
   * Formula for the starting position of the `k`-th stripe is `256 * k / N` (integer arithmetic).

   Input:
   ```
   1249394
   7864115
   5601041
   43775
   6706551
   0
   ```

   Output:

   ![FullRainbow](FullRainbow.png)

1. ###### TheCircle

   Write a program that draws a circle in `RARS Bitmap Display`.
   To draw a circle means to paint all points with such coordinates
   that their distance from point `X`/`Y` is not greater than `R`.
   The program inputs 5 non-negative numbers: `X`, `Y`, `R`, color of the circle,
   and color of the background.

   * Parameters of `Bitmap Display`: unit size is `2×2`; display size is `512×256`.
   * It is not guaraneed that the circle fits into the display's address range or
     is located within this range at all.

   Input:
   ```
   100
   60
   50
   15641122
   5575048
   ```

   Output:

   ![TheCircle](TheCircle.png)

## References

* Input/Output. Chapter 8 in [[COA]](../../books.md#coa).
* Memory-mapped I/O. Section 9.2 in [[DDCA]](../../books.md#ddca).
* [Memory-mapped I/O](https://en.wikipedia.org/wiki/Memory-mapped_I/O) (Wikipedia).
* [Direct memory access](https://en.wikipedia.org/wiki/Direct_memory_access) (Wikipedia).
