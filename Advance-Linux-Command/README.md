# Advance Linux Command

## File Permissions and Access Rights
Understanding how to manage and files permission and ownership is crucial in Linux. This knowledge empowers you to control access to files and directories, ensuring the security and integrity of your system.
In Liunx, managing files permission and ownership is vital for controlling who can access, modify, or execute files and directories.

## Numeric Representation of Permission.
In Linux, permision are represented using numeric values. Each permission (*no permission, read, write and execute*) is assigned a numeric valued.

*No premission = 0*
read = 4
write = 2
execute = 1

These values are combined to represent the permission for each user class.

### Permission represented by 7

- 4 (read) 2 (write)  1 (execute)

- symbolic: rwx

- meaning, read, write and execute are all granted.

- Example Context: A script file that the owner needs to read, modify, and execute.

### Permission represented by 5

- 4 (read) + 1 (execute) = 5

- symbolic: r-x

- Meaning: Read and execute permissions are granted, but write permission is not.

- Example Context: A shared library or a command tool that users can execute and read but not modify.

### Permission represented by 6

- 4 (read) + 2 (write) = 6

- symbolic: rw-

- Meaning: Read and write permissions are granted, but execute permission is not.

- Example Context: A document or a configuration file that the owner needs to read and modify but not execute.


# Shorthand Representation of Permissions

In addition to the numeric way of showing permissions, Linux also has a shorthand, or symbolic, method for representing file permissions.

### Understanding User Classes from a Permissions Perspective

Before diving into shorthand permissions, it’s important to understand the concept of “user classes” in the context of Linux permissions. Think of user classes as categories of users that Linux recognizes when deciding who can do what with a file. There are three main classes:


- *Owner*: The person who created the file. Often referred to as 'user'.
- *Group*: A collection of users who share certain permissions for the file.
- *Others*: Anyone else who has access to the computer but doesn't fall into the first two categories.

#### The Role of Hyphens (-) in Permission Representation

When discussing permissions, you might notice hyphens (-) being mentioned. In the context of Linux file permissions, a hyphen doesn't actually represent a user class. Instead, it's used in the symbolic representation of permissions to show the absence of a permission.

Lets get a bit practical with examples. Get onto your Linux terminal and run ls -latr

![](/Image/1.%20ls-latr.png)

Let’s break it down to understand what each part means:

- In the output above, you will notice that some of the first character can be a - or d: `d` means it’s a directory, `-` means it’s a file.
- The next three characters (rwx) show the permissions for the owner. r stands for read, w for write, and x for execute.
- If a permission is not granted, you’ll see a - in its place (e.g., r-x means read and execute permissions are granted, but write permission is not).
- The hyphen separates owner, group, and others.
- The following three characters after the owner’s permissions represent the group’s permissions, using the same r, w, and x notation.
- The last three characters show the permissions for others.

#### The order the user class is represented is as follows:

- The first hyphen "-" is the user.
- The second hyphen "-" is the group.
- The third hyphen "-" is others.

# File Permission Commands

To manage file permissions and ownership, Linux provides several commands:

# chmod command

The chmod command allows you to modify file permissions. You can use both symbolic and numeric representations to assign permissions to the user, group, and others.

Let’s see an example.

- create an empty file using the `touch` command

``` bash
touch script.sh
```

![](/Image/2.%20touch-command.png)


- check the permission of the file

![](/Image/3.%20ls-latr-comand.png)


#### What do you think the permission of the above output represent?

Now let’s update the permission so that all the user classes will have execute permission:

chmod +x script.sh

![](/Image/4.%20x+chmod.png)

The above command uses the chmod command with the +x option to grant execute permission to the file script.sh. The +x option adds the execute permission to the existing permissions for all the user classes.

Now let’s check what the file permissions look like:

``` bash
ls -latr script.sh
```
![](/Image/5.%20ls-latrchomod.png)

The same command can be executed to achieve the same result using the numbers approach:

``` bash 
chmod 755 script.sh
```
![](/Image/6.%20chmod755.png)

To add execute permissions for all (user, group, others), you would add 1 to each of the three categories, resulting in 755:

``` bash
(4+2+1) = 7 for the user (read, write, and execute),

(4+1) = 5 for the group (read and execute),

(4+1) = 5 for others (read and execute).
```

Let’s consider another example. Imagine the owner of a file is currently the only one with full permissions to note.txt.

To allow group members and others to read, write, and execute the file, change it to the -rwxrwxrwx permission type, whose numeric value is 777:

``` bash 
chmod 777 note.txt
```
![](/Image/7.%20note777.png)

Now, notice the dash ("-") in the first position represents the file type and not a user class. It indicates that the entry is a regular file. chown command

The chown command allows you to change the ownership of files, directories, or symbolic links to a specified username or group.

Here’s the basic format:

``` bash
chown [option] owner[:group] file(s)
```

For example, let’s assume there is a user on the server called *"john"*, a group on the server called *"developers"*, and you want the owner of `filename.txt` changed from "dare" to "john", and to also ensure that any user in the developer group has ownership of the file as well:

