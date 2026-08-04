#!/bin/bash

# Q) Array declaration
# Elements must be separated by space not commas
#colors=("Red", "Green", "Brown", "Black", "White", "Blue", "Orange")

echo "=================================="
echo "============= Array =============="
echo "=================================="

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


# ==================================================
# Associative Array Example
# ==================================================
echo "=================================="
echo "===== Associative Array =========="
echo "=================================="

echo -e "\n\nAssociative Array Example"

# Declare an associative array
declare -A student

# Add key-value pairs
student[name]="John"
student[age]=21
student[city]="Mumbai"
student[course]="Computer Science"
student[grade]="A"

# Access values using keys
echo "Student Name   : ${student[name]}"
echo "Student Age    : ${student[age]}"
echo "Student City   : ${student[city]}"
echo "Student Course : ${student[course]}"
echo "Student Grade  : ${student[grade]}"

# Print all keys
echo -e "\nAll Keys:"
echo "${!student[@]}"

# Print all values
echo -e "\nAll Values:"
echo "${student[@]}"

# Loop through associative array
echo -e "\nKey-Value Pairs:"
for key in "${!student[@]}";
do
    echo -e "\t$key : ${student[$key]}"
done

# Number of key-value pairs
echo -e "\nTotal Entries : ${#student[@]}"