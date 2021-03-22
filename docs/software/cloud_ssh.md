Using Linux Ubuntu in Yandex Cloud
---

For this course, a VM with Linux Ubuntu is available at the public server (Yandex Cloud).

To access the server VM, please follow the steps below:

1. Run the `ssh-keygen` command in the console, to generate SSH keys.
   Specify the passphrase for the keys. The keys will be generated in the following folders.
   
      * MacOS: `/Users/andrew/.ssh` (private key - `id_rsa`; public key - `id_rsa.pub`)
      * Windows: `/c/Users/andrew/.ssh` (private key - `id_rsa`; public key - `id_rsa.pub`)

1. Send the public SSH key (`id_rsa.pub`) to your TA by email (he will resend it to admins).

1. The TA will send you back the login information.

1. Once you get your login from your TA, connect to the server using the following command:
   ```bash
   ssh login@ipaddress -p22
   ```
   where `login` is your login and `ipaddress` is `84.201.145.249`.

   Input the passphrase for the key to authorize.
