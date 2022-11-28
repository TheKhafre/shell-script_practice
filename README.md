# My shell scripting note... with love from Khafre 😎🥳

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

## Array 
read the input of users as an array, we use the -a flag with the read command. an example of this is written as follows  assuming we want to take in names from user and save them in an array:
> #!/bin/bash

> echo "enter four names here"

> read -a usr_names

> echo "the third name entered is: ${usr_names[2]}"

##### to visualize what the user type we use the syntax: 
> echo "${array_name[@]}"

for example using the earlier example of entered names, we can get the names entered by typing:
> echo "${usr_names[@]}"

In addition, to view the length of the array, we use the syntax:
> echo "${#array_name[@]}"

### run-time array
we can define and design our array from the beginning of the script i.e we are not asking for any input from the user to create the array (unlike the first example). in this case, to define a run time array, we can simply use the syntax:
> array_name=('name1' 'name2' 'name3' etc)

to call the array, we can now use the command:
> echo "${array_name[index]}"

this will print the array data at the index specified. to know the indexes of the array, we can run:
> echo "${!array_name[@]}"

however, since we are adding the array content ourselves, we can update the array content i.e add new data by typing the array name[index we want to add] and then pass the value like this:
> array_name[index]='new_data'

if the index we indicated falls on an existing data, the data in the index will be overwritten by the new data. for example if we already have a data in index 2, if we add another data to the index 2 the previous one will be replaced with the new one.

##### to delete an element of array, simply type: 
> unset array_name[index to delete]

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
* -f is use for check the file if it exists and if it is a regular file
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

## Case Statement
this is an advance if-then-else statement it allows us to check multi level of condition. the general syntax is:
> case expression in
  
 >   pattern1 )
 
 >       statement ;;
 
 >   pattern2 )
 
 >       statement ;;

>  esac

technically, with the case statement, we just want to evaluate a series of response to a particular variable. for example, let's say we run a vehicle rental company and we have different kind of vehicle people can rent and all having different price. however, we don't know for sure which vehicle a user will rent when they come, so, that's when we use the case expression. 

in this case, vehicle is our base variable but we want users to tell us what kind of vehicle they want so we can tell them the price. the script will thus look like this:
> #! /bin/bash

> vehicle=$1

> case $vehicle in 
   
>         "car" )
       
>             echo "the price is 100 dollars" ;;

>          "van" )

>             echo "the price is 80 dollar" ;;

>           * )

>             echo "unknown vehicle" ;;

> esac

##### the asterisk (*) stands for cache value i.e if the user enters anything else that is not part of the patterns we have listed, for example using the above example the pattern we provided are only car and van, assuming the user enters another type like canoe, then this will be the cache value and the statement we have provided will be returned for such input.

##### the question mark (?) is also use to evaluate inputs of any special character in the case statement. however, it is usually used to check for just one character. to check for more than one special character, we can then use the asterisk (*)

## Loops
### while loop
we use the loop expression to repeat a set of tasks. in shell scripting, we complete the command of a while loop as follows:
> variable declaration

> while [ condition ]

> do

>         command

>         increment/decrement

> done

##### here is a simple way to increase or decrement in a loop:
> var=$(( var+1 )) or

> var=$(( var-1 ))

## Cool Loops command
there are some cool stuffs we can use the while loop command to perform by simply passing an extra command to it. this includes: sleep and Open terminal

### sleep loop
the sleep command when added to a while loop command is responsible to how fast or slow the loop operates. for example, assume we want to print ten numbers (1 till 10), we can make each number print every 1 seconds. here is how the script will look:
> #! /bin/bash

> n=1

> while [ $n -le 10 ]

> do

>       echo "$n"

>       (( n++ ))

>       sleep 1

> done

this kind of loop format can be used to perform many other cool process where we want the process to execute gradually without rush.

### open terminal
this command can be used to open multiple terminal on the system at the same time simply by executing the command. interestingly, the format almost similar to the sleep command.

To perform this process, we simply put the number of terminal we want to open in the while condition and after the loop increment/decrement command, we pass the name of the terminal we want to open followed by the & symbol. here is an example with the gnome terminal. let's open 2 terminals:

