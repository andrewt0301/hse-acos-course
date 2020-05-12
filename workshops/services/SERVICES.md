Services
---

For some theory, see [Managing Services with systemd](
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/chap-managing_services_with_systemd)
by RedHat.

## Mounting a disk with systemd

1. Create a new Virtual Disk in VirtualBox.

![1](Pic01.png)

![2](Pic02.png)

![3](Pic03.png)

![4](Pic04.png)

2. Boot the Virtual Machine.

3. See the created disk.
 
       andrewt@comp-core-i7-3615qm-0dbf32 ~ $ su -
       comp-core-i7-3615qm-0dbf32 ~ # fdisk -l

![5](Pic05.png)

4. Run GParted to create partitions.

       comp-core-i7-3615qm-0dbf32 ~ # gparted /dev/sdb

![6](Pic06.png)

![7](Pic07.png)

5. Run fdisk to see the created partition.

       comp-core-i7-3615qm-0dbf32 ~ # fdisk -l

   Output:

       Device     Start    End Sectors  Size Type
       /dev/sdb1   2048 260095  258048  126M Linux filesystem
 