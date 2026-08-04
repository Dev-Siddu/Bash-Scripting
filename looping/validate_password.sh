#!/bin/bash

# Q) Validate password untill correct 

correct_password="abc@123"

pass=""

while true
do
	printf "Enter password: "
	stty -echo
	read pass
	stty echo

	if [[ $pass != $correct_password ]]; then
		echo "Incorrect password"	
	else
		echo "password matched"
		echo "Exiting..."
		exit 0
	fi
done
