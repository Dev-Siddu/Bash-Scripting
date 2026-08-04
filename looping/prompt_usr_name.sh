#!/bin/bash

# Q) Continuosly prompt the user to enter the name until value is quit

name=""

while [[ $name != "quit" ]]
do
	read -p "Input your name (input 'quit' to exit): " name	
	if [[ $name != "quit" ]]; then
		echo "hello $name"
	fi
done

echo "exiting..."
