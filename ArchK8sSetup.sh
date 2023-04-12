#!/bin/bash

# Set up disk without swap
sgdisk -Z /dev/sda
sgdisk -a 2048 -n 1:0:+512M -t 1:ef02 /dev/sda
sgdisk -n 2:0:0 -t 2:8300 /dev/sda

# Update fstab to remove swap
sed -i '/swap/d' /etc/fstab

# Install packages
pacman -S vim grub networkmanager htop neofetch

# Enable network manager to start at boot
systemctl enable NetworkManager

# Install GRUB i386-pc
grub-install --target=i386-pc --boot-directory=/boot --recheck /dev/sda

# Set GRUB timeout to 0
sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub

# Configure GRUB
echo "GRUB_CMDLINE_LINUX_DEFAULT=\"quiet\"" >> /etc/default/grub
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# Set hostname to k8smasternode
echo "k8smasternode" > /etc/hostname

# Get IP address and write it down
ip_address=$(ip addr show dev eth0 | grep "inet " | awk '{print $2}' | cut -d '/' -f 1)
echo "IP Address: $ip_address"

# Install Docker, Kubeadm, Kubelet, Kubectl
pacman -S docker kubeadm kubelet kubectl
systemctl enable docker.service kubelet.service
