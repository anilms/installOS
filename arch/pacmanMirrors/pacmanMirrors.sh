#!/bin/bash

# https://wiki.archlinux.org/index.php/Mirrors#Ranking_an_existing_mirror_list
# Install pacman-contrib for 'rankmirrors'
# Install reflector
# sudo pacman -S reflector pacman-contrib

# Fetch live mirror list
# curl -s "https://www.archlinux.org/mirrorlist/?country=US&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 -

updatePacmanMirrors()
{
    reflector --country 'United States' --age 24 --protocol https --sort rate -l 40 --save mirrorlist.reflector.txt
    grep 'edu\|org' mirrorlist.reflector.txt > mirrorlist.reflector.trusted.txt
    rankmirrors -n 10 mirrorlist.reflector.trusted.txt > mirrorlist.txt
}

updatePacmanMirrors

# sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
# sudo cp mirrorlist.txt /etc/pacman.d/mirrorlist

