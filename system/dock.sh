#!/usr/bin/env bash

###############################################################################
# Dock
###############################################################################

echo "Updating Dock settings ..."

# Icon size of Dock items
defaults write com.apple.dock tilesize -int 38

# Lock the Dock size
defaults write com.apple.dock size-immutable -bool true

# No icons bouncing
defaults write com.apple.dock no-bouncing -bool true

# Remove all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Dock magnification
defaults write com.apple.dock magnification -bool true

# Icon size of magnified Dock items
defaults write com.apple.dock largesize -int 72

# Minimization effect: 'genie', 'scale', 'suck'
defaults write com.apple.dock mineffect -string 'scale'

# Disable recent items in Dock
defaults write com.apple.dock show-recents -bool false

# Prefer tabs when opening documents: 'always', 'fullscreen', 'manual'
defaults write NSGlobalDomain AppleWindowTabbingMode -string 'always'

# Lock the Dock position
defaults write com.apple.dock position-immutable -bool true

# Double-click a window's title bar to:
# None
# Mimimize
# Maximize (zoom)
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Maximize"

# Minimize to application
defaults write com.apple.dock minimize-to-application -bool false

# Animate opening applications
defaults write com.apple.dock launchanim -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Auto-hide delay
defaults write com.apple.dock autohide-delay -float 0.02

# Auto-hide animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Spring loaded Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Highlight hover effect for the grid view of a stack
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Apple may use this preference to automatically add Launchpad to the Dock
defaults write com.apple.dock 'checked-for-launchpad' -bool false

# Remove all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array
