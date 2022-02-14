#include <stdio.h>

int fib(int n) {
    if (n < 2)
        return n;
    else
        return fib(n-1) + fib(n-2);
}

int main() {
    int x = fib(7);
    printf("fib(7) = %d\n", x);
    return 0;
}