``` bash
chown john:developer filename.txt
```
change file owner from `dare` to `john`

![](/Image/8.%20dare.png)

It is often necessary to become the superuser to perform important tasks in Linux, but as we know, we should not stay logged in as the superuser. In most Linux distributions, there is a command that can give you temporary access to the superuser’s privileges. This program is called sudo (short for super user) and can be used in those cases when you need to be the superuser for a small number of tasks. To use the superuser privileges, simply type sudo before the command you will be invoking.

``` bash
sudo -i
```

![](/Image/9.%20root-user.png)

You can type exit to leave the shell:

![](/Image/10%20exit.png)

#### User Management on Linux

As a DevOps engineer, you are also going to be doing systems administration which involves managing different users on the servers. You should know how to create a new user, or group, modify their permissions, update password and such similar tasks. Creating a User.


#### creating a new user

To create a new user on Ubuntu Server, you can use the adduser command. Assuming the name of the user to be created is joe. Open the terminal and run the following command:

``` bash
sudo adduser johndoe
```
Running this command will prompt you to enter and confirm a password for the new user. You will also be asked to provide some additional information about the user, such as their full name and contact information. Once you provide the necessary details, the user account will be created, and a home directory will be automatically generated for the user.

The home directory represents a file system directory created in the name of the user, such as /home/johndoe. This is where each user created on the server will store their respective data.

![](/Image/11.%20johndoe-user.png)

#### Granting Administrative Privileges

By default, newly created user accounts do not have administrative privileges. To grant administrative access to a user, you can add the user to the sudo group. Users in the sudo group can run commands with administrative privileges. To add the `johndoe` user to the sudo group, run:

``` bash
sudo usermod -aG sudo johndoe
```

``` bash
usermod: This is a command that modifies user account properties.

-aG: These are flags used with the usermod command.

-a stands for "append" and is used to add the user to the specified group(s) without removing them from other groups they may already belong to.

-G stands for "supplementary groups" and is followed by a comma-separated list of groups. It specifies the groups to which the user should be added or modified.
```
In the given command, `-aG sudo` is used to add the user `johndoe` to the `sudo` group.

The sudo group is typically associated with administrative or superuser privileges. By adding `johndoe` to the `sudo` group, the user gains the ability to execute commands with elevated privileges.

# Task for You

``` bash 
Log out and log back in as the newly created user.

Navigate to the /home/johndoe directory to explore what has been created. Tip: Use the cd command.
```

#### Switching User Accounts

To start using the system as another user, you will need to use the su command to switch.

To switch to another user account, use the su command followed by the username. For example, to switch to the johndoe account, run:

``` bash 
su - johndoe
```

You will be prompted to enter the password for the user. Once authenticated, you will switch to the user’s environment. Modifying User Accounts Changing User Password

- To log in as the newly created user `su` command.


![](/Image/12.%20switching-users.png)

### Modifying users account

*Changing users password*

To change the password for a user, use the `passwd` command followed by the username. For example, to change the password for `johndoe`, run:

``` bash
sudo passwd johndoe
```
You will be prompted to enter and confirm the new password for the user.

![](/Image/13.%20passwd4jnh.png)

# Task for You

``` bash 
Test the updated password by logging on to the server, using the newly updated password.
```

#### Creating a Group

To create a new group, use the groupadd command. For example, to create a group named developers, use:

``` bash
sudo groupadd developers
```

![](/Image/14.%20addgroup.png)


#### Adding Users to the Group

Use the `usermod` command to add users to the group. For instance, to add users "john" and "jane" to the "developers" group:

The -`aG` option append the `developer1` group to the user exiting group membership.

``` bash
sudo usermod -aG developer1 johndoe
``` 

![](/Image/15.%20-aG.png)


# Verifying Group Membership

To confirm the group memberships for a specific user, use the `id` command. For example, to check the group memberships for the user `johndoe`:

``` bash
id johndoe
```

This command displays information about the user "johndoe," including the groups they belong to, such as "developer1 and developers."

![](/Image/15.%20aG.png)

# Deleting a user

To delete a user, run the command below:

``` bash
sudo userdel username
```

![](/Image/17.%20delete.png)


#### Ensuring Proper Group Permissions

Groups in Linux are often used to manage permissions for files and directories. Ensure that the relevant files or directories have the appropriate group ownership and permissions. For example, to grant the “developers” group ownership of a directory:

``` bash
sudo chown :developers /path/to/directory
```

And to grant read and write permissions to the group:

``` bash 
sudo chmod g+rw /path/to/directory
```

# Side Hustle Task 3:

``` bash
Create a group on the server and name it devops.

Create 5 users ["mary", "mohammed", "ravi", "tunji", "sofia"], and ensure each user belongs to the devops group.

Create a folder for each user in the /home directory. For example, /home/mary.

Ensure that the group ownership of each created folder belongs to "devops".
```

![](/Image/18.%20create-add.png)
