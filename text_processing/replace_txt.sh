#!/bin/bash

# Q) Replace a word with another word in a text file 

if [ $# -ne 2 ]; then
	printf "Usage : $0 <old_world> <new_word>\n"
	exit 1
fi

file_name="test.txt"
old_wd=$1
new_wd=$2

sed -i "s/$old_wd/$new_wd/g" "$file_name"

if [ $? -eq 0 ]; then
	printf "All occurances replaces successfully.\n"
else
	printf "Some error occured.\n"
fi





