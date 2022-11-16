#! /bin/bash
#a script to check true or false of a num

count=10

if [ $count -ge 10 ]
then
  echo "this is true"
elif [ $count -eq 12 ]
then
  echo "this is still true"
else
  echo "this is actually false!"
fi