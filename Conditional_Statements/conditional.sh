#!/bin/bash

# Q) Check if a number is greater than 10 print message bases on that
read -p "Enter a number : " num

if [ $num -gt 10 ];then
	echo "${num} is greater than 10"
else
	echo "${num} is not greater than 10"
fi

echo # for empty line

# Q) Prompt the user to input there age and print is adult or minor

read -p "Enter your age : " age

if [ $age -ge 18 ]; then
	echo "You are adult"
else
	echo "You are minor"
fi


# Q) Check if a given string is empty or not
str=" "

if [ -z "$str" ];then
	echo "string is empty"
else
	echo "string is not empty"
fi

