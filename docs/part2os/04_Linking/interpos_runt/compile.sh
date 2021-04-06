#!/bin/sh
gcc -Wall -DRUNTIME -shared -fpic -o mymalloc.so mymalloc.c -ldl
gcc -Wall -o intr int.c
# (LD_PRELOAD="./mymalloc.so" ./intr)

