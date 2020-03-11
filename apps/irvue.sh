#!/usr/bin/env bash

###############################################################################
# Irvue
###############################################################################

# Init Irvue
defaults write com.leonspok.osx.Irvue Initialized -bool true

# Launch at startup
defaults write com.leonspok.osx.Irvue LaunchAtStartupEnabled -bool true

# Set update interval
defaults write com.leonspok.osx.Irvue UpdateInterval -int 1800
