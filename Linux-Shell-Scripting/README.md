# Shell scripting
### What is shell scripting?

Shell script is the process of writing and executing a series of instruction in a shell to automate tasks. A shell script is ensentially a script or program written in a shell language such as, **Bash, sh, zsh, or Powershell**.

A basic shell script that will create multiple folders and create multiple linux users at once will look at like this.


Make a folder.
`mkdir shell-scripting`

![](./Images/1.%20shell-scripting.png)


- create a file called `my_first_shell_script.sh`
and `vm` into the file

`vim my_first_shell_script.sh`

![](./Images/2.%20vim-creation.png)


- Enter the shell script code in the text editor file `vm`

![](./Images/4.%20mk_create_files_dir.png)


- change directory

`cd into the shell-script directory and list file`

![](./Images/3.%20shell-scripting-latr.png)

Something you should notice about the permissions of the newly created file is this
-rw-r--r-- which means:

![](./Images/5.%20ls%20-latr.png)

1. The owner of the file has read (**r**) and write (**w**) permissions.
2. Members of the file's group have read(**r**) permission.
3. Others also have read (**r**) permissions.

However, no one has the executive permission, hence the script cannot be executed.

To execute the script, you will typically do something like this,

``` bash
./my_first_shell_script.sh
```
![](./Images/6.%20permission-denial.png)

./ the prefix to the file indicate that the command should look for the file in the current directory.

- The dot **(.)** represents the current directory, and the slash **(/)** is a directory seperator.

when you hit enter, you should get a respond like this
``` bash
bash: ./my_first_shell_script.sh: Permission denied
```
![](./Images/6.%20permission-denial.png)

Noticed that we now have **permission denied** error which can easily be resolved by giving the file the necessary permissions it required.

but did you also notice the mension of **Bash** at the beginning of the error message? it indicate that the error message is coming from the **Bash Shell** itself.
**Bash is the command interpreter or shell that yoi are using in the terminal to execute commands.

Add executive permission to the owner

![](./Images/7.%20user-permission.png)


- run executable file and display folder on the linux server

![](./Images/8.%20folders.png)


- Ensure that the users are created on the linux server. display the users using **id** command

![](./Images/9.%20iduser.png)

## What is shebang (#! /bin/bash)
Noticed that at the beginning of the shell script, we have **#! /bin/bash** written there.
This is what is called a **shebang**. it is a special notation used in Unix-like operating system like Linux, to specify the interpretation that should be used to execute the script. In this case **#! /bin/bash** specifically indicate that th **Bash** shell should be used to interpret and execute the script.

You can explore the **/bin** folder and see the different programs in there. **bash** is one of them which is used as the interpreter in that script. If we wanted to use another shell like **sh**, the **shebang** would be updated to **#!/bin/sh**

**/bin/bash:** This is the absolute path to the Bash shell executable. It tells the system to use the **Bash** interpreter located at `/bin/`bash to run the script.

Without a shebang line, the system may not know how to interpret and execute the script, and you may need to explicitly specify the interpreter when running the script.


## Variable Declaration and Initialization:

In programming generally, not just shell scripting, `variables` are essential for creating dynamic and flexible programs.

Variables can store data of various types such as numbers, strings, and arrays. You can assign values to variables using the `=` operator, and access their values using the variable name preceded by a `$` sign.

Lets explore a few examples:

``` bash
Example: Assigning value to a variable:

name="John"
```

![](./Images/10.%20variable.png)


From the example above, `"John"` was asigned to the variable `"name"`

Now that the variable is assigned, you may ask, how then can i use it?

## Retrieving value from a variable

After assigning a value to a variable, as shown in the previous example where we assigned "John" to the variable name, you can utilize this variable in various ways in your script or program. One of the most straightforward methods to use or retrieve the value stored in a variable is by echoing it back to the console. 

This is done using the `echo` command in shell scripting.

``` bash 
echo $name
```
This command instruct the shell to the value of name to your screen which in our case output `John`

![](./Images/10.%20variable.png)

echo is a command used to print a text, variables or values. In this example, echo is used to print a variable which stores a value..