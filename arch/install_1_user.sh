#!/bin/bash

# Update as needed
username=anil
hostname=anil-laptop

# time zone
timedatectl set-timezone America/Los_Angeles
timedatectl set-ntp true
timedatectl set-local-rtc 1

# Locale
# vim /etc/locale.gen
# Uncomment en_US.UTF-8
sed -i 's|#en_US.UTF-8 UTF-8|en_US.UTF-8 UTF-8|' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

# Hostname
echo $hostname > /etc/hostname

touch /etc/hosts
echo "127.0.0.1	localhost" > /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	$hostname.localdomain $hostname" >> /etc/hosts

# Root password
passwd

# Add User
useradd -m -g users -G wheel -s /bin/bash $username
passwd $username

