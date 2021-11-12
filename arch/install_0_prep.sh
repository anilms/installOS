#!/bin/bash

## Setting up wifi
#wifi-menu

# NOTE
# Mount windows partitions for bootloader to detect

if [ -z "${CONFIG_DISK}" ] || [ -z "${CONFIG_CPU}" ]; then
	echo "Set parameters in setup.conf and source"
	exit
fi

echo ""
echo "-------------------------------------------------"
echo "Disk: ${CONFIG_DISK}"
echo "Cpu: ${CONFIG_CPU}"
echo ""
echo ""


# Update pacman mirrors
echo "-------------------------------------------------"
echo "Setting up mirrors for optimal download          "
echo "-------------------------------------------------"
timedatectl set-ntp true
pacman -S \
    reflector \
    --noconfirm --needed
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector -a 48 -c "US" -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
#reflector -a 48 -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist


echo -e "\nInstalling prereqs...\n$HR"
pacman -S \
    gptfdisk \
    --noconfirm --needed



echo "--------------------------------------"
echo -e "\nFormatting disk...\n$HR"
echo "--------------------------------------"
mkdir -p /mnt
# Partition disk
sgdisk -Z ${CONFIG_DISK} # zap all on disk
sgdisk -a 2048 -o ${CONFIG_DISK} # new gpt disk 2048 alignment

sgdisk -n 1:0:+1000M ${CONFIG_DISK} # partition 1 (UEFI SYS), default start block, 512MB
sgdisk -n 2:0:0     ${CONFIG_DISK} # partition 2 (Root), default start, remaining

sgdisk -t 1:ef00 ${CONFIG_DISK}
sgdisk -t 2:8300 ${CONFIG_DISK}

sgdisk -c 1:"UEFISYS" ${CONFIG_DISK}
sgdisk -c 2:"ROOT" ${CONFIG_DISK}

echo -e "\nCreating Filesystems...\n$HR"
if [[ ${CONFIG_DISK} =~ "nvme" ]]; then
    mkfs.vfat -F32 -n "UEFISYS" "${CONFIG_DISK}p1"
    mkfs.ext4 -L "ROOT" "${CONFIG_DISK}p2"
    mount -t ext4 "${CONFIG_DISK}p2" /mnt
else
    mkfs.vfat -F32 -n "UEFISYS" "${CONFIG_DISK}1"
    mkfs.ext4 -L "ROOT" "${CONFIG_DISK}2"
    mount -t ext4 "${CONFIG_DISK}2" /mnt
fi


# mount target
mount -t ext4 -L ROOT /mnt
mkdir /mnt/boot
mkdir /mnt/boot/efi
mount -t vfat -L UEFISYS /mnt/boot/


# Install Arch linux
echo "--------------------------------------"
echo "-- Arch Install on Main Drive       --"
echo "--------------------------------------"
pacstrap /mnt \
    base \
    base-devel \
    linux-lts \
    linux-firmware \
    ${CONFIG_CPU}-ucode \
    vim \
    nano \
    git \
    --noconfirm --needed


echo "--------------------------------------"
echo "-- Bootloader Systemd Installation  --"
echo "--------------------------------------"
bootctl install --esp-path=/mnt/boot

[ ! -d "/mnt/boot/loader/entries" ] && mkdir -p /mnt/boot/loader/entries
cat <<EOF > /mnt/boot/loader/entries/arch.conf
title Arch Linux
linux /vmlinuz-linux-lts
initrd	/${CONFIG_CPU}-ucode.img
initrd  /initramfs-linux-lts.img
options root=LABEL=ROOT rw quiet loglevel=3 vga=current vt.global_cursor_default=0
EOF

cat <<EOF > /mnt/boot/loader/loader.conf
default  arch.conf
timeout  4
console-mode max
editor   no
EOF

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab


# Copy updated pacman mirrorlist
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist

# Copy this directory to root
cp -R ../../installOS /mnt/root/

# Configure arch
arch-chroot /mnt

