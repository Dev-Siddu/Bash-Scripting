#!/bin/bash

# Q) List all files are directories
echo "Listing all files and directories in current directories..."
ls -al

# Q) List only file in current directory

echo 
echo "Listing only files in current directory..."

for file in *;
do
	if [[ -f "$file" ]]; then
		echo ${file}""
	fi
done


# Q) List only directories in current directory

echo
echo "Listing only direcotories in current directory..."

for dir in */;
do
	if [[ -d "$file" ]]; then
		echo "$dir"
	fi
done


# Q) List all hidden file in currnt directory
echo
echo "Listing all hidden file in current directory..."

for file in .*; do 
	if [[ -f "$file" ]]; then
		echo "$file"
	fi
done

# Q) List all files with ".txt" file extension
extension=".txt"
echo 
echo "List all files with $extension extention"
for file in *"$extension"; do
		if [[ -f "$file" ]]; then 
			echo "$file"
		fi
done

# Q) List all files and directories in specific directory which is provides an an argument to the script

red=$(tput setaf 1)
green=$(tput setaf 2)
reset=$(tput sgr0)
givendir=$1

if [[ -z "$givendir" ]]; then
	echo "provide the directory name to list all files and dirs in that"
	exit 0
fi

if [[ ! -d "$givendir" ]]; then
	echo "$givendir is not a valid directory in this system"
	exit 0
fi

files=()
dirs=()

shopt -s nullglob   # If a glob pattern matches nothing, expand it to an empty list instead of leaving it unchanged

for file in "$givendir"/*;
do
	if [[ -f "$file" ]]; then
		files+=("$file")
	elif [[ -d "$file" ]]; then
		dirs+=("$file")
	fi
done

echo -e "\nAll files in ${givendir}"
echo -ne "${red}"
for file in "${files[@]}"; do
    #echo "$($file)" # prints whole path
    echo "$(basename "$file")" # just file name
done
echo -ne "${reset}"

echo -e "\nAll directories in ${givendir}"
echo -ne "${green}"
for dir in "${dirs[@]}"; do
    #echo "$($dir)"
    echo "$(basename "$dir")"
done
echo -ne "${reset}"