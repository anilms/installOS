#!/bin/bash

pacman -S \
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
    kcalc


# Sddm theme
# Default configuration is here /usr/lib/sddm/sddm.conf.d/default.conf
# For changes, create configuration files in /etc/sddm.conf.d/
# Read more here https://jlk.fjfi.cvut.cz/arch/manpages/man/sddm.conf.5
# Make Current=breeze
# Enable sddm
#sed -i "s|^Current=$|Current=breeze|" /usr/lib/sddm/sddm.conf.d/default.conf

# Enable services
systemctl enable sddm.service


