#!/bin/bash

# Q) Iterate through the file and directories in current directory and print them

for file in *; do
	if [[ -f $file ]]; then
		echo "$file"
	fi
done

