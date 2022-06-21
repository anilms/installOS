#!/bin/bash

sudo pacman -S \
    gnome-tweaks \
    noto-fonts \
    noto-fonts-cjk \
    ttf-hack \
    --noconfirm --needed

fc-cache

# gnome conf
dconf load / < gnome/my.dconf.txt