> #! /bin/bash

> n=1

> while [ $n -le 2 ]

> do

>         echo "$n"

>         (( n++ ))

>         gnome-terminal &

> done

### reading a file content in bash
loops are pretty handy in scripting, apart from the examples we have earlier see, another thing we can use loop for is to read file content. we can read the content of a file simply by writing a shell script and passing the name of the file into it. For example, assuming we have a list of commands we always forget, we can write all of these commands into a file and pass the name into the script to read it.

to read a file content, the script will follow this syntax of a while loop:
> #! /bin/bash


> while read p

> do

> echo $p

> done < hello.sh

##### we can also read a file from another directory/folder by just passing the path to the file. e.g /shell/shell_script-practice/hello.sh

### using FOR loop to execute commands
all of the loops have a cool feature they can all complete, one of those feature for a FOR loop is that we can use it to write a script that execute commands for us. 

For example, assuming we want to use loop to print the files, pwd, and dates in our directory, then we can write a script which executes all of this commands together to give us a result. here is how the script will look:
> #! /bin/bash

> for command in ls pwd date

> do

>       echo ".........$command........."

>       $command

> done

##### when we run this script, it divides the result into 3 (each for the commands i.e ls, pwd, and date) then print the result of the command under each of it.

### Select Loop
still under loop, one of the coolest loop types is the Select loop. This loop is used in situations where you want to create a list where users need to select from. for example if you want users to select from a list of commands or menu items. 

The syntax of a select loop follows almost the same format as the for loop. for example let's say you want users to select a name from 4 other names, the script will run thus:
> select name in Tobi, Aisha, Daniel, Femi

> do

>       echo "you selected $name"

> done

the problem however with the select loop is that it runs like an infinite loop, i.e even after selecting a response, it keeps asking for more reaponse and keep giving result for each reaponse selected. however, to go out of the loop, we just need to press ctrl+d. 

### Break and Continue statement
we use the break and continue statement to control the way the condition of a loop is executed. here is what you need to know:
* Break statement is used when we want the to stop immediately it hits an error in the condition no matter the amount of loop specified. e.g 

> for (( i=1 ; i<=10 ; i++ ))

> do

>       if [ $i -gt 5 ]

>       then

>           break

>       fi

>       echo "$1"

> done

in this example, although the conditon of the FOR loop had been set to make the loop go on 10 iteration, the break condition stopped it immediately the condition of the nested if condition was met.

* Continue statement tells the loop to not stop when see an error, instead it should just skip the error. for example:

> for (( i=1 ; i<=10 ; i++ ))

> do

>       if [ $i -eq 3 -o $i -eq 6 ]

>       then

>           continue

>       fi

>       echo "$1"

> done

this script will continue till 10 but will skip 3 and 6 because those were the condition that could have stopped it.

## Function
the syntax of calling a function is 
> function_name(){

>       statement block

> }

> function_name

in the case of script function more than one functions can be declared in any order we so want, but the output will be determined by the order with which the function name is invoked.

## Signals and Traps
we can use the line of code
>       echo "pid is $$"

to print the pid of our terminal process
to read more on the signal command, use the command "man 7 signal"

trap command is use to catch and overwrite and ignore a signal command. normally,  SIGINT (2) which is also a ctrl+c command is used stop or interrupt a process. but if we add trap and include the SIGINT in front of it, what we have said is that the terminal should ignore the interruption from the Ctrl+c when the script is running.

we can add it by adding 
>      trap "echo message" SIGINT or other signal

e.g
>       trap "echo exit signal detected" SIGINT

## Debugging in bash scripting

whenever a script process is being interpreted the error is usually sent to the terminal. But, oftentimes the error is not explicitly explained or pointed to. to have a deep look into an error in a shell script, we the command:
>       bash -x file_name

this shows how the script was executed and where the error occured accordingly. try it! it's fun.

another way the debugging can be done is by including the -x option inside the shebang line inside the script file itself. like this:
>      #!/bin/bash -x