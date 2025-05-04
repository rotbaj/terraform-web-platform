# Linux-Shell-Scripting (Control Flows)

### Control Flow in Shell Scripting

Control flow statements are the backbone of making decisions in programming. In scripting, these statements let your scripts decide what to do or how to proceed based on conditions, loops, or user inputs.

Bash and other shell interpreters provides control flow statements like

- **if-else**

- **for** loops

- **while loops** and

- **case** statements to control the flow of execution in your scripts.

Most likely you will get to use `if-else` and `for` loops more than the others. let's focus only on those two control flows.

### What is Control Flow?

In simple terms, control flow directs the order in which commands or instructions are executed in a script. It's like a roadmap that decides which path to take based on certain conditions or how many times to visit a place.

Let's examine an `if-else` statement in Bash to understand how it makes decisions based on user input.

Create a file `control_flow.sh`

**mkdir control_flow.sh**

put this code below and execute the script to see what happens.

``` bash
    read -p "Enter a number: " num 
```

![](./Images/1.%20control_flow-enter%20a%20number.png)

**The Script Breakdown:**

**#!/bin/bash:** This line is the shebang; it tells the system this script should be run with Bash interpreter..

**read -p "Enter a number:** ": This command asks you, the user, to enter a number. 
The **-p** option allows us to display a prompt message on the screen when you execute the script.

3. Execute the script.

Notice that when you execute the script, it just asks you to `Enter a number:`. Even when you type a number and hit enter, it takes the number, but you can't visibly see what it does with the number. That is because the `read` command in the script has its own way of taking inputs from the user, and storing the value into a variable passed to the `read` command.

The `read` command is used to capture user input and store it in a variable. When you use `read` followed by a variable name (in the case of our script, `num`), Bash waits for the user to enter something into the command line (`stdin`). Once the user presses enter, `read` assigns the input to the variable. Update the code to the below and execute;

``` bash 
#!/bin/bash
read -p "Enter a number: " numecho "You have entered the number $num"
```

![](./Images/2.%20shell_script18.png)

Notice how we used `echo` to return back to the screen (`stdout`) the value stored in the `$num` variable.

Since we now have something stored in the `$num` variable, we can use control flow to determine what the script executes next.

### if statement

The `if statement` in Bash scripts allows you to execute commands based on conditions. The basic syntax is:

``` bash 
if [ condition ]; then
    commands
fi
```

`if:` This keyword starts the conditional statement.

`[condition ]:` The condition to evaluate. Brackets [] are used to enclose the condition being tested.

`then:` If the condition is true, execute the commands that follow this keyword.

`fi:` Ends the if statement. It's basically if spelled backward, indicating the conclusion of the conditional block.

Now lets bring it into our code.

``` bash
if [ $num -gt 0 ]; then
    echo "The number is positive."
fi
```
The part above test, if the value is `$num` is greater tham 0, then most likely you have entered a positive number.
updating of code into the script.

``` bash
#!/bin/bash
read -p "Enter a number: " num
echo "You have entered the number $num"
if [ $num -gt 0 ]; then
    echo "The number is positive."
fi
```

![](./Images/3.%20if-command.png)

Notice the keyword -gt in the condition. These are called operators that are used within the condition block to perform numeric comparisons between values.

Tip: Always read your sheel script line by line to get a sense of what it is doing.



### elif statement

After understanding the `if statement,` we move on to the `elif` part of control flow in Bash scripts, `elif` stands for `"else if,"` allowing you to test additional conditions if the previous if conditions were not met. It helps you add more layers of decision-making to your script. The basic syntax for using `elif` is as follows:

``` bash
if [ condition1 ]; then
    commands1
elif [ condition2 ]; then
    commands2
fi
```

- `elif:` This keyword is used right after an `if` or another `elif` block. It allows you to specify an alternative condition to test if the previous conditions were false.

`[condition2]:` The new condition you want to evaluate. Like the `if statement,` this condition is enclosed in square brackets [].

`then:` If the `elif` condition is true, execute the commands that follow this keyword.

applying `elif` to the script to handle a scenario where the entered number might be negative:

![](./Images/4.%20lt-elif.png)


**In this updated version of the script:**

The `if [ $num-gt 0 ];` `then` part checks if `num` is greater than 0 and prints `"The number is positive."` if true.

If the first condition isn't met ``(ie., the number is not greater than 0), `the elif [ $num-It 0 ]; then`` checks if num is less than 0. If this condition is true, it prints `"The number is negative."`

This way, the script can differentiate between positive and negative numbers, providing specific feedback based on the value of num.

Notice the -It "less than" operator in the `elif` section.



## Loops

Moving forward in our journey through Bash scripting, we encounter `loops.` `Loops` are fundamental constructs that allow us to repeat a set of commands multiple times.

`Loops` empower us to automate and repeat tasks without writing the same code over and over again. Imagine having to perform a task, like sending a greeting message to each of your friends by name. Without `loops`, you'd have to write a separate command for each friend, which is not only tedious but also inefficient. `Loops` streamline this process by allowing you to write a single set of instructions that can be executed as many times as needed, making your script both cleaner and more powerful.

