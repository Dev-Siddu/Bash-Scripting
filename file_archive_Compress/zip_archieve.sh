#!/bin/bash

# Q) Create zip archieve
dir="workarea"

zip -r "$dir".zip "$dir" # -r => recursive to include all files

if [ $? -eq 0 ]; then
	printf "Zip archieve successful.\n"
else
	printf "Failed to archieve Zip.\n"
fi


# Q) Extract zip archieve into extracted_files dir
echo
unzip "$dir".zip -d extracted_files

if [ $? -eq 0 ]; then
	printf "Zip extracted successfully.\n"
else
	printf "Failed to extract zip.\n"
fi


# Q) Compress a Directory into a Zip Archive with Password Protection.
# Compress "workarea" dir into zip archieve "archive.zip" with password protection.
echo 
read -p "Enter password : " password
echo

zip -r --encrypt --password "$password" archive.zip workarea

if [ $? -eq 0 ]; then
    echo "Zip archive 'archive.zip' created successfully with password protection."
else
    echo "Failed to create zip archive 'archive.zip'."
fi


