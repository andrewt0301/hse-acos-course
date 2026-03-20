Using the RISC-V Toolchain
---

_Note: If the toolchain is unavailable, use compiler explorer [Godbolt](https://godbolt.org/)._

1. Run the [Linux Ubuntu 20.04 LTS with RISC-V toolchain](../../software/ubuntu.md) VM in your VirtualBox.

1. Use the password `acos2020` to log in and open the Bash terminal.

1. (Optional) Connect to the VM from your host OS (MacOS or Windows)
   via SSH by executing the following command in the terminal (use the same password):

       ssh acos@localhost -p2022 

1. Create a C program (e.g. `prog.c`) using your favourite editor (_nano_,  _mcedit_, _vim_, etc.).

1. Compile the C program to the assembly language:

       riscv64-unknown-linux-gnu-gcc prog.c -S

1. Compile the C program to the assembly language with optimizations enabled:

       riscv64-unknown-linux-gnu-gcc prog.c -S -O1

1. Compare the optimized and the unoptimized versions of the assembly program (the `prog.s` file).

1. Compile the assembly program to the object format and link it to an executable file:

       riscv64-unknown-linux-gnu-gcc prog.s -o prog -static

1. Run the program using the [Spike](https://github.com/riscv/riscv-isa-sim) simulator:

       spike $RISCV/riscv64-unknown-linux-gnu/bin/pk prog

See the list of optimization flags supported by GCC [here](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html).

See the RISC-V options for GCC [here](https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html).
