#!/usr/bin/env bash

###############################################################################
# Desktop & Screen Saver
###############################################################################

echo "Updating screen saver settings ..."

# Start after begin idle for time (in seconds)
defaults -currentHost write com.apple.screensaver idleTime -int 300

# Set Flurry as screensaver
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Flurry path /System/Library/Screen\ Savers/Flurry.saver type 0

# Show with clock
defaults -currentHost write com.apple.screensaver showClock -bool true

# Change default screensaver password delay options
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0