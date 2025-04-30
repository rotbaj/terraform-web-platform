## What is a Linux Command?
A Linux command refers to a program or utility that runs in the Command-Face-Interface (CLI). The CLI is a text-base environment where you interact with the system by typing commands.

## Manipulation files and directories on Linux.

Most of thr time on linux we will be working with files and directories.We will focus on different command that covers different use cases of manipulating files and directories on linux.

The `sudo` command

In Linux some actions need special permission to be carried out, like creating files in certain areas or changing important system settings. This is where the sudo command comes into play.
`*sudo`* stands for "Superuser do" and it allows you to run commands with the security privileges of another user, typically the superuser or "root"

 *Why use sudo?*
 - Security: It help to keep the system secure by limiting access to powerful command.

 - *Tracking*: It logs who executed which command, adding a layer of accountability.

 *How sudo works*
 when you proceed a command with sudo, Linux ask for your password. Once you enter it correctly, you can run command as if you were the system's superuser for a short period. This means you wont need to enter your password for each sudo command within this time frame.

 ## Creating a folder with `sudo`
 Open your terminal, and connect to your linux server using SSH.

 ![](./Image/1.%20ssh%20connect%20to%20mobaxterm.png)

 - Creating a folder name "**example**" in /`root` without sudo

 ![](./Image/2.%20permision%20denied.png)

 - creating a folder name `**example**` in /`root` with sudo command

 ![](./Image/3.%20example-floder.png)

 ## Pwd Command

 - Use the pwd command to find the path of your current working directory.

 ![](./Image/4.%20pwd.png)


 ## The Linux Directory Structure

 After learning the use of sudo, its crucial to understand how the linux filesystem is organize. This knowledge is fundamental while navigating through system, managing files, and understanding where different types of files and directories resides.

 #### The Root Directory ("/")
At the top of the filesystem hierachy is the root directory, donated by a single slash ``(/)``. Unlike windows, which uses different drive (`C`,`D`, etc).

**/bin**: Essential user command binaries (programs) that needs to be available to all users are stored here (e.g ls, cp).

**/etc**: Configuration file for the system can be found in here.

**/home**: Personal directory for users.

**/root**: The home directory for the root user.
**/var**: Variable data like logs.

**/usr**: Secondary hierachy for user data; contains majorities of user utility and application.

You should use the `ls` command to explore them and get some experience navigating Linux.
  
**cd command**: To navigate through the Linux files and directories, use the `cd` command.

![](./Image/5.%20ls-l.png)

- cd into the /usr directory

![](./Image/6.%20usr.png)

### **Side Hustle Task 1**:

- Create a directory call `photos` inside the `/usr` directory.

- Navigate into the `photo` directory.

- create 3 more random directories insde the photos directory and display them

![](./Image/7.%20pic123.png)
 
 - Show the newly created directories inside the terminal.

 ![](./Image/8.%20ls-pic123.png)

 - Navigate into pic1, and showing the full path.

 ![](./Image/9.%20navigate-in2-pic1.png)

 ### **ls command**

 The `ls` command lists files and directories.

 ![](./Image/11.%20ls%20command.PNG)

 ### **cat command**
 - `Concatenate` or `cat` is one of the most frequently used Linux commands. It lists, combines, and writes file content to the standard output.

![](./Image/11.%20cat%20command.png)

### **cp command**
- The `cp` command is used to copy files or directory and their content.

`copy a file to a folder`

![](./Image/12.%20filename.png)

- copy multiple files into a directory.

![](./Image/14.%20copies%20multiple%20files.PNG)

- Copy content from a file to another file.

![](./Image/14.%20cp-file1-file2.png)

- Copy the entire directory using the -R flag to another directory.

![](./Image/15.%20cp-R.png)

### **mv command**

The primary use of the `mv` command is to move and rename files and directories.

- move a file to a directory

![](./Image/17.%20mv%20file%20to%20directory.PNG)

- rename a file using mv command

![](./Image/16.%20old&newfile.png)

### rm command:

The rm command is used to delete file within a directory.

- remove a single file

![](./Image/17.%20rm-filename.png)

- remove multiple files

![](./Image/18.%20rm-multiplefiles.png)

### Touch command

The touch command allows you to create an empty file.

- using the touch command to create an HTML file called web in the directory.

![](./Image/19.%20web.png)

### Find command

The file command is used to search for files within a specific directory and perform subsequent operations.

- The general sequence for for find is: `find [option] [path] [expression]`


![](./Image/22.%20find.PNG)
