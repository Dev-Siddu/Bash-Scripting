#!/bin/bash

# Q) Echo with Escape Sequences : 
# Write a Bash script that uses the echo command to print a multi-line message using escape sequences for newlines (\n) and tabs (\t).

echo -e "line-1\n\tline-2\n\t\tline-3"

# -e -> this make \n \t to be interpretated without this these escape sequence will be just a character 
# \n for newline character
# \t tab character

