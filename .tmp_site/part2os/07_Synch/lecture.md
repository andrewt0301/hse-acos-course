Lecture 7
---

# I/O and Files

## Lecture

Slides ([PDF](OS_Lecture_07.pdf), [PPTX](OS_Lecture_07.pptx)).

#### Outline

* Files and folders in Linux
* Directory hierarchy in Linux
* Virtual file system and basics of Ext4
* System calls for working with files and folders
* Standard I/0, file descriptors and redirection
* Function of C standard library (libc) for working with I/0

#### Examples

Getting information on file system usage:

```bash
df
Filesystem     1K-blocks     Used Available Use% Mounted on
tmpfs            1615192     2420   1612772   1% /run
/dev/nvme0n1p2 982862268 98898256 833963680  11% /
tmpfs            8075948   213908   7862040   3% /dev/shm
tmpfs               5120       12      5108   1% /run/lock
efivarfs             246      117       125  49% /sys/firmware/efi/efivars
/dev/nvme0n1p1    523248     6352    516896   2% /boot/efi
tmpfs            1615188      344   1614844   1% /run/user/1001
```

Getting information on the disk:
```bash
hwinfo --disk
27: PCI 00.0: 10600 Disk                                        
  [Created at block.255]
  Unique ID: wLCS.EJHvc9MwvZ7
  Parent ID: yoMo.AxGd7hiuG+6
  SysFS ID: /class/block/nvme0n1
  SysFS BusID: nvme0
  SysFS Device Link: /devices/pci0000:00/0000:00:1d.4/0000:3d:00.0/nvme/nvme0
  Hardware Class: disk
  Model: "Samsung Electronics NVMe SSD Controller SM981/PM981/PM983"
  Vendor: pci 0x144d "Samsung Electronics Co Ltd"
  Device: pci 0xa808 "NVMe SSD Controller SM981/PM981/PM983"
  SubVendor: pci 0x144d "Samsung Electronics Co Ltd"
  SubDevice: pci 0xa801 
  Driver: "nvme"
  Driver Modules: "nvme"
  Device File: /dev/nvme0n1
  Device Files: /dev/nvme0n1, /dev/disk/by-id/nvme-SAMSUNG_MZVLB1T0HBLR-000L7_S4EMNF0MB29472, /dev/disk/by-id/nvme-SAMSUNG_MZVLB1T0HBLR-000L7_S4EMNF0MB29472_1, /dev/disk/by-path/pci-0000:3d:00.0-nvme-1, /dev/disk/by-diskseq/9, /dev/disk/by-id/nvme-eui.0025388b91c8cf4e
  Device Number: block 259:0
  BIOS id: 0x80
  Drive status: no medium
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #17 (Non-Volatile memory controller)
```

Getting information on a file and its file system:

```bash
stat hello
  File: hello
  Size: 16048     	Blocks: 32         IO Block: 4096   regular file
Device: 259,2	Inode: 35260199    Links: 1
Access: (0775/-rwxrwxr-x)  Uid: ( 1001/ andrewt)   Gid: ( 1001/ andrewt)
Access: 2025-04-14 19:29:20.651015096 +0300
Modify: 2025-04-14 19:29:16.426873736 +0300
Change: 2025-04-14 19:29:16.426873736 +0300
 Birth: 2025-04-14 19:29:16.384872282 +0300
```
```bash
stat hello --file-system
  File: "hello"
    ID: 2c46404543853cc9 Namelen: 255     Type: ext2/ext3
Block size: 4096       Fundamental block size: 4096
Blocks: Total: 245715567  Free: 221037874  Available: 208537791
Inodes: Total: 62480384   Free: 61695470
```

Copying `stdin` to `stdout`, one byte at a time:
```c
#include <unistd.h>

int main(void) {
    char c;
    while(read(STDIN_FILENO, &c, 1) != 0)
    write(STDOUT_FILENO, &c, 1);
    return 0;
}
```

Accessing file metadata:
```c
#include <sys/stat.h>
#include <stdio.h>

int main (int argc, char **argv) {
    struct stat st;
    char *type, *readok;
    stat(argv[1], &st);
    if (S_ISREG(st.st_mode)) /* Determine file type */
        type = "regular";
    else if (S_ISDIR(st.st_mode))
        type = "directory";
    else
        type = "other";
    if ((st.st_mode & S_IRUSR)) /* Check read access */
        readok = "yes";
    else
        readok = "no";
    printf("type: %s, read: %s\n", type, readok);
    return 0;
}
```

Reading a directory to get the list of files (`ls`-like program):
```c
#include <sys/types.h>
#include <dirent.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    DIR *directory;
    struct dirent *de;
    const char *dir_name = argv[1];
    if (!(directory = opendir(dir_name))) {
        perror("Failed to open directory");
        return 1;
    }
    while ((de = readdir(directory))) {
        printf("Found file: %s\n", de->d_name);
    }
    closedir(directory);
    return 0;
}
```

Buffering provided by the standard C library:
```
#include <stdio.h>

int main() {
    printf("h");
    printf("e");
    printf("l");
    printf("l");
    printf("o");
    printf("\n");
    fflush(stdout);
    return 0;
}
```

`strace` utility shows that many `printf` calls result in a single system call `write`:
```
strace -e trace=write  ./hello 
write(1, "hello\n", 6hello
)                  = 6
+++ exited with 0 +++
```

## Workshop

[Workshop: Shell Scripts](../06_Processes/bash.md) 

## Homework

__TODO__

# References

* [df](https://man7.org/linux/man-pages/man1/df.1.html) - utility to report file system space usage
* [stat](https://man7.org/linux/man-pages/man1/stat.1.html) - utility to display file or file system status
* File Systems. Chapter 14 in [[TLPI]](../../books.md).
* System-Level I/O. Chapter 10 in [[CSPP]](../../books.md)
* [Filesystem Hierarchy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard) (Wikipedia)
* [Overview of the Linux Virtual File System](https://docs.kernel.org/filesystems/vfs.html)
* [Inode](https://en.wikipedia.org/wiki/Inode) (Wikipedia)
* [ext4 Data Structures and Algorithms](https://www.kernel.org/doc/html/latest/filesystems/ext4/index.html)
* Oracle Linux Blog. Understanding Ext4 Disk Layout.
  [Part 1](https://blogs.oracle.com/linux/post/understanding-ext4-disk-layout-part-1) and
  [Part 2](https://blogs.oracle.com/linux/post/understanding-ext4-disk-layout-part-2)
