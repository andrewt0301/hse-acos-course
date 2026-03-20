#include <fcntl.h>
#include <unistd.h>
int main() {
    write(1, "Hello World\n", 12);
    return 0;
}
