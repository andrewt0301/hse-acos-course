# Software

This page contains a list of software tools that will be used in seminars and home tasks.

## Contents

* [Git and GitHub](#git)
* [RARS](#rars)
* [VirtualBox](#virtualbox)
* [Linux Ubuntu](#linux-ubuntu)
* [GCC](#gcc)
* [QEMU](#qemu)
* [Docker](#docker)
* [WSL](#wsl)

## Git and GitHub

We will use GitHub and Git to submit some homeworks. More details are [here](software/git.md).

## RARS

RARS in a RISC-V Assembler and Runtime Simulator. More details are [here](software/rars.md).

## VirtualBox

[VirtualBox](https://www.virtualbox.org) is a virtualization tools that allows running
Linux inside of Windows or OS X machines. The recommended version is 7.1.
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
a RISC-V hardware environment in ordinary x86 desktops or laptops. Here instructions how\
to install QEMU for RISC-V and run Linux in it. 

* [Running 64- and 32-bit RISC-V Linux on QEMU](
https://risc-v-getting-started-guide.readthedocs.io/en/latest/linux-qemu.html).

* [RISC-V from scratch 1: Introduction, toolchain setup, and hello world!](
https://twilco.github.io/riscv-from-scratch/2019/03/10/riscv-from-scratch-1.html)

## Docker

[Docker](https://www.docker.com) is a platform that helps developers build, package, and run applications in isolated environments called containers.

Containers include everything an application needs to work—code, libraries, and system tools—so the app runs the same way on any computer.
Docker makes it easier to develop, test, and deploy software because containers are lightweight, fast, and portable. It is widely used in modern software development, cloud computing, and DevOps.

[Wikipedia](https://en.wikipedia.org/wiki/Docker_%28software%29)

## WSL

[Windows Subsystem for Linux (WSL)](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux) is a compatibility
layer for running Linux binary executables (in ELF format) natively on Windows 10 and Windows Server 2019.
This is an additional tools that can be usefull for those, who use Windows.
It is convenient in some cases, but there are limitations.

1. Open PowerShell as administrator.
2. Install WSL with the single command `wsl --install -d Ubuntu` (-d for -distribution). Be sure to reboot your computer afterwards.
3. Complete the Ubuntu setup: аfter rebooting, enter `wsl` in the start menu and run it. After the distribution has downloaded, do:
- Enter your Linux username
- Set a password

The password won't display as you type — this is normal.

4. Verify that WSL is installed with the command `wsl --list`.
