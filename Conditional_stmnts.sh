#!/bin/bash

echo $(( 10 < 7 ))

echo $(( 10 > 7 ))


echo $1

if [ $1 -gt 250 ]
then 
echo  "number is greater than 250"
else
echo "number is less than 250"
fi


if [ -f /tmp/abcd ]
then 
echo "File is existing "
else
echo "File is missing"
fi

test 100 -gt 99 && echo "Yes, that's true." || echo "No, that's false."

test 100 -lt 99 && echo "Yes." || echo "No."

[ "awesome" = "awesome" ]; echo $?

[ 5 -eq 6 ]; echo $?


touch /tmp/abcd
if [ $? -eq 0 ]
then 
echo "File created at /tmp/abcd"
else
echo "No File"
fi














