# Q) Create a Symbolic Link:
ln -s ../mainfiles/textfile ./linkfiles/link_textfile

if [ $? -eq 0 ]; then
    echo "Symbolic link 'file_link' created successfully."
else
    echo "Failed to create symbolic link 'file_link'."
fi 


# Q) Check if a Symbolic Link Exists:
echo 
if [ -L ./linkfiles/link_textfile ]; then
    printf "Yes. 'link_textfile' link file exists\n"
else
    print "No. Link file doesn't exists\n"
fi

# Q) Remove a Symbolic Link:
echo

rm ./linkfiles/link_textfile

if [ $? -eq 0 ]; then
	printf "link file removed successfully.\n"
else
	printf "failed to remove link file.\n"
fi


# Q) Create a Symbolic Link for a Directory:
echo
ln -s ../mainfiles/workarea ./linkfiles/dir_link

if [ $? -eq 0 ]; then
	echo "dir link file created."
else
	echo "failed to create dir link file."
fi


# Q) Check if a Symbolic Link Points to a Directory:
echo
if [ -L "./linkfiles/dir_link" ]; then
    if [ -d "./linkfiles/dir_link" ]; then
        echo "Symbolic link 'dir_link' points to a directory."
    else
        echo "Symbolic link 'dir_link' does not point to a directory."
    fi
else
    echo "Symbolic link 'dir_link' does not exist."
fi


# Q) List symbolic links in current directory
echo
printf "List all all symbolic link files in .\n"
cnt=1
for file in ./linkfiles/*; do 
	if [ -L "$file" ]; then
		printf "\t${cnt}) $file\n"
		((cnt = cnt + 1))
	fi
done



# Q) Print the target of a link file
echo
link_file="./linkfiles/dir_link"
if [ -L "${link_file}" ]; then
    target=$(readlink -f "$link_file")
    echo "Target of 'dir_link': $target"
else
    echo "Symbolic link 'dir_link' does not exist."
fi

# Q) Create a Symbolic Link with Absolute Path:
echo 
file_path="$(pwd)/mainfiles/textfile"

ln -s "${file_path}" ./linkfiles/absolute_link

if [ $? -eq 0 ]; then
    echo "link file created with absolute path successfully."
else
    echo "failed to create link with absolute path."
fi



