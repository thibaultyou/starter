#!/usr/bin/env bash

###############################################################################
# Finder
###############################################################################

# Show list view by default
defaults write com.apple.finder FXPreferredViewStyle -string “Nlsv”

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show files extensions
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Avoid .DS_STORE creation
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles -bool true
