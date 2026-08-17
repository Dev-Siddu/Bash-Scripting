#!/bin/bash

# Q) create a filesystem on a partition.


PARTITION="/dev/sdb1"

echo "WARNING: This will erase all data on $PARTITION"
read -p "Type YES to continue: " answer

if [[ "$answer" == "YES" ]]; then
    sudo mkfs.ext4 "$PARTITION"
else
    echo "Operation cancelled."
fi


echo 
read -p "do you want to lable the Patition ? [Y/n] : " reqLable

if [[ "$reqLable" == "Y" ]]; then 
    sudo e2label "$PARTITION" DATA

