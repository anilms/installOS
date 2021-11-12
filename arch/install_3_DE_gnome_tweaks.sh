#!/bin/bash

sudo pacman -S --needed \
    gnome-tweaks \
    noto-fonts \
    ttf-roboto \
    ttf-roboto-mono \
    ttf-hack \
    ttf-roboto \
    ttf-roboto-mono \
    ttf-dejavu

# Install gnome themes
#sudo pacman -S --needed \
#    arc-gtk-theme \
#    papirus-icon-theme \
#    variety

#yay -S \
#    flat-remix-gnome
#    flat-remix \
#    flat-remix-gtk

#yay -S \
#    whitesur-gtk-theme-git \
#    whitesur-icon-theme-git
#    whitesur-cursor-theme-git

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
#git clone https://github.com/daniruiz/flat-remix-gnome.git

cd WhiteSur-gtk-theme/
./install.sh -i arch -N glassy
cd -

cd WhiteSur-icon-theme/
./install.sh
cd -

#cp -r flat-remix-gnome/Flat-Remix-Blue-fullPanel ~/.themes/



# Gnome sane settings
# Refer here https://gist.github.com/grenade/6363978
gsettings set org.gnome.desktop.wm.preferences audible-bell false
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.software download-updates false

gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'type', 'date_modified']"
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

#gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface toolbar-icons-size 'small'

gsettings set org.gnome.desktop.interface font-name 'Noto Sans 10'
gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans 10'
gsettings set org.gnome.desktop.interface monospace-font-name "Hack 9"
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Noto Sans Bold 10'

gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-light-solid'
gsettings set org.gnome.shell.extensions.user-theme name 'WhiteSur-light'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'

# Keyboard shortcuts
dconf load /org/gnome/desktop/wm/keybindings/ < gnome/wm-keybindings.dconf.bak
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < gnome/media-keys-keybindings.dconf.bak
