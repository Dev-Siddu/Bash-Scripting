#!/bin/bash

# Q) echo with Formattings like bold red reset ...

bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)
italic=$(tput sitm)

# -e option enables interpretation of backslash escapes for ANSI escape codes
echo -e "${bold}${italic}${red}This is a bold, italic  and red message.${reset}"