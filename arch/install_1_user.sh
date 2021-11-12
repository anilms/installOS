#!/bin/bash

# Update as needed
username=anil
hostname=anil-laptop
if [ -z "${CONFIG_USERNAME}" ] || [ -z "${CONFIG_HOSTNAME}" ]; then
	echo "Set parameters in setup.conf and source"
	exit
fi

echo ""
echo "-------------------------------------------------"
echo "Username: ${CONFIG_USERNAME}"
echo "Hostname: ${CONFIG_HOSTNAME}"
echo ""
echo ""


# time zone
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

timedatectl set-timezone America/Los_Angeles
timedatectl set-ntp true
#timedatectl set-local-rtc 1

# Locale
# vim /etc/locale.gen
# Uncomment en_US.UTF-8
sed -i 's|#en_US.UTF-8 UTF-8|en_US.UTF-8 UTF-8|' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

# Hostname
echo ${CONFIG_HOSTNAME} > /etc/hostname

touch /etc/hosts
echo "127.0.0.1	localhost" > /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	${CONFIG_HOSTNAME}.localdomain ${CONFIG_HOSTNAME}" >> /etc/hosts

# Root password
passwd

# Add User
useradd -m -g users -G wheel -s /bin/bash ${CONFIG_USERNAME}
passwd ${CONFIG_USERNAME}

echo ""
echo ""
echo "--------------------------------------"
echo "User ${CONFIG_USERNAME} has been added!"
echo "Edit /etc/sudoers now!"
echo ""

