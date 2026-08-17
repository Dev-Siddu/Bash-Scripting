#!/bin/bash

# Q) create a partition on a new disk

#!/bin/bash

DISK="/dev/sdb"

echo "Current disk layout:"
lsblk "$DISK"

echo
echo "Opening fdisk..."
echo "Inside fdisk:"
echo "  p = print partition table"
echo "  n = create new partition"
echo "  d = delete partition"
echo "  w = write changes"
echo "  q = quit without saving"

sudo fdisk "$DISK"

# Creating a partition does not create a filesystem.
# /dev/sdb -> /dev/sdb1 -> ext4 -> /data


