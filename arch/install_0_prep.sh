#!/bin/bash

## Setting up wifi
#wifi-menu

# NOTE
# Mount windows partitions for bootloader to detect

# Update this as needed
DISK=/dev/sda
cpu=intel

# Update pacman mirrors
echo "-------------------------------------------------"
echo "Setting up mirrors for optimal download          "
echo "-------------------------------------------------"
timedatectl set-ntp true
pacman -S --noconfirm --needed reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector -a 48 -c "US" -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
#reflector -a 48 -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist


echo -e "\nInstalling prereqs...\n$HR"
pacman -S --noconfirm --needed gptfdisk



echo "--------------------------------------"
echo -e "\nFormatting disk...\n$HR"
echo "--------------------------------------"
mkdir /mnt
# Partition disk
sgdisk -Z ${DISK} # zap all on disk
sgdisk -a 2048 -o ${DISK} # new gpt disk 2048 alignment

sgdisk -n 1:0:+1000M ${DISK} # partition 1 (UEFI SYS), default start block, 512MB
sgdisk -n 2:0:0     ${DISK} # partition 2 (Root), default start, remaining

sgdisk -t 1:ef00 ${DISK}
sgdisk -t 2:8300 ${DISK}

sgdisk -c 1:"UEFISYS" ${DISK}
sgdisk -c 2:"ROOT" ${DISK}

echo -e "\nCreating Filesystems...\n$HR"
if [[ ${DISK} =~ "nvme" ]]; then
    mkfs.vfat -F32 -n "UEFISYS" "${DISK}p1"
    mkfs.ext4 -L "ROOT" "${DISK}p2" -f
    mount -t ext4 "${DISK}p2" /mnt
else
    mkfs.vfat -F32 -n "UEFISYS" "${DISK}1"
    mkfs.ext4 -L "ROOT" "${DISK}2" -f
    mount -t ext4 "${DISK}2" /mnt
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
    ${cpu}-ucode \
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
initrd	/${cpu}-ucode.img
initrd  /initramfs-linux-lts.img
options root=LABEL=ROOT rw rootflags=subvol=@
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

