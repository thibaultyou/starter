#!/usr/bin/env bash

###############################################################################
# Displays
###############################################################################

echo "Updating displays settings ..."

# Automatically adjust brightness
defaults write com.apple.BezelServices dAuto -bool true
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool true

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# Show mirroring options in the menu bar when available
defaults write com.apple.airplay showInMenuBarIfPresent -bool true
