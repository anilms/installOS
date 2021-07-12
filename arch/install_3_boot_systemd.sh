#!/bin/bash

cpu=$1

# Install systemd-boot
bootctl --path=/boot install

#========================
conf_file=arch.conf
partuuid=`blkid | grep sda3 | sed 's|.*PARTUUID=\"\([0-9a-z-]*\)\".*|\1|'`
echo "##################" > $conf_file
echo "" >> $conf_file
echo "title   Arch Linux" >> $conf_file
echo "linux   /vmlinuz-linux-lts" >> $conf_file
echo "initrd	/${cpu}-ucode.img" >> $conf_file
echo "initrd  /initramfs-linux-lts.img" >> $conf_file
echo "options root=PARTUUID=$partuuid rw quiet loglevel=3 vga=current vt.global_cursor_default=0" >> $conf_file

cp boot/loader.conf /boot/loader/loader.conf
cp $conf_file /boot/loader/entries/arch.conf

# Install ucode
pacman -S ${cpu}-ucode

