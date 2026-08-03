#!/bin/bash

# Q) print values of special variables  $0, $#, $@, and $?

# Print the name of the script
echo "Name of the script: $0"

# Print the number of arguments passed to the script
echo "Number of arguments passed: $#"

# Print all the arguments passed to the script
echo "All arguments passed: $@"

# Check the exit status of the last command
echo "Exit status of the last command: $?"

# Print the current process id
echo "Current Process ID : $$"
