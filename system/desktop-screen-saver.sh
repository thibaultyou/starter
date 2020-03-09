#!/usr/bin/env bash

###############################################################################
# Desktop & Screen Saver
###############################################################################

# Start after begin idle for time (in seconds)
defaults -currentHost write com.apple.screensaver idleTime -int 300

# Show with clock
defaults -currentHost write com.apple.screensaver showClock -bool true

# Change default screensaver password delay options
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
