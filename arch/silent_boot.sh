#!/bin/bash

exit 0

# =============================================================================
# Edit kernel parameters in
# /boot/loader/entries/arch.conf
# quiet vga=current

# If the above doesnt work, try
# quiet loglevel=3 vga=current
# or
# quiet loglevel=3 rd.systemd.show_status=auto rd.udev.log_priority=3


# To disable cursor blinking: 
# vt.global_cursor_default=0

# =============================================================================
# To hide fsck messages
# Edit /etc/mkinitcpio.conf
# Replace udev with systemd

# Edit
systemctl edit --full systemd-fsck-root.service
systemctl edit --full systemd-fsck@.service

# To

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/lib/systemd/systemd-fsck
StandardOutput=null
StandardError=journal+console
TimeoutSec=0

