#!/bin/bash

# Q) Move multiple directories

dirs=("dir_1" "dir_2" "dir_3")
destin_dir="destin_dir"

for dir in "${dirs[@]}"; do
	if [[ ! -d "$dir" ]]; then
		echo "$dir doesn't exits"
		continue
	fi

	# create destination directory if not exists
	mkdir -p "$destin_dir"

	mv "$dir" "$destin_dir"/

	if [[ $? -eq 0 ]];then 
		echo "$dir moved to $destin_dir successfully."
	else
		echo "failed to move $dir."
	fi
done
