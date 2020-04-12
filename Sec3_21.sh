#!/bin/bash

echo $(( 35+65 ))

echo  $(( 5*2 ))

echo $(( 10/2 ))

echo $(( 10-2 ))

ab=1

echo $(( ab++ ))

echo $(( ab++ ))


#-----------------22
AB=10
echo $AB

declare -i AB=100
echo $AB

AB=a
echo $AB

declare -r Anu=Anuja
echo $Anu

#---------------23

echo file{1,2,3}
echo file{1,2,3}.txt

echo file{1..10}.txt













