#!/bin/bash

# Q) Search file for files owned by specific user. (user name is given as command argument)

if [ $# -eq 0 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

username="$1"

find . -maxdepth 1 -type f -user "$username"

