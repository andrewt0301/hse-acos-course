#include <stdio.h>

int gcd(int a, int b) {
    if (b == 0)
        return a;
    else
        return gcd(b, a % b);
}

int main() {
    int x = gcd(10, 25);
    printf("gcd(10, 25) = %d\n", x);
    return 0;
}
