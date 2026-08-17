#!/bin/bash

# Q) Check the disk space

echo 
echo "===== File System Capacity ====="
df -h


echo 
echo "===== directory/file consumption ====="
du -sh .


echo
echo "===== /VAR USAGE ====="
sudo du -sh /var/* 2>/dev/null | sort -h



# df = How full is the filesystem?
# du = What is using the space?
