#!/bin/bash

# Q) Set the permissions of a file named "output.txt" to read, write, and execute for the owner, read and write for the group, and read-only for others.

# Check file existance
echo 
if [ ! -f "output.txt" ]; then
	echo "output.txt file doesn't exists"
	exit 1
fi

chmod 764 output.txt

if [ $? -eq 0 ]; then
	echo "File permissions applied successfully."
else
	echo "Failed to apply file permissions."
fi


# Q) Remove write permissions for the group and others from a file named "input.txt".
echo 
# Check file existance
if [ ! -f "input.txt" ]; then
	echo "input.txt file doesn't exists"
	exit 1
fi

chmod go-w input.txt

if [ $? -eq 0 ]; then
	echo "Write permission removed for group and others for input.txt"
else
	echo "Failed to remove write permission from group and others."
fi


# Q) Grants execute permissions to all users for a script named "test.sh".
echo

# Check file existance
if [ ! -f "test.sh" ]; then
	echo "test.sh file doesn't exists"
	exit 1
fi

chmod +x test.sh

if [ $? -eq 0 ]; then
	echo "Execute permission set to all users on test.sh"
else 
	echo "Failed to set execute permission on test.sh"
fi


# Q) Set the permissions of a directory named "workarea" to read, write, and execute for the owner, read and execute for the group, and no permissions for others.
echo 
# check directory existance
if [ ! -d "workarea" ]; then
	echo "workarea directory doesn't exists"
	exit 1
fi


chmod 750 workarea

if [ $? -eq 0 ]; then
	echo "Permissions set on workarea directory successfully."
else
	echo "Failed to set permission on workarea directory."
fi


# Q) Remove all permissions for the group and others from a directory named "parent_directory".
echo 

# check directory existance

if [ ! -d "parent_directory" ]; then
	echo "directory named 'parent_directory' doesn't exists"
	exit 1
fi

chmod go= parent_directory

if [ $? -eq 0 ]; then
	echo "Removed all permission on 'parent_directory' for group and others"
else
	echo "Failed to remove permission on 'parent_directory' for group and others."
fi


# Q) Grant read and write permissions to the owner, group, and others for a file named "output.txt".
echo 

if [ ! -f "output.txt" ]; then
	echo "output.txt file doesn't exists."
	exit 1
fi

chmod a+rw output.txt

if [ $? -eq 0 ]; then
	echo "read & write permission set to output.txt"
else
	echo "failed to set read and write permission to output.txt"
fi


# Q) Remove execute permissions for the owner and group from a script named " my_script.sh".
echo 

if [ ! -f "my_script.sh" ]; then
	printf "my_script.sh file doesn't exists.\n"
	exit 1
fi

chmod ug-x my_script.sh

if [ $? -eq 0 ]; then
	echo "Execute permission remove from my_script.sh for owner and group."
else
	printf "Failed to remove permission for my_script.sh.\n"
fi


