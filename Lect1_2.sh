#!/bin/bash

set -n
echo "Today's Date : $(date)"
echo "System is up : $(uptime)"

echo "Hello without debug mode"


for i in `cat my file`
echo $i
done
