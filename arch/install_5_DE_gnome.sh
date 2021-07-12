#!/bin/bash

pacman -S \
    gnome


# Enable services
systemctl enable gdm.service

