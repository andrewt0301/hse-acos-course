#!/bin/sh
gcc main.c -o main

sudo sysctl kernel.randomize_va_space=0
echo "\nASLR is disabled"
./main

sudo sysctl kernel.randomize_va_space=1
echo "\nASLR is enabled"
./main
