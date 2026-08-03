#!/bin/bash

# Q) Redirect the output of ls command to a output.txt file
# > symbol used for output redirection.
ls > output.txt


# Q) Read the contents for file input.txt and echo the contents to terminal.
cat < input.txt


# Q) Read the contents from input.txt and redirect the output to output.txt file
cat < input.txt > output.txt


# Q) Redirect the standard error of a command to a error.log file
# 0> → Redirects standard input (stdin)
# 1> → Redirects standard output (stdout).
# 2> → Redirects standard error (stderr).
random_test_cmd 2> error.log


# Q) Append the output of date command to log.txt file without overrighting existing content
# >> is also a redirection symbol instead of overrighting it appends the content.
date >> log.txt


# Q) Suppress the output of a command. 
# it can be achieved by redirecting the output to /dev/null which is a special file which removes/discards all the data written to it.
echo "Hello World Supressable content" > /dev/null


# Q) Redirect the output of a command to another command a input.
ls -l | grep '\.txt'


# Q) Read a number from num.txt file and perform an operation on that number and print the result
read num < num.txt
result=$((num * 2))
echo "The result of doubling the number from nums.txt is: $result"


# Q) Redirect the output of a command to both file and terminal simultaneously
# The "tee" command reads from standard input and writes to both standard output (the terminal) and the specified file.
ls -l | tee output.txt


# Q) Bash script that uses a heredoc to input multi-line text and redirects it to a file named "document.txt".
cat > document.txt << EOF
This is line 1 of the document.
This is line 2 of the document.
This is line 3 of the document.
EOF
