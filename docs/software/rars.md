# RARS Installation and Setup Guide

## Overview

**RARS** (RISC-V Assembler and Runtime Simulator) is an assembler and runtime simulator for the RISC-V architecture. It is used in this course to create, assemble, and simulate assembly programs for RISC-V microprocessors.

The home page of the RARS project is [here](https://github.com/TheThirdOne/rars). In case the original repository becomes unavailable, you can use this [fork](https://github.com/andrewt0301/rars).

## Step 1: Install Java

RARS is a Java-based application, so you need to have Java version 8 or higher installed on your computer. Java runs on all major desktop operating systems, including Windows, macOS, and Linux.

### Windows

#### Download Java
1. Go to [Java Downloads](https://www.oracle.com/java/technologies/javase-downloads.html).
2. Download the appropriate version for Windows.

#### Install Java
1. Run the `.exe` installer and follow the instructions.

### macOS

#### Download Java
1. Go to [Java Downloads](https://www.oracle.com/java/technologies/javase-downloads.html).
2. Download the `.dmg` file for macOS.

#### Install Java
1. Open the `.dmg` file and run the `.pkg` installer.
2. If you have **Homebrew** installed, you can also install Java with:
   ```bash
   brew install java
   ```

### Linux

#### Install Java

- **Ubuntu/Debian:**
   ```bash
   sudo apt update
   sudo apt install openjdk-11-jdk
   ```

- **RHEL/CentOS/Fedora:**
   ```bash
   sudo dnf install java-11-openjdk-devel
   ```

- **Arch:**
   ```bash
   sudo pacman -S jdk-openjdk
   ```

#### Verify Installation
Run the following command to verify Java is installed correctly:

```bash
java -version
```

If Java is installed correctly, it will display the version information. If you see the correct version, you are ready to proceed.


## Step 2: Download and Install RARS

### 1. Download RARS

1. Go to the [Releases page of RARS](https://github.com/TheThirdOne/rars).
2. Download the most recent JAR file, typically named something like `rars1_6.jar`.
3. Save the file to a folder where you keep your course-related or project files.

## Step 3: Running RARS on Different Operating Systems

### For Linux and macOS

#### Method 1: Run Directly from the Terminal

1. Open a terminal and navigate to the directory where you downloaded `rars1_6.jar`.
2. Run the following command to start RARS:

   ```bash
   java -jar rars1_6.jar
   ```

#### Method 2: Use a Bash Script

For more convenient access, you can create a simple Bash script to run RARS.

1. Create a new file named `rars.sh` in the same directory where `rars1_6.jar` is located.
2. Add the following content to `rars.sh`:

   ```bash
   #!/bin/bash
   java -jar rars1_6.jar
   ```

3. Save the file.

#### Make the Script Executable (Optional)

To make the script executable, open a terminal and run the following command:

```bash
chmod +x rars.sh
```

Now, you can run RARS with the following command:

```bash
./rars.sh
```

Alternatively, you can double-click the script to launch RARS.

### For Windows

#### Step 1: Download RARS

1. Download the `rars1_6.jar` file to a folder on your Windows computer, for example, `D:\RARS`.

#### Step 2: Run RARS from Command Prompt

1. Open the **Command Prompt** by typing `cmd` in the search field and selecting the Command Prompt app.
2. In the Command Prompt, navigate to the folder where you downloaded `rars1_6.jar`. For example, if it is located in `D:\RARS`, run:

   ```bash
   D:
   cd D:\RARS
   ```

3. Once you are in the correct folder, run the following command to start RARS:

   ```bash
   java -jar rars1_6.jar
   ```
