## Introduction to Shell Scripting
### .sh extension
the .sh extension is not compulsory when creating a shell script on the terminal. however, it is a good practice to include it for situations when we will be opening the file on another text editor. the .sh extension easily tells the editor the type of file it is and thus makes it display prettier.

### touch command
this command creates an empty file on the terminal. however, this files are not executable, this requires the chmod command to make it executable.

### starting a shell script
To begin writing a shell script, the first line is required to start with the shebang line. this is the #! code, followed by the location of the bash interpreter. Most often, this line of code is written as follows:
> #! /bin/bash

### echo command
the echo command is used to print whatever is written in double quote in front of it. it acts like the printf in other language. e.g:  
> #! /bin/bash

> echo "hello world"

### chmod
this is used to change the file permission. it can add or remove permission from a file for a particular user or user-group. The chmod command execution uses the following numbers to modify file permission:
* 0 = 0 = nobody gets permission
* 1 = 1 = execute only
* 2 = 2 = write only
* 3 = 2+1 = can write and execute
* 4 = 4 = read only
* 5 = 4+1 = read and execute
* 6 = 4+2 = read and write
* 7 = 4+2+1 = read, write, and execute

## Using Variables and Comments
### comments
comments are line of codes that are not executed in the script but are important to understand some concepts of the script. to add a comment in a script, you simply have to start the line with a hash sign i.e #. here is an example
> #!/bin/bash

> #this is a comment line

> echo "hello world!" #this is another comment

### Variables
variable is like a container which stores data inside, hence, whenever you define a variable there must be a data inside. this can be integers, string, character, floats etc. the shell (like most unix systems) has two types of variables
* system variable: this are predefined and are usually in capital letters. example include $BASH $BASH_VERSION $HOME $PWD etc
* user-defined variable: these are created and maintained by the user and it is usually written in lowercases. to define a variable, for example a variable called name, we can simply say: name=Khafre

#### Note: a variable name cannot start with a number, it must always start with a letter character.

### Reading user input
To get input from the terminal, we use the read command. this command takes and stores the character entered on the terminal. To take in multiple input from the user, we simply add multiple storage for the input in front of the read command. eg to take in three different names from the user we can say
> #!/bin/bash


> echo "enter names: "

> read name1 name2 name3


> #to print this inputs, we simply call the variables

> echo "the names are $name1 $name2 $name3"

to enter the input on the same line as the echo text printed, we use the -p flag. for example
> read -p 'text here:' var_name 

> echo "text here: $var_name"

to hide the input entered by the user in case such as a password entered, we use the -s flag. for example if we intend to also print it on the same line as the previous example, we can write it like so
> read -sp 'text here:' var_name

> echo "text here: $var_name"

to resolve the problem of two line overlapping (particularly when using the silent text feature i.e -s). we can simply type an echo without a string, this will help us add a new line to it which therefore separates the overlapping characters.

#### Array 
read the input of users as an array, we use the -a flag with the read command. an example of this is written as follows  assuming we want to take in names from user and save them in an array:
> #!/bin/bash

> echo "enter four names here"

> read -a usr_names
> echo "the third name entered is: ${usr_names[2]}"

## if-statement
This is a conditional statement that is used to check some things/parameters in the. the script will only go on to complete the other part of the if-statement, if and only if the condition of the if statement is checked to be true. 
to pass an if-statement in shell scripting, we use:
> #!/bin/bash

> if [condition]

> then

>      statement

> fi #this is the end of the if-statement

## File Test Operator
this is a script we write to check the different file condition.

#### another method for keeping the cursor on the same line is by using \c. however to make the \c command readable in the script, we need to first add the -e flag after the echo. for example:
> echo -e "enter username: \c"

there are other flags to check different files such as
* -e is used to check all the files
* -f is use for check the file if it exits and if it is a regular file
* -d is used to check for directory i.e if the directory name entered exists
* -b is used for checking block special file i.e files that do not contain character e.g picture file, music, binary file etc.
* -c is used to check for character special file
* -s is used to check whether the character is empty or not
* -r is used to check for read permission
* -w for checking write permission
* -x for execution permission 

we can remove an already available permission from a file by using the hyphen sign with the corresponding flag of the permission we want to remove. for example, assuming we want to remove the read permission from a file name result, we use:
> chmod -r result

this removes the read permission for all users.

## Shell Operations 
### Basic Arithmetic Operations
one of the first thing to note is that arithmetic operations might be a hard task to achieve because of the fact that as you might have noticed already, the echo command simply takes anything written in front of it as a command for example, supposed we want to add two numbers 1 to another 1, the echo command should simply be
  > #! /bin/bash

  > echo 1+1 

however, this will not produce a product, instead it will print out the the data as a string as we have entered it. in this case to perfom an arithmetic operations, we need to take them as a variable and then the operation will be performed as a variable call. e.g
> #! /bin/bash

> num1=20

> num2=5

> echo $(( num1 + num2 ))

### Floating Point Arithmetic Operation
naturally, the shell does not support the float expression, however, to perform floating point operation, we need to add a special command called bc (meaning "basic calculation"). also, unlike the non decimal expression which needs to be in a parentheses, the float numbers just need to be wrapped in double quote. e.g
> #! /bin/bash

> num1=20.5

> num2=5

> echo "20.5+5" | bc

we can also use the variable name instead of manually typing out the number by simply replacing the numbers with the variable call. e.g
> echo "$num1+$num2" | bc

#### when we want to use the division in a float operation, we need to define the scale i.e how many decimal places we want the result to be. the expression will be as follows:
> echo "scale=num_of_decimal; expression" | bc

> e.g: echo "scale=2; 4.8/3" | bc

### basic math
we can use the bc command with a wide variety of functions, one of those function is perform some mathematical expression such as getting the sqaure root of a number or checking a number raised to a particular number. e.g
> num=42

> echo "scale=2; sqrt($num)" | bc -l

#sqrt has to be indicated to request for the square root function. however, this function is a function that is in the math library hence the use of the -l. -l is used to invoke the mathlib.

example 2: checking the result of a number raised to the power of another.
> echo "scale=2; 4^3" | bc -l