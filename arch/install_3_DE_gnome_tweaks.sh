#!/bin/bash

sudo pacman -S \
    gnome-tweaks \
    noto-fonts \
    noto-fonts-cjk \
    ttf-indic-otf \
    ttf-droid \
    ttf-croscore \
    ttf-liberation \
    ttf-roboto \
    ttf-roboto-mono \
    ttf-hack \
    ttf-dejavu \
    --noconfirm --needed

fc-cache

# gnome conf
dconf load / < gnome/my.dconf.txt

#git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
#git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git

#cd WhiteSur-gtk-theme/
#./install.sh -i arch -N glassy
#cd -

#cd WhiteSur-icon-theme/
#./install.sh
#cd -

#gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-dark-solid'
#gsettings set org.gnome.shell.extensions.user-theme name 'WhiteSur-dark'
#gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'

