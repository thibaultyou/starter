#!/usr/bin/env bash

###############################################################################
# Other
###############################################################################

# Menu bar: hide the Time Machine, Volume, User, and Bluetooth icons
defaults -currentHost write dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu"
defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/VPN.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/Displays.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu" \
    "/System/Library/CoreServices/Menu Extras/TextInput.menu"

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Opening and closing speed of Quick Look windows
defaults write NSGlobalDomain QLPanelAnimationDuration -float 0

# Opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Disable animated focus ring
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Display ASCII control characters using caret notation in standard text views
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Screenshot location
defaults write com.apple.screencapture location -string "$HOME/Pictures"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Include date in screenshots
defaults write com.apple.screencapture include-date -bool true

# Base name of screenshots
defaults write com.apple.screencapture name -string "screen"

# Connecting camera opens (path to application, or '' if no application)
defaults -currentHost write com.apple.ImageCapture2 HotPlugActionPath -string ''

# Link hidden applications
for app in /System/Library/CoreServices/Applications/* \
           /Applications/Xcode.app/Contents/Applications/* \
           /Applications/Xcode.app/Contents/Developer/Applications/*; do
  sudo ln -s "$app" /Applications/Utilities/
done

hidden_apps=(
  'Network Diagnostics'
)

for app in "${hidden_apps[@]}"; do
  sudo ln -s "/System/Library/CoreServices/${app}.app" \
             "/Applications/Utilities/${app}.app"
done

# Link hidden prefPanes
sudo ln -s '/System/Library/CoreServices/Applications/Archive Utility.app/Contents/Resources/Archives.prefPane' \
           '/Library/PreferencePanes/Archives.prefPane'

# Link hidden command line tools
sudo ln -s '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport' \
           '/usr/local/bin/airport'
sudo ln -s '/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc' \
           '/usr/local/bin/jsc'

# Link hidden fonts
sudo ln -s /System/Library/PrivateFrameworks/CoreRecognition.framework/Resources/Fonts/ \
  /Library/Fonts/CoreRecognition

# Enable Folder Actions
defaults write com.apple.FolderActionsDispatcher folderActionsEnabled -bool false

# Enable locate command and build locate database
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

###############################################################################
# Default Applications
###############################################################################

if [ -x "/usr/local/bin/duti" && "${HOME}/.duti"]; then
  /usr/local/bin/duti "${HOME}/.duti"
fi

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
