#!/bin/bash

sudo dnf install \
    gnome-tweaks \
    gnome-shell-extension-user-theme \
    arc-theme \
    papirus-icon-theme \
    flat-remix-theme \
    flat-remix-icon-theme \
    gnome-shell-theme-flat-remix \
    google-noto-serif-fonts \
    google-noto-sans-fonts \
    google-noto-sans-mono-fonts \
    google-roboto-fonts \
    google-roboto-mono-fonts \
    variety

gsettings set org.gnome.desktop.wm.preferences audible-bell false
gsettings set org.gnome.shell.app-switcher current-workspace-only true
#gsettings set org.gnome.software download-updates false

dconf load /org/gnome/desktop/wm/keybindings/ < gnome/wm-keybindings.dconf.bak
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < gnome/media-keys-keybindings.dconf.bak


