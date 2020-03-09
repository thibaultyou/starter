#!/usr/bin/env bash

###############################################################################
# Security & Privacy
###############################################################################

echo "Updating security and privacy settings ..."

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable automatic login
sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser &> /dev/null

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Allow applications downloaded from anywhere
sudo spctl --master-disable

# Turn on Firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Allow signed apps
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool true

# Firewall logging
sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool false

# Stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

# Disable Infared Remote
sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -bool false

###############################################################################
# FileVault
###############################################################################

# Enable FileVault
if [[ $(sudo fdesetup status | head -1) == "FileVault is Off." ]]; then
  sudo fdesetup enable -user `whoami`
fi
