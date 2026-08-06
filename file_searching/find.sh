#!/bin/bash

# Q) Search in a file contains a specific string provided as command argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <search_string>"
    exit 1
fi

search_string="$1"

for file in *; do
    if [ -f "$file" ] && [ $(grep -q "$search_string" "$file"; echo $?) -eq 0 ]; then
        echo "$file"
    fi
done

# Q) Search for symbolic link in current directory.
echo -e "\nSearching for symbolic link files..."
find . -maxdepth 1 -type l

# Q) Search file with execute permission
echo -e "\nSearching for executable files..."
find . -maxdepth 1 -type f -executable
