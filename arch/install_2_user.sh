#!/bin/bash

# Root password
passwd

# Add User
useradd -m -g users -G wheel -s /bin/bash anil
passwd anil

