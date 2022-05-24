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
    bluez \
    bluez-utils \
    reflector \
    pacman-contrib \
    plasma-desktop \
    kdeplasma-addons\
    sddm \
    sddm-kcm \
    plasma-nm \
    plasma-pa \
    kde-gtk-config \
    kscreen \
    khotkeys \
    breeze \
    breeze-gtk \
    konsole \
    dolphin \
    dolphin-plugins \
    powerdevil \
    kinfocenter \
    okular \
    spectacle \
    kcalc \
    --noconfirm --needed

systemctl enable NetworkManager
#systemctl start NetworkManager

systemctl enable systemd-timesyncd.service
#systemctl start systemd-timesyncd.service

systemctl enable sddm.service
# systemctl start sddm.service

systemctl enable bluetooth.service
# systemctl start bluetooth.service


echo ""
echo ""
echo "--------------------------------------"
echo "Restart now and see if DE works fine!"


