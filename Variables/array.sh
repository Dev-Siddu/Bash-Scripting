#!/bin/bash

# Q) Array declaration
# Elements must be separated by space not commas
#colors=("Red", "Green", "Brown", "Black", "White", "Blue", "Orange")
colors=("Red" "Green" "Brown" "Black" "White" "Blue" "Orange")

echo "Most used Colors are : ${colors}" # prints only first element
echo "Colors : ${colors[@]}"
echo "Colors : ${colors[*]}"

echo "Using for loop"

for color in "${colors[@]}"; 
do 
    echo -e "\tcolor : ${color}"
done

echo -e "\n\ncolors array length : ${#colors[@]}"
