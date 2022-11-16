## Introduction to Shell Scripting
### .sh extension
the .sh extension is not compulsory when creating a shell script on the terminal. however, it is a good practice to include it for situations when we will be opening the file on another text editor. the .sh extension easily tells the editor the type of file it is and thus makes it display prettier.

### touch command
this command creates an empty file on the terminal. however, this files are not executable, this requires the chmod command to make it executable.

### starting a ahell script
To begin writing a shell script, the first line is required to start with the shebang line. this is the #! code, followed by the location of the bash interpreter. Most often, this line of code is written as follows:
* #! /bin/bash

### echo command
the echo command is used to print whatever is written in double quote in front of it. it acts like the printf in other language. e.g:  
##### #! /bin/bash
##### echo "hello world"

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
##### #!/bin/bash
##### #this is a comment line
##### echo "hello world!" #this is another comment

### Variables
variable is like a container which stores data inside, hence, whenever you define a variable there must be a data inside. this can be integers, string, character, floats etc. the shell (like most unix systems) has two types of variables
* system variable: this are predefined and are usually in capital letters. example include $BASH $BASH_VERSION $HOME $PWD etc
* user-defined variable: these are created and maintained by the user and it is usually written in lowercases. to define a variable, for example a variable called name, we can simply say: name=Khafre

#### Note: a variable name cannot start with a number, it must always start with a letter character.

### Reading user input
To get input from the terminal, we use the read command. this command takes and stores the character entered on the terminal. To take in multiple input from the user, we simply add multiple storage for the input in front of the read command. eg to take in three different names from the user we can say
##### #!/bin/bash

##### echo "enter names: "
##### read name1 name2 name3

###### #to print this inputs, we simply call the variables

##### echo "the names are $name1 $name2 $name3"

to enter the input on the same line as the echo text printed, we use the -p flag. for example
##### read -p 'text here:' var_name
##### echo "text here: $var_name"

to hide the input entered by the user in case such as a password entered, we use the -s flag. for example if we intend to also print it on the same line as the previous example, we can write it like so
##### read -sp 'text here:' var_name
##### echo "text here: $var_name"

to resolve the problem of two line overlapping (particularly when using the silent text feature i.e -s). we can simply type an echo without a string, this will help us add a new line to it which therefore separates the overlapping characters.

#### Array 
read the input of users as an array, we use the -a flag with the read command. an example of this is written as follows when assuming we want to take in names from user and save them in an array:
##### #!/bin/bash

##### echo "enter four names here"
##### read -a usr_names
##### echo "the third name entered is: ${usr_names[2]}"

## if-statement
This is a conditional statement that is used to check some things/parameters in the. the script will only go on to complete the other part of the if-statement, if and only if the condition of the if statement is checked to be true. 
to pass an if-statement in shell scripting, we use:
##### #!/bin/bash

##### if [condition]
##### then
#####     statement
##### fi #this is the end of the if-statement