#!/bin/bash

# Q) List block devices
echo "===== BLOCK DEVICES ====="
lsblk


# Q) List filesystem information
echo
echo "===== FILESYSTEM INFORMATION ====="
lsblk -f


# Q) List partition tables
echo
echo "===== PARTITION TABLES ====="
sudo fdisk -l


# Q) List Mounted file systems
echo
echo "===== MOUNTED FILESYSTEMS ====="
df -hT
