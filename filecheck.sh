#! /bin/bash
#This script search for files whose name is passed

echo -e "enter the filename: \c"
read file_name

if [ -e $file_name ] #the -e flag checks if a file exists or not
then
  echo "$file_name found"
else
  echo "$file_name not found"
fi