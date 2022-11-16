#! /bin/bash
#This script search for files whose name is passed
#if the file is available, it checks if the file has write permission
#then append a new data to the end of the file

echo -e "enter the filename: \c"
read file_name

if [ -f $file_name ] #the -f flag checks if a file exists and if it a simple file
then
  if [ -w $file_name ] #this checks if the file has write permission
  then
    echo "type some text here. press ctrl+d when done."
    cat >> $file_name
  else
    echo "the file does not have write permission"
  fi
else
  echo "$file_name does not exist"
fi