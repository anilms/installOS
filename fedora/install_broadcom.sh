#!/bin/bash

sudo dnf install \
    broadcom-wl

sudo rmmod b43 b43legacy bcm43xx bcma brcm80211 brcmfmac brcmsmac ssb wl
sudo modprobe wl

