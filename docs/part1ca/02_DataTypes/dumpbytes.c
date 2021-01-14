#include <stdio.h>

typedef unsigned char * byte_pointer;

void show_bytes(byte_pointer start, size_t len) {
    printf("0x%08X: ", start);
    int i;
    for (i = 0; i < len; i++) {
        printf("%02X ", start[i]);
    }
    printf("\n");
}

void show_int(int x) {
    show_bytes((byte_pointer) &x, sizeof(int));
}

void show_long(long x) {
    show_bytes((byte_pointer) &x, sizeof(long));
}

void show_float(float x) {
    show_bytes((byte_pointer) &x, sizeof(float));
}

void show_pointer(void *x) {
    show_bytes((byte_pointer) &x, sizeof(void*));
}

int main() {
    int data[] = {0, 1, -1, 0x12345678, 0xDEADBEEF, 15213, -15213};
    for (int i = 0; i < sizeof(data) / sizeof(int); ++i) {
        show_bytes((byte_pointer) &data[i], sizeof(int));
    }
    char str[] = "Hello World!";
    show_bytes((byte_pointer) str, sizeof(str));
    return 0;
}
