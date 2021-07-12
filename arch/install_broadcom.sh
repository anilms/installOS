#!/bin/bash

sudo pacman -S linux-lts-headers
sudo pacman -S broadcom-wl-dkms

sudo rmmod b43 b43legacy bcm43xx bcma brcm80211 brcmfmac brcmsmac ssb wl
sudo modprobe wl

