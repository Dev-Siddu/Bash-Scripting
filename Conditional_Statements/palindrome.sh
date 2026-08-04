#!/bin/bash

# Q) Check given input is palindrome or not.

echo "Input a string:"
read input_str

# Removing non-alphanumeric characters and converting to lowercase
new_string=$(echo "$input_str" | tr -dc '[:alnum:]' | tr '[:upper:]' '[:lower:]')

# Reversing the string
reversed_string=$(echo "$new_string" | rev)

# Checking if the string is a palindrome
if [ "$new_string" = "$reversed_string" ]; then
    echo "The string \"$input_str\" is a palindrome."
else
    echo "The string \"$input_str\" is not a palindrome."
fi

