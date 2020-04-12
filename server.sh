#!/bin/bash

echo -e "\033[4mSystem Information\033[0m"
ping -c 1 google.com &> /dev/null && int="Connected" || int="Not Connected"

echo $int

