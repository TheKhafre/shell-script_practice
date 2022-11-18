#! /bin/bash
#this is a simple script to print hello world
#it also takes in the user's name and sends a greeting to the terminal
#the script ends with the name of the bash and version

echo "hello world!"
echo "what is your name?"
read NAME
echo "hello $NAME"
echo "this is your bash name $BASH"
echo "your bash version is $BASH_VERSION"

echo "have a good day $NAME"