Some real world scenarios where `loops` are inevitable are;

`Batch Processing:` Suppose you have a folder full of photos you want to resize or edit in some way. Instead of editing each photo individually, a `loop` can automate this task, applying the same code to each photo in the folder.

`Data Analysis:` If you're analyzing data, you might need to perform the same calculations on numerous data sets. A `loop` can iterate through each data set, apply the same code to do calculations, and collect the results.

`Automated Testing:` in software development, `loops` are invaluable for running through numerous test cases. You can use a `loop` to automatically test different inputs for your program and verify that it behaves as expected using the same code.

In Bash scripting, there are three primary `types of loops` that are commonly used to repeat a set of commands multiple times based on certain conditions.

- For 
- While &
- Until

### For Loop

The `for loop` is used to iterate over a list of values or a range of numbers. It is particularly useful when you know in advance how many times you need to execute the `loop` body.

The `for loop` has two main forms:

1. List Form: Iterates over a list of items:

Here is a basic syntax:

``` bash
for item in item1 item2 item3; do
    echo $item
done
``` 

`for:` This keyword initiates the `loop,` signaling the start of a block of code that will repeat.

`item:` This is a variable that tempararily holds the value of each item in the list as the loop iterates. For each iteration of the loop, item takes on the value of the next item in the list, allowing the commands inside the loop to act on this value.

`in:` The in keyword is followed by a list of items that the loop will iterate over. This list can be a series of values, an array, or the output of a command. The loop executes once for each item in this list.

**;**: A semicolon is used here to separate the list of items from the do keyword that follows. If you place the do keyword on the next line, the semicolon is optional.

`do:` This keyword precedes the block of commands that will be executed for each item in the list. The block can contain one or multiple commands, and it can perform a wide range of actions, from simple echoes to complex conditional logic.

`done:` This keyword marks the end of the loop. It signifies that all commands in the loop have been executed for each item in the list, and the loop is complete

below ia an example:

``` bash
#!/bin/bash

for i in 1 2 3 4 5
do
    echo "Hello, World! This is message $i"
done
```

![](./Images/5.%20for-loop.png)


The loop starts with for `i in 1 2 3 4 5,` meaning the variable `i` will take each value in the list `(1, 2, 3, 4, 5)` in turn.

For each value of `i,` the loop executes the commands between do and done.

The command `echo "Hello, World!` This is message `$i"` prints a greeting along with the current value of `i.` Once `i` has taken each value in the list, the loop ends.

The same code can also be re-written using a range syntax:

``` bash
for i in {"1..5"}
do
    echo "Counting... $i"
done
```


![](./Images/6.%20fori.png)


2. **C-Style Form:** This style allows you to specify an initializer, condition, and increment/decrement expression. It is based on the same syntax used in doing a for loop in [C Programming](https://en.wikipedia.org/wiki/C_(programming_language)) Like this:

``` bash
for (( i=0; i<5; i++ )); do
    echo "Number $i"
done
```

![](./Images/7.%20C-style-form.png)

`the breakdown`

``` bash
- "for (( ... ));": This is the syntax that starts a C-style for loop in Bash. It's distinguished from the list form by the double parentheses "(( ... ))", which enclose the three parts of the loop: "initialization, condition, and increment/decrement".

- "i=0": This is the initialization part. Before the loop starts, "i" is set to "0". This typically sets up a counter variable to start from a certain value. In this case, i starts from 0.

- "i<5": This is the condition for the loop to continue running. After each iteration of the loop, Bash checks this condition. If it's true, the loop continues; if it's false, the loop ends. Here, the loop will continue as long as **i** is less than "5".

- "i++": This is the increment expression. It's executed at the end of each loop iteration. i++ is shorthand for incrementing i by 1 (i = i + 1). This step ensures that the loop will eventually end by changing the value of i so that the condition i<5 will not always be true.

- "do ... done": Encloses the commands to be executed in each iteration of the loop. Here, the command inside the loop is **echo "Number $i"**, which prints the current value of "i" to the console.
```

**How it works**
``` bash
- "for (( ... ));": This is the syntax that starts a C-style for loop in Bash. It's distinguished from the list form by the double parentheses "(( ... ))", which enclose the three parts of the loop: "initialization, condition, and increment/decrement".

- "i=0": This is the initialization part. Before the loop starts, "i" is set to "0". This typically sets up a counter variable to start from a certain value. In this case, i starts from 0.

- "i<5": This is the condition for the loop to continue running. After each iteration of the loop, Bash checks this condition. If it's true, the loop continues; if it's false, the loop ends. Here, the loop will continue as long as **i** is less than "5".

- "i++": This is the increment expression. It's executed at the end of each loop iteration. i++ is shorthand for incrementing i by 1 (i = i + 1). This step ensures that the loop will eventually end by changing the value of i so that the condition i<5 will not always be true.

- "do ... done": Encloses the commands to be executed in each iteration of the loop. Here, the command inside the loop is **echo "Number $i"**, which prints the current value of "i" to the console.
```

This `C-style` for loop is powerful for numerical iterations, especially when you need precise control over the start, end, and step size of the loop.



