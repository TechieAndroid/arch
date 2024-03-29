#!/bin/bash

# Delete the current partition table on /dev/sda
echo "This will delete all data on /dev/sda. Are you sure you want to continue? (Y/N)"
read confirm
if [[ $confirm == [Yy] ]]; then
  sudo sgdisk -Z /dev/sda
else
  echo "Aborted."
  exit 1
fi

# Create new partition table and partitions on /dev/sda
echo -e "o\ny\nn\n\n\n+5M\nef02\nn\n\n\n\n8300\nw\ny\n" | sudo gdisk /dev/sda

# Format second partition as ext4
sudo mkfs.ext4 /dev/sda2
