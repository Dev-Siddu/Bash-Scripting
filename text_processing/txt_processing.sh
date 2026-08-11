#!/bin/bash

# Q) Count lines in a file
filename="test.txt"
if [ ! -f "$filename" ]; then
	printf "$filename file doesn't exists.\n"
	exit 1
fi

lines=$(wc -l < "$filename")
printf "Number of lines in $filename : $lines\n"


# Q) Count words in a file
echo 
words=$(wc -w < "$filename")
printf "Number of words in $filename : $words\n"


# Q) Count Characters in a file
echo 
chars=$(wc -c < "$filename")
printf "Number of characters in $filename : $chars\n"





