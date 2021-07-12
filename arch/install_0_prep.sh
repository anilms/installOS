#!/bin/bash

exit 0 # Avoid accidental run

## Setting up wifi
wifi-menu

## Partition harddrives
fdisk -l                        # check partitions
fdisk /dev/sda                  # Partition the drive
# g for new gpt table
# n for new partition
# a for setting partition to bootable
# d for delete partition
# w write partition table
# /dev/sda1 - Boot Partition - EFI File System
# /dev/sda3 - Remaining - Linuxx File System

# Create file system
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

# NOTE
# Mount windows partitions for bootloader to detect


# Reorder pacman mirrors
grep "United States" /etc/pacman.d/mirrorlist -A 1 | sed '/--/d' > mirrorlist_us
# or fetch from web
curl -s "https://www.archlinux.org/mirrorlist/?country=US&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 -
# Or with reflector
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist


# Install Arch linux
pacstrap /mnt base base-devel linux-lts linux-firmware vim nano git


# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab


# Configure arch
arch-chroot /mnt

