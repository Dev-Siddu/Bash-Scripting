#!/bin/bash

# Q) Search for a string.

# check for the search string is given as input or not
echo "Count -> $#"
if [ $# -lt 1 ]; then
	printf "Usage : $0 <search_string>\n"
	exit 1
fi

search_str=$1
filename="test.txt"
grep -q "$search_str" "$filename"

if [ $? -eq 0 ]; then
    echo "String '$search_str' found in '$filename'.\n"
else
    echo "String '$search_str' not found in '$filename'.\n"
fi

