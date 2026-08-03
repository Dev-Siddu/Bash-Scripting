#!/bin/bash

# Q) Prompt the user to input their favorite place on earth to visit in life time. store it in variable and print it on terminal.

italic=$(tput sitm)
bold=$(tput bold)
under_score=$(tput smul)
reset=$(tput sgr0)

read -p "Enter your favorite place on earth you want to visit in lifetime : " favoriteplace

echo "You must visit ${under_score}${bold}${italic}${favoriteplace}${reset}. Best of luck"

