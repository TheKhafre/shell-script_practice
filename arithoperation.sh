#! /bin/bash
#this script performs a simple arithmetic addition of 2 integers entered

read -p 'enter first number: ' num1
read -p 'enter second number: ' num2

echo the result is $(( num1 + num2 ))