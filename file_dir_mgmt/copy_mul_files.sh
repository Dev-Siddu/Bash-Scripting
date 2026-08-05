#!/bin/bash

# Q) copy all the .txt files from one directory to another directory.

source="source"
destination="destination"

# check source directory exists

if [[ ! -d "${source}" ]]; then
	echo "${source} directory doesn't exists"
	exit 1
fi

# Create destination directory if not exists
mkdir -p ${destination}""

cp "${source}"/*.txt "${destination}"/

if [[ $? -eq 0 ]]; then
	echo "All text files from ${source} moved to ${destination} successfully."
else
	echo "Opeation filed."
fi

