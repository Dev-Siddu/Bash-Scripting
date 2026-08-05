#!/bin/bash

# Q) copy "error.log" to "old_error.log"

from="error.log"
to="old_error.log"

red=$(tput setaf 1)
green=$(tput setaf 2)
bold=$(tput bold)
reset=$(tput sgr0)


# checking weather from file exists
if [[ ! -f "$from" ]]; then
	echo "${bold}${red}${from} file doesn't exists${reset}"
	exit 1
fi

cp "$from" "$to"

if [[ $? -eq 0 ]]; then
	echo "${bold}${green}${from} file copied to ${to} successfully.${reset}"
else
	echo "${bold}${red}${from} file copy to ${to} failed.${reset}"
fi

