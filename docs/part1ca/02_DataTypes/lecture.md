Lecture 2
---

# Data Representation

## Lecture

Slides ([PDF](CA_Lecture_02.pdf), [PPTX](CA_Lecture_02.pptx)).

#### Outline

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
* Run the [dumpbytes.c](dumpbytes.c) program that dumps byte-level representations of integers and strings.
  Try dumping your own values.
* Play with negation, sign-extension, and zero-extension.
* Play with addition and subtraction.
* Explain some bit tricks from Hacker's Delight.  
     
#### Tasks

1. Convert the following decimal numbers to 5-bit binary numbers.
   
   Unsigned: `0`, `1`, `2`, `4`, `7`, `15`, `16`, `31`.
   
   Signed: `0`, `-1`, `-2`, `-4`, `-7`, `15`, `-16`.
 
1. Convert the following 5-bit values to decimal numbers.
   Consider both unsigned and two's complement formats.

   Values: `00101`, `01011`, `10101`, `11111`, `10000`

1. Convert the following decimal values to 8-bit hexadecimal numbers.
   
   Values: `0`, `10`, `14`, `15`, `16`, `32`, `34`, `127`, `128`, `255`

1. Convert the following hexadecimal numbers to 8-bit binary values:

   Values: `0x1`, `0x2`, `0x7`, `0x8`, `0x10`, `0x7F`, `0xFF`, `0x80`

1. Negate the binary values from the previous task.

1. What are the ranges (smallest..largest) for integer values that consist of 4, 5, 6, 7, and 8 bits?
   Consider both unsigned and two's complement formats.

1. View and run the [dumpbytes.c](dumpbytes.c) program.

   ```bash
   cat dumpbytes.c
   gcc dumpbytes.c -o dumpbytes
   ./dumpbytes
   ```

   Pay attention to addresses and byte ordering.
   Is your machine big- or little-endian?

1. Zero-extend and sign-extend the following 4-bit values to 8 bits. Convert the result to decimal numbers.

   Values: `0001`, `1111`, `1010`, `1000`, `0111`

1. Shift the following 8-bit binary value 3-digits to the right and to the left.
   Consider logic and arithmetical shifts.

   Values: `0000_1010`, `1111_1111`, `1000_1010`

1. Perform the bitwise _AND_ and _OR_ operations for the following pairs of values:

   Values: (`0011`, `1100`), (`1011`, `1101`), (`0101`, `1001`), (`1010`, `1110`)

1. Perform the bitwise _XOR_ operation for the following pairs of values from the previous task.

1. (*) Explain the following bit trick. Swapping values `x` and `y` without using a temporary variable
   can be done in the following way:

   ```
   x = x ^ y;
   y = x ^ y;
   x = x ^ y;
   ```

   How does it work? Take values from the previous task as an example.

1. Add the following pairs of 4-bit binary values. Check the result bt converting values to decimal numbers.

   Values: (`0001`, `1110`), (`0111`, `0001`), (`1101`, `0011`), (`0101`, `1001`)

   Which additions cause an overflow?
   
1. Subtract pairs of values from the first example.

1. What to you need to do to set (assign 1) and reset (assign 0) to the _N_-th bit in value `x`? 

1. (*) Explain the following bit tricks:

   * `x & (x - 1)` - turning off the rightmost 1-bit (e.g. `01011000` => `01010000`).
   * `x | (x + 1)` - turning on the rightmost 0-bit (e.g. `10100111` => `10101111`).
   * `x | (x - 1)` - turning on the trailing 0's (e.g. `10101000` => `10101111`).

Finish all the tasks. Make sure you understand everything.

## Homework

__NOTE: This is a self-study activity, do not need to hand in, no checking, no score.__

1. Convert the following decimal numbers to __6-bit__ binary numbers (describe how you have done this).

   Unsigned: `0`, `13`, `24`, `63`.

   Signed: `16`, `-2`, `31`, `-32`.
 
2. Convert the following __6-bit__ values to decimal numbers.
   Consider both unsigned and two's complement formats (provide a formula).

   Values: `000101`, `101011`, `111111`, `100000`

3. Convert the following decimal values to 8-bit hexadecimal numbers.

   Values: `7`, `240`, `171`, `126`

4. Convert the following hexadecimal numbers to 8-bit binary values:

   Values: `0x3C`, `0x7E`, `0xFF`, `0xA5`

5. Negate the binary values (integer negation) from the previous task.

6. Describe how bytes of the `0xDEADBEEF` value would be located in memory for Big- and Little-Endian convention.

7. Convert the following decimal values to __5-bit__ binary values. Then sign- and zero- extend them to 8-bit binary values.

   Values: `7`, `15`, `-16`, `-5`

8. Convert the following pairs decimal numbers to 4-bit binaries and add them.

   Values: unsigned (`7`, `9`), signed (`4`, `-5`)

## References

* [Machine word](https://en.wikipedia.org/wiki/Word_%28computer_architecture%29) (Wikipedia).
* [Endianness](https://en.wikipedia.org/wiki/Endianness) (Wikipedia).
* Representing information. Chapter 2 in [[CSPP]](../../books.md).
* Arithmetic for computers. Chapters 3 in [[CODR]](../../books.md).
* (_Additionally_) Henry Warren. [Hacker's Delight](https://en.wikipedia.org/wiki/Hacker%27s_Delight). 2nd Edition. 2013.
