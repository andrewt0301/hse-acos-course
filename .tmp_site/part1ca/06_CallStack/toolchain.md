Using the RISC-V toolchain
---

The toolchain is installed in Cloud [Ubuntu VM](../../software/cloud_ssh.md).

Creating a "Hello World" program:

    tatarnikov@akos:~/hello$ cat hello.c
    #include <stdio.h>
    int main() {
      printf("Hello World!\n");
      return 0;
    }

Compiling a C program to RISC-V executable:

    tatarnikov@akos:~/hello$ riscv64-unknown-linux-gnu-gcc hello.c -o hello -static

Compiling a C program to RISC-V assembly:

    tatarnikov@akos:~/hello$ riscv64-unknown-linux-gnu-gcc hello.c -S

Assembling and linking a RISC-V assembly program to executable:

    tatarnikov@akos:~/hello$ riscv64-unknown-linux-gnu-gcc hello.s -o hello -static

Disassembling a compiled executable file:

    tatarnikov@akos:~/hello$ riscv64-unknown-linux-gnu-objdump hello -S

Running the compiled program with the Spike RISC-V simulator:

    tatarnikov@akos:~/hello$ spike $RISCV/riscv64-unknown-linux-gnu/bin/pk hello
    bbl loader
    Hello, world!
