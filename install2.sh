#!/bin/bash

# Set timezone to America/Chicago
timedatectl set-timezone America/Chicago

# Set NTP to true
timedatectl set-ntp true

# Set hardware clock to system time
hwclock --systohc

# Uncomment en_US.UTF-8 in /etc/locale.gen
sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen

# Generate locales
locale-gen

# Set LANG variable in /etc/locale.conf
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Set hostname in /etc/hostname
echo "hostname" > /etc/hostname

# Set hostname in /etc/hosts
cat << EOF > /etc/hosts
127.0.0.1 localhost
::1 localhost
127.0.1.1 hostname.localdomain hostname
EOF

# Set root password
passwd

# Pacman
pacman -S grub networkmanager ufw neofetch sudo nano vim htop docker docker-compose xdg-user-dirs

# BIOS boot
grub-install --target=i386-pc /dev/sda ; grub-mkconfig -o /boot/grub/grub.cfg

# Edit /etc/sudoers file
echo "tux ALL=(ALL) ALL" >> /etc/sudoers
echo "Defaults passwd_timeout=0" >> /etc/sudoers

# Update xdg user directories
xdg-user-dirs-update

# Edit /etc/pacman.conf file
sed -i 's/#Color/Color/g' /etc/pacman.conf
echo "ILoveCandy" >> /etc/pacman.conf

# Enable NetworkManager
systemctl enable NetworkManager
