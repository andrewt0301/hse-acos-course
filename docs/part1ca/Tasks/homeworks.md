<!---
The JavaScript code below is needed to support rendering of TeX formulas in GitHub Pages.

See this for kramdown:
https://mikelove.wordpress.com/2015/07/01/how-to-use-latex-math-in-rmd-to-display-properly-on-github-pages/
https://varunagrawal.github.io/2018/03/27/latex
https://stackoverflow.com/questions/26275645/how-to-support-latex-in-github-pages

This is a guideline to render formulas:
https://coderoad.ru/49970549/Проблема-рендеринга-некоторого-синтаксиса-latex-в-MathJax-с-Jekyll-на-github
-->
<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [['$$','$$'], ['\\(','\\)']],
      processEscapes: true
    }
  });
</script>

Home Tasks
---

<!--- 
Here are assembly programming tasks, which were given during the previous year.
They are enough. However, they were somewhat challenging for some students.

Taken from here: https://uneex.ru/CategoryHomework
-->

# Task List

1. [DoubleSum](#doublesum)
1. [DigitSum](#digitsum)
1. [PlusMinus](#plusminus)
1. [EvenBack](#evenback)
1. [NoDups](#nodups) 
1. [CheckTriangles](#checktriangles)
1. [FuncSort](#funcsort)
1. [RecursiveGCD](#recursivegcd)
1. [LeftDigits](#leftdigits)
1. [CubicRoot](#cubicroot)
1. [FractionTruncate](#fractiontruncate)
1. [LeibPi](#leibpi)
1. [ASCIIGrid](#asciigrid)
1. [KeySort](#keysort)
1. [ReverseString](#reversestring)
1. [CrtDraw](#crtdraw)
1. [NoError](#noerror)
1. [EightSectors](#eightsectors)
1. [LargestSum](#largestsum)
1. [Palindrome](#palindrome)

# Task Descriptions

1. ###### DoubleSum

   Enter four integers, one in line, and add unconditionally the first one to the third one,
   and the second one to the fourth one.
   Print the results in two lines.

   Input:
   ```
   234
   -23
   23
   64
   ```
   Output:
   ```
   257
   41
   ```

1. ###### DigitSum

   Input an integer (can be negative), and output the sum of its digits.

   Input:
   ```
   -12345
   ```
   Output:
   ```
   15
   ```

1. ###### PlusMinus

   Input a cardinal N, then input N integers a(i); output the result of a(0)-a(1)+a(2)-...±a(N-1).

   Input:
   ```
   4
   22
   13
   14
   15
   ```
   Output:
   ```
   8
   ```

1. ###### EvenBack

   Input a cardinal N, then N integers. Output line by line only even ones, in reversed order.

   Input:
   ```
   6
   12
   -11
   3
   88
   0
   1
   ```
   Output:
   ```
   0
   88
   12
   ```

1. ###### NoDups

   Input a cardinal N, then N integers. Output all the integers, skipping duplicated ones.

   Input:
   ```
   8
   12
   34
   -12
   23
   12
   -12
   56
   9
   ```
   Output:
   ```
   12
   34
   -12
   23
   56
   9
   ```

1. ###### CheckTriangles

   Write a subroutine check, which inputs 3 integers and checks if they can form a triangle (a=b+c is valid).
   Subroutine returns 1 if they can. 2 if not, and 0 if they were 0, 0, 0.
   Write a program that calls check and prints 'Y' on 1, or 'N' on 2, until check returns 0; then program must exit.

   Input:
   ```
   1
   2
   3
   4
   5
   6
   1
   4
   8
   0
   0
   0
   ```
   Output:
   ```
   Y
   Y
   N
   ```

1. ###### FuncSort

   Write a program, that inputs N, then N numbers, and then outputs them sorted in one line.
   You may need to write a sort subroutine, but it is not mandatory here.

   Input:
   ```
   5
   -123
   34
   546
   0
   -100500
   ```
   Output:
   ```
   -100500 -123 0 34 546
   ```

1. ###### RecursiveGCD

   Write a program that inputs two numbers and output their
   [greatest common divisor](https://en.wikipedia.org/wiki/Greatest_common_divisor).
   You must write a recursive subroutine gcd to complete this task.

   Input:
   ```
   2467080
   49360080
   ```
   Output:
   ```
   9240
   ```

1. ###### LeftDigits

   Write a program that inputs a cardinal N and then inputs N numbers (can be negative).
   After that it outputs only first digits of these numbers (in one line).
   You are inclined to write a subroutine "first" that accepts a number (via $a0)
   and returns last digit (via $v0).

   Input:
   ```
   5
   -2345
   7345623
   -4321
   2 
   7543
   ```
   Output:
   ```
   27427
   ```

1. ###### CubicRoot

   Input double (positive or negative) float $$1 <= |A| <= 1000000$$ and $$0.00001<= ɛ <=0.01$$.
   Calculate a cubical root of A with closeness $$<=ɛ$$ (you do not need to round the result).

   HINT: You always can calculate a cubic power of something!

   Input:
   ```
   1000
   0.0001
   ```
   Output:
   ```
   9.99995
   ```

   Spoiler: suppose solution is between M and N (M < N).
   Select $$K=(M+N)/2$$ and if $$|K^3|>|A|$$ then solution is between M and K, else it is between K and N.

1. ###### FractionTruncate

   Input three cardinals — `A`, `B` and `n`.
   Output double float `F` that has exact `n` decimal places of `A/B`.
   You need to write a subroutine than accepts double `f=A/B` in `$f12` and integer `n` in `$a0`
   and returns rounded double `F` in `$f0`.

   Hint: $$10^n*A/B < 2^{31}$$

   Input:
   ```
   123
   456
   7
   ```
   Output:
   ```
   0.2697368
   ```

   Spoiler:
   $$10^n*A/B < 2^{31}$$ means that you can just take an integer part of it,
   then divide the result back to $$10^n$$

1. ###### LeibPi

   Calculate π value using [Leibniz formula for π](https://en.wikipedia.org/wiki/Leibniz_formula_for_π)
   accurate to N decimal places. Input N, output the result.
   Use function defied in [FractionTruncate](#fractiontruncate) to truncate out other digits.
   Keep in mind that the exact formula is calculating π/4, you probably should start with 4 instead 1
   to gain exact accuracy. Warning: the algorithm is _slow_, do not panic, but keep code as simple as possible.

   Input:
   ```
   4
   ```
   Output:
   ```
   3.1416
   ```

   Hint: to gain performance, keep anything in registers.

1. ###### ASCIIGrid

   Write a program that inputs ordinals M an N, and outputs MxN grid made with «+» and «-».
   You should write a macro that accepts three parameters:
   a number of cells and two characters, and outputs a line like this:

   ```
   printline 4, '+', '-'
   →
   +-+-+-+-+
   ```
   Input:
   ```
   3
   4
   ```
   Output:
   ```
   +-+-+-+
   | | | |
   +-+-+-+
   | | | |
   +-+-+-+
   | | | |
   +-+-+-+
   | | | |
   +-+-+-+
   ```

1. ###### KeySort

   Write a program of key sorting. You should write a subroutine that accepts three arguments:
   array size (in _words_, not in bytes), array address, and comparison subroutine.
   Your subroutine sorts an array and return array size in `$v0` and array address in `$v1`.
   Your subroutine should use comparing subroutine to determine if two elements is in order.
   Comparing subroutine accepts integers in `$a0` and `$a1` and returns 1 in `$v0`
   if they are in proper order, and 0 otherwise.
   Write _two_ comparing subroutines: first for `$a0` < `$a1`, second for `$a0 % 10` > `$a1 % 10`.
   Please use bubble sort algorithm (ar any other _stable_).
   Your program reads an ordinal N, then an integer T, then N integers.
   If T is 0, use first comparison subroutine, if T != 0, use second one.
   Then output an array.

   Input:
   ```
   9
   0
   34
   456
   2
   5
   567
   2
   2
   0
   42
   ```
   Warning: array size must be in words.
   
   Output:
   ```
   0
   2
   2
   2
   5
   34
   42
   456
   567
   ```
   Another example:

   Input:
   ```
   15
   1
   49
   20
   29
   52
   39
   22
   23
   43
   44
   16
   52
   47
   30
   23
   24
   ```
   Output:
   ```
   49
   29
   39
   47
   16
   44
   24
   23
   43
   23
   52
   22
   52
   20
   30
   ```

1. ###### ReverseString

   Write a program which accepts a sequence of non-empty strings
   (each not longer than 200 characters) and outputs every string backwards.
   Sequence ends with a string started from '.'; this final string is not printed.
   You should write a subroutine which accepts string address in $a0 and prints it backwards.
   Caution: if you want to use syscall 8, read carefully the documentation about '\n' at the end
   of the input string (it either can evolve or not, you should omit it).

   Input:
   ```
   Write a program which accepts a sequence of strings
   and outputs every string backwards.
   Empty strings are treated as normal.
   .that's all
   Also, Captain Obvius suggests not to use syscall 4 (use repetitive syscall 11 instead)
   ```
   Output:
   ```
   sgnirts fo ecneuqes a stpecca hcihw margorp a etirW
   .sdrawkcab gnirts yreve stuptuo dna
   .lamron sa detaert era sgnirts ytpmE
   ```

1. ###### CrtDraw

   Write a program, that inputs an odd number of integers.
   Each odd input is an X coordinate, and each even input is an Y coordinate
   of a certain point in a matrix.
   The matrix is 16×16, and X and Y are in the range from 0 to 15.
   The `(0, 0)` coordinate is in the upper-left corner;
   X grows from left to right, and Y grows from top to bottom.
   If X is negative, input finishes, and the program outputs the 16×16 character matrix.
   The matrix contains `*` at coordinates specified by previous `(X, Y)` inputs
   and `.` at empty places.

   Input:
   ```
   1
   1
   2
   2
   13
   2
   12
   3
   11
   11
   12
   12
   1
   14
   0
   15
   -1
   ```

   Output:
   ```
   ................
   .*..............
   ..*..........*..
   ............*...
   ................
   ................
   ................
   ................
   ................
   ................
   ................
   ...........*....
   ............*...
   ................
   .*..............
   *...............
   ```

1. ###### NoError

   Write a program that inputs 10 integers, not taking in account failed inputs.
   When all 10 integers are read, the program outputs them.

   Input:
   ```
   zz
   20
   fwewefqwe
   .654
   71
   -124
   0.1
   82
   6.
   334423
   -94
   VII
   7535
   6
   .
   -
   17
   8968
   ```
   Output:
   ```
   20
   71
   -124
   82
   334423
   -94
   7535
   6
   17
   8968
   ```

   It is suggested to use an array to store successful inputs and universal exception handler
   that marks specific memory variable to skip unsuccessful ones.

1. ###### EightSectors

   Write a program that inputs 8 integers and colours `Bitmap Display` with size 128×128 dots
   based on `0x10010000` like this:
   ![](images/EightSectors.png)
   * Numbers here indicate color numbers, you __do not need__ to draw them.
   * Please note the corners: ![](images/ld.png), ![](images/lu.png), ![](images/rd.png),
     ![](images/ru.png) and the center: ![](images/c.png).
     To see this better, you can scale Bitmap Display «size in pixels» by 4
     (this will not affect the program).
   * EJudge cannot interact with Bitmap Display, the program must dump all videomemory
     so to pass the test.

   Colors (integer values):
   ```
   0 = 16711680
   1 = 65280
   2 = 255
   3 = 16776960
   4 = 16711935
   5 = 65535
   6 = 16777215
   7 = 8947848
   ```

   _Hint_: color numbers `0..7` consist of three bits:

   * x >= Width/2 (0 bit)
   * y >= Height/2 (1 bit)
   * x >= y xor x+y<(W+H)/2 (3 bit)
   
   Output:
   ```
   0x00ff0000
   0x00ff0000
   0x00ff0000
   0x00ff0000
   ...
   (many lines) (how many ☺?)
   ...
   0x00ffff00
   0x00ffff00
   0x00ffff00
   0x00888888
   ```

1. ###### LargestSum

   __TODO: More detailed description__

   Suppose you are given an array of both positive and negative integers. 
   Write MIPS assembly code that finds the subset of the array with the largest sum. 
   Assume that the array’s base address and the number of array elements are in $a0 and $a1, 
   respectively. 
   Your code should place the resulting subset of the array starting at base address$a2. 
   Write code that runs as fast as possible.

1. ###### Palindrome

   __TODO: More detailed description__

   Design an algorithm for testing whether a given string is a palindrome. 
   (Recall that a palindrome is a word that is the same forward and backward. 
   For example, the words “wow” and “racecar” are palindromes.) 
   Implement your algorithm using RISC-V assembly code.
