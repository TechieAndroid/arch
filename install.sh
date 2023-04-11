#!/bin/bash

# Delete the current partition table on /dev/sda
echo "This will delete all data on /dev/sda. Are you sure you want to continue? (Y/N)"
read confirm
if [[ $confirm == [Yy] ]]; then
  #sgdisk -og /dev/sda
  sgdisk -Z /dev/sda 
else
  echo "Aborted."
  exit 1
fi

# Create new partition table and partitions on /dev/sda
# sgdisk -n 1:0:+5M -t 1:ef02 -n 2:0:0 -t 2:8300 /dev/sda
echo -e "o\ny\nn\n\n\n+5M\nef02\nn\n\n\n\n8300\nw\ny\n" | gdisk /dev/sda

# Format second partition as ext4
mkfs.ext4 /dev/sda2 ; mount /dev/sda2 /mnt

timedatectl set-ntp true ; timedatectl set-timezone America/New_York ; timedatectl status
hwclock --show ; hwclock --systohc

reflector --latest 20 --sort rate --protocol https -c 'United States' --age 12 --save /etc/pacman.d/mirrorlist

pacman -Sy archlinux-keyring ; pacman -Su ; pacstrap -K /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
