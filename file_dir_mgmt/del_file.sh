#!/bin/bash

# Q) Delete a file named "file1.txt"

# check file exists

if [[ ! -f "file1.txt" ]]; then
	echo "file1.txt doesnot exits"
	exit 1
fi


rm file1.txt

if [[ $? -eq 0 ]]; then
	echo "file1.txt deleted successfully"
else
	echo "failed to delete file1.txt"
fi



# Q) Delete multiple files names starting with "error" in current directory.
#!/bin/bash

if ls error* >/dev/null 2>&1; then
    rm error*
    echo "Files starting with 'error' deleted successfully."
else
    echo "No files starting with 'error' found."
fi
