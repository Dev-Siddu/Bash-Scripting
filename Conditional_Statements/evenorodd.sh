#!/bin/bash

read -p "Please input a number: " number


# Checking if input is valid number
if [[ ! "$number" =~ ^[0-9]+$ ]]; then
	echo "Invalid input entered. Please enter a valid number"
	exit 1
fi

# Checking weather even or add
if (( number % 2 == 0 )); then
	echo "${number} is even"
else
	echo "${number} is odd"
fi
