#!/bin/bash

# Q) Move directory from "workarea" to "new_workarea"

source="workarea"
destin="new_workarea"

bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
reset=$(tput sgr0)

#check dir exists

if [[ ! -d "${source}" ]]; then
	echo "${bold}${red}${source} directory doesn't exists"
	exit 1
fi


mv "${source}" "${destin}"

if [[ $? -eq 0 ]]; then
	echo "${bold}${green}${source} moved to ${destin} successfully${reset}"
else
	echo "${bold}${red}failed to moved directory ${source}"
fi
