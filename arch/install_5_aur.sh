#!/bin/bash

# https://wiki.archlinux.org/index.php/Arch_User_Repository
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si \
    --noconfirm --needed

yay -S \
    google-chrome \
    visual-studio-code-bin \
    --noconfirm --needed
