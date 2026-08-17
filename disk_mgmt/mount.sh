#!/bin/bash

# Q) Mounting file system


DEVICE="/dev/sdb1"
MOUNT_POINT="/data"

sudo mkdir -p "$MOUNT_POINT"

echo "Mounting $DEVICE on $MOUNT_POINT..."
sudo mount "$DEVICE" "$MOUNT_POINT"

echo
echo "===== MOUNT INFORMATION ====="
findmnt "$MOUNT_POINT"

echo
echo "===== DISK USAGE ====="
df -hT "$MOUNT_POINT"



# Q) Unmount file system
echo 
echo "Unmounting file system..."
sudo umount /data       # or sudo umount /dev/sdb1



