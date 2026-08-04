#!/bin/bash

# Q) Print numbers for 1 to 10

# using for loop
echo -e "using for loop"

for ((i = 1; i <= 10; i++))
do
	echo $i
done	

# using while loop
echo -e "using while loop"

num=1

while [ $num -le 10 ]
do
	echo $num
	num=$((num+1))
done	


# iterate from 1 to 20 and print only odd numbers 
echo "Iterate from 1 to 20 and print only odd numbers"
for ((i = 1 ; i <= 20; i++))
do
	if (( i % 2 != 0 )); then
		echo $i 
	fi
done

# Q) Iterate over list of names and greet

bold=$(tput bold)
italic=$(tput sitm)
green=$(tput setaf 2)
reset=$(tput sgr0)

names=("Rahul" "John" "Willium" "Blake" "Smith")
for name in "${names[@]}";do
	echo "Hi, ${bold}${italic}${green}${name}${reset} welcome to bash scripting..."
done


