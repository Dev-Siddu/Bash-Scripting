#!/bin/bash

# Q) Check weather script named test.sh is executable if so then execute else print not executable

executablefilename="test.sh"

if [ ! -f "${executablefilename}" ]; then
	echo "$executablefilename does not exists"
	exit 1
fi

if [ ! -x "${executablefilename}" ]; then
	echo "$executablefilename is not executable"
	exit 1
fi

./"${executablefilename}"
