#!/bin/bash

cpu=$1

# Install Grub bootloader
pacman -S grub efibootmgr os-prober
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi

# Install ucode
pacman -S ${cpu}-ucode

grub-mkconfig -o /boot/grub/grub.cfg

