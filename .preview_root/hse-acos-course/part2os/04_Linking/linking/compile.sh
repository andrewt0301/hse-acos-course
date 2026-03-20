#!/bin/sh
riscv64-unknown-linux-gnu-gcc -c main.c -O1 -march=rv64g
riscv64-unknown-linux-gnu-gcc -c sum.c -O1 -march=rv64g
riscv64-unknown-linux-gnu-gcc -o main main.o sum.o
riscv64-unknown-linux-gnu-objdump -r -d sum.o
riscv64-unknown-linux-gnu-objdump -r -d main.o
riscv64-unknown-linux-gnu-objdump -x -d main
