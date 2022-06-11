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

#git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
#git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git

#cd WhiteSur-gtk-theme/
#./install.sh -i arch -N glassy
# ./install.sh -o solid -c dark -i arch -m -N normal -HD --nord
#cd -

#cd WhiteSur-icon-theme/
#./install.sh
#cd -

#gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-dark-solid'
#gsettings set org.gnome.shell.extensions.user-theme name 'WhiteSur-dark'
#gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'

