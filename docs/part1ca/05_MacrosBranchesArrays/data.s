#
# Example: Data and its alignment.
#
   .data
   .space 3
word1:
   .word  0x12345678
half1:
   .half  0x1234
byte1:
   .byte  0x12
   .align 4
word2:
   .word 0x12345678
   .align 3
half2:
   .half  0x1234
   .align 3
byte2:
   .byte  0x12
   .align 0
word3:
   .word 0x12345678
