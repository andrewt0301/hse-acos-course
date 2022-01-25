Adding New Users to Cloud VM
---

How to add a new user to the Cloud VM:

1. Copy the [newuser.ssh](
   https://github.com/andrewt0301/hse-acos-course/blob/master/docs/software/newuser.ssh)
   script to the Cloud VM.
2. Run the script with `sudo`.
3. Enter the username (e.g. `tatarnikov_204`). Create a username based on the user surname, name, and group. 
4. Enter the user SSH public key (the text from the `id_rsa.pub` file the user has attached to the table).
5. Enter user information. Password is default: `123456`.
6. All other user information can be skipped. Just press ENTER.
7. The user will be created, appropriate rights will be assigned to his folders, and the SSH key will be registered.
8. Do not forget to add information to the table (the login and the status "Done").

How to update user key:

1. Open the `/home/$USERNAME/.ssh/authorized_keys` file in nano (other your favorite editor).
2. Replace its content with text from the `id_rsa.pub` file provided by the user.  

Example:

```bash
tatarnikov@akos:~/scripts$ sudo sh newuser.sh 
Enter user name:
test2
User name: test2
Group name: test2
Enter public key for SSH:
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQW+PMC0oXITb8dO5Z11g1yeNOT+1yCgHgjf3Qfdh9MKJxwXcpwbLE2FzOn5GKATP/LaPJw7Yti3LaIRDvRqiRFetn6NNsTguT8fIqTdVG7TjXBPYpEARYrhNBtjA1TvwqKcuKUbb8r+yrUFt/+gHDU8Ucz4Ae2YnwWw2HMK95JO0Z1tX0m60fAHaU56FPA88BnZUYqBntmJwe/mF1TMBqOkNxT21lfrpYnapzP74dfwsxm+sjDwD6i81oQ0SaAQVerYiDtCscAkDGXzLEd3Acb9Ga/pRIrC67ZaKnGJ6wbTW4495cHe3JjB4QuFxdpwh7M4MoT/AhDXr3ogL6zNEBTUCeL7PD4uHNO6tt2HRSREWXevOawS6MRZzWGFYUQQz76Fp5y74OEMI6aD/SAwp0SlXjBfZslmH/XSmM+FyrFdB21UZ7HchaZPTjp+DaXihbaDf64/LG6mewWD2/OwOMdRoZ8YN5XIocaPM6jBeIgpfhoLMAFVOd9q5GAD+KAe8= andrew@Andreis-MacBook-Pro.local
Public key: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQW+PMC0oXITb8dO5Z11g1yeNOT+1yCgHgjf3Qfdh9MKJxwXcpwbLE2FzOn5GKATP/LaPJw7Yti3LaIRDvRqiRFetn6NNsTguT8fIqTdVG7TjXBPYpEARYrhNBtjA1TvwqKcuKUbb8r+yrUFt/+gHDU8Ucz4Ae2YnwWw2HMK95JO0Z1tX0m60fAHaU56FPA88BnZUYqBntmJwe/mF1TMBqOkNxT21lfrpYnapzP74dfwsxm+sjDwD6i81oQ0SaAQVerYiDtCscAkDGXzLEd3Acb9Ga/pRIrC67ZaKnGJ6wbTW4495cHe3JjB4QuFxdpwh7M4MoT/AhDXr3ogL6zNEBTUCeL7PD4uHNO6tt2HRSREWXevOawS6MRZzWGFYUQQz76Fp5y74OEMI6aD/SAwp0SlXjBfZslmH/XSmM+FyrFdB21UZ7HchaZPTjp+DaXihbaDf64/LG6mewWD2/OwOMdRoZ8YN5XIocaPM6jBeIgpfhoLMAFVOd9q5GAD+KAe8= andrew@Andreis-MacBook-Pro.local
Adding user `test2' ...
Adding new group `test2' (1100) ...
Adding new user `test2' (1098) with group `test2' ...
Creating home directory `/home/test2' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for test2
Enter the new value, or press ENTER for the default
	Full Name []: 
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
```
