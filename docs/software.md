# Software

This page contains a list of software tools that will be used in seminars and home tasks.

## Contents

* [RARS](#rars)
* [VirtualBox](#virtualbox)
* [Linux Ubuntu](#linux-ubuntu)
* [GCC](#gcc)
* [QEMU](#qemu)
* [Docker](#docker)
* [WSL](#wsl)

## RARS

RARS in a RISC-V Assembler and Runtime Simulator. More details are [here](software/rars.md).

## VirtualBox

[VirtualBox](https://www.virtualbox.org) is a virtualization tools that allows running
Linux inside of Windows or OS X machines. The recommended version is 6.1.
Here is the [download](https://www.virtualbox.org/wiki/Downloads) page.

## Linux Ubuntu

[Linux Ubuntu](https://ubuntu.com) is one the most popular Linux distributions.
More details are [here](software/ubuntu.md).

## GCC

[GCC (the GNU Compiler Collection)](https://en.wikipedia.org/wiki/GNU_Compiler_Collection)
will be used to compile programs created during this course. We will compile
programs written both in C language and assembly language.
 
C language programs will be complied both for x86 and RISC-V architectures.
So we will be able to run them in our laptops and inside a RISC-V simulator.
Assembly programs writted in the RISC-V assembly language will be compiled for the RISC-V architecture.

For x86 we will use a standard GNU toolchain provided with Ubuntu Linux.
For RISC-V we will use [RISC-V GNU Compiler Toolchain](https://github.com/riscv/riscv-gnu-toolchain). 

## QEMU

[QEMU](https://www.qemu.org) is machine emulator and virtualizer that will be used to emulate
a RISC-V hardware environment in ordinary x86 descktops or laptops. Here instructions how\
to install QEMU for RISC-V and run Linux in it. 

* [Running 64- and 32-bit RISC-V Linux on QEMU](
https://risc-v-getting-started-guide.readthedocs.io/en/latest/linux-qemu.html).

* [RISC-V from scratch 1: Introduction, toolchain setup, and hello world!](
https://twilco.github.io/riscv-from-scratch/2019/03/10/riscv-from-scratch-1.html)

## Docker

[Docker](https://www.docker.com) is  

[Wikipedia](https://en.wikipedia.org/wiki/Docker_%28software%29)

??? __TODO__

## WSL

[Windows Subsystem for Linux (WSL)](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux) is a compatibility
layer for running Linux binary executables (in ELF format) natively on Windows 10 and Windows Server 2019.
This is an additional tools that can be usefull for those, who use Windows.
It is convenient in some cases, but there are limitations.
