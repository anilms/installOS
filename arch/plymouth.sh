#!/bin/bash

exit 0

# arch.conf
# options root=PARTUUID=0941d65b-ed39-d949-8f9a-7c8218f9ad2a rw quiet splash loglevel=3 vga=current vt.global_cursor_default=0 rd.systemd.show_status=auto rd.udev.log_priority=3

# mkinitcpio.conf
# MODULES=(i915)

# HOOKS=(base systemd sd-plymouth autodetect modconf block filesystems keyboard fsck)

