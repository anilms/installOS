#!/bin/bash

# Update
./install_1_update.sh

# Common packages chromium, vim, gvim etc
./install_2_extra.sh

# Gnome specific packages
./install_3_themes_gnome.sh

# Development related packages
./install_5_devel.sh

# RPM Fusion and NVIDIA driver
./install_5_rpmfusion.sh

# NVIDIA driver
#./install_nvidia.sh

# Broadcom driver
#./install_broadcom.sh


