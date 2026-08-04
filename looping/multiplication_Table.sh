#!/bin/bash

# Q) Promt user to input a number and print multiplication table of that number


read -p "Enter a number: " num

if [ -z $num ]; then
	echo "Enter a number"
	exit 1
fi

if [[ ! $num =~ ^[0-9]+$ ]];then
	echo "Enter a valid number"
	exit 1
fi


for ((i=1; i<=10; i++))
do
	echo "$num * $i =  $((num * i))"
done
