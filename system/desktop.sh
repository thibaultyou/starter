#!/usr/bin/env bash

###############################################################################
# Desktop
###############################################################################

echo "Updating desktop settings ..."

# Show internal hard drives on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# Show removable media on desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Show external hard drives on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

# Show mounted servers on desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
