#!/bin/bash

# Q) Generate a random number under divisible by 3

random_num=""

while true
do
	random_num=$((RANDOM))
	
	if ((random_num % 3 == 0)); then
		echo "$random_num is divible by 3 exiting..."
		exit 0
	fi

	echo "${random_num}"	
done
