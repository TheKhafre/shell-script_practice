#!/bin/bash
#this script runs an internal command that list only the available directories in the working directory on the terminal.

for items in * #asterisks is a widecard to check all the files in the working directory.
do
    if [ -d $items ] #-d checks if the name passed i.e items is a directory
    then
      echo $items #this command lists the result
    fi
done 