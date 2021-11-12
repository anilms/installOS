#!/bin/bash

# https://wiki.archlinux.org/title/swap
sudo dd if=/dev/zero of=/swapfile bs=1M count=8192 status=progress
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

echo "add: '/swapfile none swap defaults 0 0' to /etc/fstab"

