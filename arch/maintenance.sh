#!/bin/bash

exit 0

# Arch Wiki
# https://wiki.archlinux.org/index.php/System_maintenance

# Check for systemd fails
systemctl --failed

# Check journal logs
sudo journalctl -p 3 -xb

# Check for updates
sudo pacman -Syu
yay -Syu

# Clean cache
sudo pacman -Sc
yay -Sc

# Optional clean cache (only for small drives)
# sudo pacman -Scc
# yay -Scc

# Unwanted dependencies
# yay -Yc


# Orphaned packages
pacman -Qtdq

# Remove orphaned packages
sudo pacman -Rns $(pacman -Qtdq)

# Cleaning up directories that might fill up
# Check .config and .cache

# Remove old logs
sudo journalctl --vacuum-time=2weeks

# Update reflector
sudo reflector -c "United States" -a 6 --sort rate --save /etc/pacman.d/mirrorlist

