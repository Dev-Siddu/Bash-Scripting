#!/bin/bash

# Q) Sort the lines in a text file named alphabetically.
file_name="test.txt"

sort "$file_name" > tmp_"$file_name"

mv tmp_"$file_name" "$file_name"

printf "Lines in $file_name sorted alphabetically.\n"

