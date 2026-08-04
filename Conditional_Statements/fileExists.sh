#!/bin/bash

# Q) Check weather a file named "test.txt" exists in current directory

red=$(tput setaf 1)
green=$(tput setaf 2)
bold=$(tput bold)
reset=$(tput sgr0)

if [ -f "test.txt" ]; then
	echo "${green}${bold}file exist${reset}"
else
	echo "${red}${bold}file doesn't exists${reset}"	
fi
