# Linux Utility Programs and Bash

Unix-based systems (such as Linux and macOS) provide utility programs to perform various system tasks. These utilities are accessed via the command-line interface.  
**Bash** is a command-line processor and scripting language used to execute these commands. It is supported on Linux and macOS. In Windows, partial support is implemented in Git Bash. Additionally, some commands are implemented in the terminal of JetBrains IDEs (e.g., PyCharm, IntelliJ IDEA, CLion, etc.).

## Main Bash Commands

1. `man` - displays documentation for other commands.  
1. `pwd` - prints the current working directory.  
1. `ls` - lists the contents of a directory.  
1. `cd` - changes the current directory.  
1. `mkdir` - creates a new directory.  
1. `file` - determines the type of a file.  
1. `echo` - prints messages to the standard output.  
1. `cp` - copies files or folders.  
1. `mv` - renames or moves files or folders.  
1. `rm` - deletes files (and folders with `-rf` flag).  
1. `sudo` - runs a command as a substitute user (e.g., root).   
1. `exit` - exits the Bash shell.  
1. `uname` - prints system information.  
1. `which`, `where` or `whereis` - locates the executable file of a command.

## Installing Additional Programs

### **Debian-based Distributions (.deb-based, e.g., Debian, Ubuntu, Linux Mint)**

Use the `apt` package manager:  
```bash
sudo apt install mc
```

### **Red Hat-based Distributions (e.g., RHEL, CentOS, Fedora)**

Use the `dnf` or `yum` package manager:  
- For Fedora or newer Red Hat-based distributions:  
  ```bash
  sudo dnf install mc
  ```
- For older CentOS/RHEL:  
  ```bash
  sudo yum install mc
  ```

### **Arch-based Distributions (e.g., Arch Linux, Manjaro)**

Use the `pacman` package manager:  
```bash
sudo pacman -S mc
```

### **openSUSE**

Use the `zypper` package manager:  
```bash
sudo zypper install mc
```

### macOS
Use **Homebrew**, a package manager for macOS. Install programs with:  
```bash
brew install mc
```

## Creating, Editing, and Viewing Source Code

1. `cat` - concatenates and prints text files.  
1. `head` - outputs the first part of a file.  
1. `tail` - outputs the last part of a file.  
1. `nano` - a simple console-based text editor.  
1. `mcedit` - a basic text editor from Midnight Commander.  
   - **macOS:** Available if Midnight Commander is installed (via `brew install mc`).  
1. `vim` - Vi IMproved, a powerful text editor for programmers.

## Compiling and Running Programs in C

To compile and run C programs on Linux or macOS, use the following commands:  

### **Compiling:**  
On both Linux and macOS, the GNU Compiler Collection (`gcc`) is used for compiling. However, on macOS, `gcc` is typically an alias for Clang (Apple's compiler). To compile:  
```bash
gcc hello.c -o hello
```

Alternatively, on macOS, you can explicitly use Clang:  
```bash
clang hello.c -o hello
```

### **Running:**  
After compiling, run the program with:  
```bash
./hello
```

### **macOS Specific Note:**  
- If `gcc` or `clang` is not installed, you need to install the **Xcode Command Line Tools**, which include compilers and other development tools.  
  To install them, run:  
  ```bash
  xcode-select --install
  ```  
  Follow the prompts to complete the installation.  


### **Fancy Trick**  
If you want to compile and immediately run your C program in one line, you can use `&&` symbols for this:  
```bash
gcc hello.c -o hello && ./hello
```

## Getting Information About CPU Configuration

### Linux
1. Use the `lscpu` utility to display detailed information about the CPU:  
   ```bash
   lscpu
   ```

2. Alternatively, view the virtual file `/proc/cpuinfo` for CPU details:  
   ```bash
   less /proc/cpuinfo
   ```

### macOS
1. To get CPU details, use the `sysctl` command:  
   ```bash
   sysctl -a | grep machdep.cpu
   ```

2. Alternatively, use `system_profiler`:  
   ```bash
   system_profiler SPHardwareDataType
   ```
