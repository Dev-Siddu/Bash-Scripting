#!/bin/bash

password="user@9743#"

echo "Enter your password : "
stty -echo # set terminal setting disable character echo
read user_password
stty echo # set terminal setting enable charater echo

echo

if [ "$user_password" = "$password" ]; then
	echo "Access granted"
else
	echo "Access denied"
fi


