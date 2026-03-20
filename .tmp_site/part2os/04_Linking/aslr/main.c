#include "stdio.h"

int var = 42;
int func() { return 42; }

int main() {
    int i;
    printf("addr(main): %p\n", main);
    printf("addr(var): %p\n", &var);
    printf("addr(func): %p\n", func);
    printf("addr(i): %p\n", &i);
    printf("addr(var) - addr(func): %ld\n", (long) &var - (long) func);
    printf("addr(main) - addr(func): %ld\n", (long) main - (long) func);
    return 0;
}
