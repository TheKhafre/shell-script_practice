#! /bin/bash
#the script checks the type of character entered by the user and return a report

echo -e "enter some characters here: \c"
read charv

case $charv in
    [a-z] )
        echo "User entered $charv in lowercase" ;;
    [A-Z] )
        echo "User entered $charv in Uppercase" ;;
    [0-9] )
        echo "User entered $charv in integer character" ;;
    ? ) #special character don't go into a   a square brace. this checks one     character.
        echo "User entered a special character" ;;
    * ) #this checks multiple special       characters.
        echo "user entered a string character"
esac