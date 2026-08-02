#!/bin/bash

# Q) Echo with Command Substitution

# Write a Bash script that uses command substitution to display the current date and time using the date command.

#Command substitution is a Linux shell feature that allows you to execute a command and instantly replace the command expression with its standard output
current_datetime=$(date)

echo "current date time is ->  $current_datetime"

