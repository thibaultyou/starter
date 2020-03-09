#!/usr/bin/env bash

###############################################################################
# Mac App Store
###############################################################################

echo "Updating Mac App Store settings ..."

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true
