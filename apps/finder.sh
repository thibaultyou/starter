#!/usr/bin/env bash

###############################################################################
# Finder
###############################################################################

echo "Updating Finder settings ..."

# Show user `Library` folder
chflags nohidden "${HOME}/Library"

# Create user `bin` directory
mkdir -p "$HOME/bin"

# Hide user `bin` folder
chflags -h hidden "${HOME}/bin"

# Window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Prefer tabs when opening documents: 'always', 'fullscreen', 'manual'
defaults write NSGlobalDomain AppleWindowTabbingMode -string 'manual'

# Icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop         -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop     -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop     -bool false

# Visibility of hidden files
defaults write com.apple.finder AppleShowAllFiles -bool false

# Filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Path bar
defaults write com.apple.finder ShowPathbar -bool true

# Text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Full POSIX path as window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

# Search scope
# This Mac       : `SCev`
# Current Folder : `SCcf`
# Previous Scope : `SCsp`
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# File extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Arrange by
# Kind, Name, Application, Date Last Opened,
# Date Added, Date Modified, Date Created, Size, Tags, None
defaults write com.apple.finder FXPreferredGroupBy -string "Name"

# Spring loaded directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Delay for spring loaded directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0.1

# Writing of .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disk image verification
defaults write com.apple.frameworks.diskimages skip-verify        -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool false
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool false
defaults write com.apple.finder OpenWindowForNewRemovableDisk    -bool false

# Preferred view style
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# New window target
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget -string 'PfHm'

# Warning before emptying Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely
defaults write com.apple.finder EmptyTrashSecurely -bool false

# AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Desktop Enabled
defaults write com.apple.finder CreateDesktop -bool true

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true
