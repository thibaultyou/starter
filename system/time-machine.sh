#!/usr/bin/env bash

###############################################################################
# Time Machine
###############################################################################

echo "Updating Time Machine settings ..."

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
