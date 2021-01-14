Lecture 2
---

# Data Representation

## Lecture

Slides ([PDF](CA_Lecture_02.pdf), [PPTX](CA_Lecture_02.pptx)).

#### Outline:

* Bits, bytes, words, etc.
* Binary, decimal, hexadecimal.
* Byte ordering: big-endian and little-endian.
* Integer formats. Signed and unsigned.
* Bitwise and integer operations.

## Workshop

#### Outline

* Discuss current issues with VirtualBox and Linux VM.
* Play with converting values to different numeric systems (binary, decimal, hexadecimal).
  _Hint:_ Use "whiteboard" and calculator.
* Run the _dumpbytes.c_ program that dumps byte-level representations of integers and strings.
  Try dumping your own values.
     
#### Tasks     

* View and run the [dumpbytes.c](
  https://github.com/andrewt0301/hse-acos-course/blob/master/docs/part1ca/02_DataTypes/dumpbytes.c) program.

  ```
  gcc dumpbytes.c -o dumpbytes
  ./dumpbytes
  ```

  Pay attention to addresses and byte ordering.
  Is your machine big- or little-endian?

## Homework

__TODO__

## References

* [Machine word](https://en.wikipedia.org/wiki/Word_%28computer_architecture%29) (Wikipedia).
* [Endianness](https://en.wikipedia.org/wiki/Endianness) (Wikipedia).
* Representing information. Chapter 1 in [[CSPP]](../../books.md).
* Arithmetic for computers. Chapters 3 in [[CODR]](../../books.md).
