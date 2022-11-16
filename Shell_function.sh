#! /bin/bash
#Define function

number_one() {
  echo "Alpha online... over!"
  number_two
}

number_two() {
  echo "Beta online... over!"
}

#invoke the function with nesting
number_one