#! /bin/bash
#this script performs a simple float point arithmetic division of predefined var

num1=20.8
num2=3.2

echo "scale=5; 20.8/3.2" | bc #the scale is added to tell the program how many decima places we want, and in this example we have defined it as 5.

#without indicating the scale, the script will run but will give an inaccurate result without decimal
