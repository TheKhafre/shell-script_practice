#! /bin/bash
#a script that reads the content of a file using while loop.

while read p #p in this case is the argument that takes in the file name.
do
echo $p
done < Read_file.sh #the lt symbol is a redirection command which changes the direction of the file.
# in this example we want to read the content of this same file i.e we want the file to read itself. hence, the file name is redirected into the loop and the name is appended into the $p argument. 