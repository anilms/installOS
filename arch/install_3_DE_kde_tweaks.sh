#!/bin/bash

sudo cp kde/sddm.theme.conf /etc/sddm.conf.d/

sudo pacman -S \
    kvantum-qt5 \
    appmenu-gtk-module \
    glib2 \
    libdbusmenu-glib \
    --noconfirm --needed

