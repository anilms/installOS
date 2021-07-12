#!/bin/bash


# Locale
hostname="anil-laptop"
cpu="intel"

###############################
# Hostname and Locale
./install_1_locale.sh $hostname

###############################
# User
./install_2_user.sh

###############################
# systemd-boot
./install_3_boot_systemd.sh $cpu

###############################
# Basic packages
./install_4_basic.sh

###############################
# gnome
./install_5_DE_gnome.sh

