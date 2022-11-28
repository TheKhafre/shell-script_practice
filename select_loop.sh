#!/bin/bash
#the script is an emulation of a menu button which allows user select from a group of option by providing reaponse according to the number in behind each option

select name in Tobi Daniel Gbenga Femi
do
  case $name in
  Tobi)
    echo "Tobi selected" ;;
  Daniel)
    echo "Daniel selected" ;;
  Gbenga)
    echo "Gbenga selected" ;;
  Femi)
    echo "Femi selected" ;;
  *)
    echo "please select a valid number"
  esac
done