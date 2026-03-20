Examples of Regular Expressions
---

1. Atomic regexp:
    * any non-special character matches exactly same character
        * "`E`" → «`E`»
    * a dot "`.`" matches __any__ one character
        * "`.`" → «`E`»
        * "`.`" → «`:`»
        * "`.`" → «`.`»
    * a set of characters matches any character __from the set__:
        * "`[quack!]`" → «`a`»
        * "`[quack!]`" → «`!`»
        * "`[a-z]`" → «`q`» (any small letter)
        * "`[a-z]`" → «`z`» (any small letter)
        * "`[a-fA-F0-9]`" → «`f`» (any hexadecimal digit)
        * "`[a-fA-F0-9]`" → «`D`» (any hexadecimal digit)
        * "`[abcdefABCDEF0-9]`" → «`4`» (any hexadecimal digit)
    * a negative set of characters matches any character __not from the set__:
        * "`[^quack!]`" → «`r`»
        * "`[^quack!]`" → «`#`»
        * "`[^quack!]`" → «`A`»
    * any atomic regexp followed by "`*`" __repeater__ matches a continuous sequence of substrings,
      including empty sequence, each matched by the regexp
        * "`a*`" → «`aaa`»
        * "`a*`" → «``»
        * "`a*`" → «`a`»
        * "`[0-9]*`" → «`7`»
        * "`[0-9]*`" → «``»
        * "`[0-9]*`" → «`1231234`»
        * "`.*`" → _any string_!
    * any complex regexp enclosed by special grouping parenthesis "`\(`" and "`\)`" (see below)
1. Complex regexp
    * A sequence of atomic regexps
    * Matches a continuous sequence of substrings, each matched by corresponded atomic regexp
        * "`boo`" → «`boo`»
        * "`r....e`" → «`riddle`»
        * "`r....e`" → «`r re e`»
        * "`[0-9][0-9]*`" → any non-negative integer
        * "`[A-Za-z_][A-Za-z0-9]*`" → C identifier (alphanumeric sequence with «`_`», not started from digit)
    * grouping parenthesis can be used for repeating complex regexp:
        * "`\([A-Z][a-z]\)*`" → «`ReGeXp`»
        * "`\([A-Z][a-z]\)*`" → «``»
        * "`\([A-Z][a-z]\)*`" → «`Oi`»
    * Implies __leftmost longest rule__ (aka «greedy»):
      In successful match of complex regexp _leftmost_ atomic regexp takes _longest possible_ match,
      second leftmost atomic regexp takes longest match that possible in current condition; and so on
        * "`.*.*`" → all the string leftmost, empty string next
        * "`[a-z]*[0-9]*[a-z0-9]*`" → «`123b0c0`»
            * "`[a-z]*`" → «»
            * "`[0-9]*`" → «`123`»
            * "`[a-z0-9]*`" → «`b0c0`»
        * "`[a-d]*[c-f]*[d-h]*`" → «`abcdefgh`»
            * "`[a-d]*`" → «`abcd`»
            * "`[c-f]*`" → «`ef`»
            * "`[d-h]*`" → «`gh`»
1. Positioning mark
    * "`^regexp`" matches only substrings located at the beginning of the line
    * "`regexp$`" matches only substrings located at the end of line
