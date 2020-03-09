#!/usr/bin/env bash

###############################################################################
# Sharing
###############################################################################

echo "Updating sharing settings ..."

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName " "
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server \
    NetBIOSName -string " "
