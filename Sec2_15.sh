#!/bin/bash

## Displays system Variables


echo "\n****** Hostname Info ******"
hostnamehcl

ifconfig
echo " "
sleep 2

echo "\n****** File System Disk Space Usage ******"
df -k
echo " "
sleep 2

echo "\n****** Free and Used Memory ******"
free
top -l 1 -s 0 | grep PhysMem
echo " "
sleep 2

echo "\n****** system uptime and load ******"
uptime
echo " "
sleep 2

echo "\n****** Logged in user ******"
who
echo " "
sleep 2


