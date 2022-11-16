## Integer Comparison
* -eq - equal to - if [ "$a" -eq "$b" ]
* -ne - not equal to - if [ "$a" -ne "$b" ]
* -gt - greater than - if [ "$a" -gt "$b" ]
* -ge - greater than or equal to - if [ "$a" -ge "$b" ]
* -lt - less than - if [ "$a" -lt "$b" ]
* -le - less than or equal to - if [ "$a" -le "$b" ]
* < - less than - if (("$a" < "$b"))
* <= - less than or equal to - if (("$a" <= "$b"))
* .> - greater than - if (("$a" > "$b"))
* .>= - greater than or equal to - if (("$a" >= "$b"))

## String Comparison
* = - equal to - [ "$a" = "$b" ]
* == - equal to - if [ "$a" == "$b" ]
* != - not equal to - if [ "$a" != "$b" ]
* < - less than, in ASCII alphabetical order - if [[ "$a" < "$b" ]]
* .> - greater than, in ASCII alphabetical order - if [[ "$a" > "$b" ]]
* -z - string is null, that is, has zero length

#### ignore the dot in front of the greater than symbols