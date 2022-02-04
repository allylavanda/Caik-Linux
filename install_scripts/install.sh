#!/bin/bash
# Copyright (c) 2022 Sjaeledyr

# Hostname of the installed machine.
HOSTNAME='caik'

# Root password (leave blank to be prompted).
ROOT_PASSWORD='a'

# USER
USER_NAME='user'

# PASS
USER_PASSWORD='a'

# System timezone.
TIMEZONE='America/New_York'

# Have /tmp on a tmpfs or not.  Leave blank to disable.
# Only leave this blank on systems with very little RAM.
TMP_ON_TMPFS='TRUE'

KEYMAP='us'

# Choose your video driver
# For Intel
#VIDEO_DRIVER="i915"
# For nVidia
VIDEO_DRIVER="nouveau"
# For ATI
#VIDEO_DRIVER="radeon"
# For generic stuff
#VIDEO_DRIVER="vesa"

# Wireless device, leave blank to not use wireless and use DHCP instead.
WIRELESS_DEVICE="wlan0"
# For tc4200's
#WIRELESS_DEVICE="eth1"

install() {
    echo 'Starting Caik-Linux install script.'
  
    echo 'Partitioning Drive.'
    part_drive "$DRIVE"
}

part_drive() {
    parted -s \
        mklabel msdos \
        mkpart primary ext2 1 100M\
        mkpart primary ext2 100M 100%\
        set 1 boot on \
        set 2 LVM on
}
