#!/bin/bash

#Q) create a directory named "workarea" in current directory

echo "Creating workarea directory..."
dirname="workarea"

if [[ -d "${dirname}" ]]; then
	echo "directory already exists"
else
	mkdir "${dirname}"

	if [ $? -eq 0 ]; then
        	echo "directory 'workarea' created successfully"
	else
        	echo "failed to create directory."
	fi
fi


# Q) Create multiple directories dir_1", "dir_2", and "dir_3"

echo "Creating dir_1 dir_2 dir_3 directories..."

dirs=("dir_1" "dir_2" "dir_3")
failed=0

for dir in "${dirs[@]}"; do
    if [[ -d "$dir" ]]; then
        echo "'$dir' already exists."
    elif mkdir "$dir"; then
        echo "'$dir' created."
    else
        echo "Failed to create '$dir'."
        failed=1
    fi
done

if (( failed == 0 )); then
    echo "Completed successfully."
else
    echo "Completed with errors."
fi
