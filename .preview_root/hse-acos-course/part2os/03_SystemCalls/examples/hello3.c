#include <unistd.h>
#include <sys/syscall.h>
int main() {
    syscall(1, 1, "Hello World\n", 12);
    return 0;
}
