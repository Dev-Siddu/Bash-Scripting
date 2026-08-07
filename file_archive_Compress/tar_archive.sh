#/bin/bash

# Q) Create a tar archive of the directory "workarea".

# Check for directory existance
dir="workarea"
if [ ! -d "$dir" ]; then
	echo "'workarea' directory doesn't exists"
	exit 1
fi

# archieve using tar
tar -cvf "$dir".tar "$dir"
# -c => create new archieve
# -v => verbose output
# -f => specifies the name of archieve file


if [ $? -eq 0 ]; then
	echo "Archieve successful."
else
	echo "Failed to archieve"
fi

# Q) Extract a tar archieve into 'extracted_files' dir
echo 
tar -xf workarea.tar -C extracted_files

if [ $? -eq 0 ]; then
	printf "Extracted successfully.\n"
else
	printf "Failed to extract.\n"
fi


# Q) Create tar archieve excluding Specific files
# archieve dir named "source_directory" excluding ".txt" files
echo 
dir="source_directory"
if [ ! -d "$dir" ]; then
	printf "$dir doesn't exists.\n"
	exit 1
fi


tar -cf "$dir".tar --exclude="*.txt" "$dir"

if [ $? -eq 0 ]; then
	printf "tar archived successfully by excluding txt files.\n"
else
	printf "tar archive failed.\n"
fi


# Q) Extract Specific Files from a Tar Archive
# tar -xzf 'compressed_files.tar.gz' file1.txt file2.txt -C extracted_files/








