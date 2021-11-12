#!/bin/bash

# Install xserver
pacman -S \
    xorg \
    xorg-xinit \
    xorg-server \
    alsa-utils \
    pulseaudio \
    pulseaudio-alsa \
    ntfs-3g \
    xdg-user-dirs  \
    networkmanager \
    reflector \
    pacman-contrib \
    gnome \
    --noconfirm --needed


systemctl enable NetworkManager
#systemctl start NetworkManager

systemctl enable systemd-timesyncd.service
#systemctl start systemd-timesyncd.service

systemctl enable gdm.service
#systemctl start gdm.service

echo ""
echo ""
echo "--------------------------------------"
echo "Restart now and see if DE works fine!"
