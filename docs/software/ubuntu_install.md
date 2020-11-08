Install Linux Ubuntu and Related Tools
---

# Contents

* [Ubuntu in VirtualBox](#ubuntu-in-virtualbox)
* [SSH and port forwarding](#ssh-and-port-forwarding)
* [Git](#git)

# Ubuntu in VirtualBox

1. Run VirtualBox in your laptop.

1. Click "New" in the VirtualBox toolbar.

   ![VirtualBox New](images/virtualbox_ubuntu_01.png)

1. In the dialog, specify machine name as "ACOS Ubuntu 20.04 LTS" and click "Continue".

   ![VirtualBox New Ubuntu](images/virtualbox_ubuntu_02.png)

1. Allocate for the new virtual machine 2048 MB of RAM. Click "Continue".

   ![VirtualBox Ubuntu Size](images/virtualbox_ubuntu_03.png)

1. Select "Create a virtual hard disk now" and click "Create".

1. Specify hard disk file type as "VDI (VirtualBox Disk Image)" and click "Continue".

1. Specify storage on physical hard disk as "Dynamically allocated" and click "Continue".

1. Specify file location and size for the virtual disk and press "Continue". Location is default. Recommended size is 16 GB.

   ![VirtualBox Virtual Disk](images/virtualbox_ubuntu_04.png)

1. Now the virtual machine is created. The next step is to install Linux Ubuntu in it.

1. Select the "ACOS Ubuntu 20.04 LTS" virtual machine and click "Start" in the toolbar.

   ![VirtualBox VM Start](images/virtualbox_ubuntu_05.png)

1. In the dialog that appears, select the downloaded `.iso` image with Linux Ubuntu distribution
   (e.g. `ubuntu-20.04.1-desktop-amd64.iso`) to start the virtual machine from. Click "Start".

   ![VirtualBox Select ISA](images/virtualbox_ubuntu_06.png)

1. VirtualBox will run the virtual machine, which will start loading the Linux Ubuntu distribution from the `.iso` file.

1. When the Ubuntu installer is loaded, click "Install Ubuntu".

   ![VirtualBox Install Ubuntu](images/virtualbox_ubuntu_07.png)

1. Select "English (US)" for the keyboard layout and click "Continue".

1. Select "Minimal installation" and click "Continue". We do not need a full installation.
   Many tools are useless for us. Later we will install tools that we need.

   ![VirtualBox Install Minimal](images/virtualbox_ubuntu_08.png)

1. Select installation type as "Erase disk and install Ubuntu" and click "Install Now".

   ![VirtualBox Erase Disk](images/virtualbox_ubuntu_09.png)

1. In the appearing "Write the changes to disk?" dialog, click "Continue".

1. In the "Where are you?" dialog, specify "Moscow" and click "Continue".

1. Specify your name as "ACOS" (username will be "acos"), computer name as "acos-vm",
   and password as "acos2020" (or as you wish). Click "Continue".

   ![VirtualBox Ubuntu Password](images/virtualbox_ubuntu_10.png)

1. Wait for Ubuntu to be installed. This will take about 1 hour.

   ![VirtualBox Ubuntu Installing](images/virtualbox_ubuntu_11.png)

1. When installation is finished, restart the virtual machine.

   ![VirtualBox Ubuntu Restart](images/virtualbox_ubuntu_12.png)

1. Virtual machine "ACOS Ubuntu 20.04 LTS" will start.

   ![VirtualBox Ubuntu Started](images/virtualbox_ubuntu_13.png)

1. Network must work in the virtual machine.

   ![VirtualBox Ubuntu Browser](images/virtualbox_ubuntu_14.png)


# SSH and port forwarding

After Linux Ubuntu is installed in VirtualBox, we need to make sure that the network interface is enabled
and set up port forwarding. We need to det up forwarding for port 22 in order to be able to connect
to the Ubuntu Linux VM from our host operating system using [SSH](https://en.wikipedia.org/wiki/SSH_%28Secure_Shell%29).

Configuring the virtual machine in VirtualBox:

1. Select the "ACOS Ubuntu 20.04 LTS" virtual machine and click "Settings" in the toolbar.
1. In the dialog, switch to the "Network" page and click "Port Forwarding".

   ![VirtualBox Ubuntu Port Forwarding 1](images/virtualbox_ubuntu_ports1.png)

1. Set up a rule for port forwarding. `127.0.0.1` is the local host IP address, 2022 is the port used for forwarding,
   `10.0.2.15` is the IP address for the guest OS (Linux Ubuntu), 22 is the SSH port in Linux Ubuntu.  

   ![VirtualBox Ubuntu Port Forwarding](images/virtualbox_ubuntu_ports2.png)

1. Click "OK" to apply the settings.

1. Start the Ubuntu VM.

# Git

[Git](https://en.wikipedia.org/wiki/Git) is a version-control system that we well
use to get and put source code to GitHub.

To install it, open Terminal and execute the following command:

    acos@acos-vm:~$ sudo apt install git
