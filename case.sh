#! /bin/bash
#this script gives an example of using the case statement which is a multi-level conditional statement check of the if-statement.

vehicle=$1 #the $1 is a variable input that allows user to type something on the terminal which then saves into the vehicle variable.

case $vehicle in
    "car" )
        echo "rent of $vehicle is 100 dollar" ;;
    "van" )
        echo "rent of $vehicle is 80 dollars" ;;
    "truck" )
        echo "rent of $vehicle is 150 dollars" ;;
    * )
        echo "vehicle unavailable" ;;
esac