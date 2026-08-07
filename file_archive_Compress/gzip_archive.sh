#!/bin/bash

# Q) Creates a gzip compressed archive of a directory named "workarea".

# Check directory existance
dir="workarea"
if [ ! -d  "$dir" ]; then
	printf "$dir doesn't exists.\n"
	exit 1
fi


tar -czf "$dir".tar.gz workarea
# -c => archive
# -z => Compress using gzip
# -f => specifies file name of the archieve

# Check if the compression was successful
if [ $? -eq 0 ]; then
    echo "Compression successful."
else
    echo "Compression failed."
fi



# Q) Extract a Tar Archive:
tar -xzf "$dir".tar.gz -C extracted_files/

if [ $? -eq 0 ]; then
    echo "Contents of 'workarea.tar.gz' extracted successfully into 'extracted_files' directory."
else
    echo "Failed to extract contents of 'workarea.tar.gz'."
fi


# Q) Compress Multiple Files into a Single Gzip Compressed File (ex f1.txt f2.txt f1.sh f2.sh)
# tar -czf compressed_files.tar.gz file1.txt file2.txt


