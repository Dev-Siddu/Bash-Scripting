#!/bin/bash

# Q) search a file named "test.txt" in current directory

red=$(tput setaf 1)
green=$(tput setaf 2)
reset=$(tput sgr0)

if [ -f "test.txt" ]; then
	echo "${green}File 'test.txt' found.${reset}"
else
	echo "${red}File 'test.txt' not found ${reset}"
fi


# Q) Search for a specific file name provided as argument

if [ $# -ne 1 ]; then
	echo "Usage : $0 <filename>"
	exit 1
fi

filename="$1"
echo -e "\nSearching for $filename ..."

if [ -f "$filename" ]; then
	echo "$filename found"
else 
	echo "$filename not found"
fi


# Q) Search for a file large than 1 KB in current directory
echo -e "\nSearching for file greated than 1KB..."
for file in *; do
	if [ -f "$file" ] && [ $(stat -c %s "$file") -gt 1024 ]; then
		echo "$file"
	fi
done

# Q) Search for empty files
echo -e "\nSearching for empty files..."
for file in *; do
	if [ -f "$file" ] && [ ! -s "$file" ]; then
		echo "$file"
	fi
done


# Q) Search file with specific extensiont ".txt"
echo -e "\nSearching for .txt files..."

# Enable globbing to include hidden files
shopt -s dotglob

extension="txt"

# The general form ${variable##pattern}
# => # → remove the shortest matching prefix.
# => ## → remove the longest matching prefix.

for file in *; do
	if [ ${file##*.} == ${extension} ]; then
		echo "$file"
	fi
done











