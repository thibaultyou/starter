#!/usr/bin/env bash

###############################################################################
# Accessibility
###############################################################################

echo "Updating accessibility settings ..."

# Enable access for assistive devices
echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled &>/dev/null
sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled

## Display

# Shake mouse cursor to locate
defaults write CGDisableCursorLocationMagnification -bool true

## Zoom

# Zoom using scroll gesture with the Ctrl (^) modifier key
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Smooth Zoomed Images
defaults write com.apple.universalaccess closeViewSmoothImages -bool true

# Zoom Style
# 0 : Fullscreen
# 1 : Picture-in-picture
defaults write com.apple.universalaccess closeViewZoomMode -int 1

## Speech

# Enable Text to Speech
defaults write com.apple.speech.synthesis.general.prefs SpokenUIUseSpeakingHotKeyFlag -bool true

# Speak selected text when the key is pressed
# Option+Esc : 2101
defaults write com.apple.speech.synthesis.general.prefs SpokenUIUseSpeakingHotKeyCombo -int 2101

## Voices

defaults write com.apple.speech.voice.prefs VisibleIdentifiers \
  '{ "com.apple.speech.synthesis.voice.audrey.premium" = 2; }'
defaults write com.apple.speech.voice.prefs SelectedVoiceCreator -int 1886745202
defaults write com.apple.speech.voice.prefs SelectedVoiceID -int 251668765
defaults write com.apple.speech.voice.prefs SelectedVoiceName -string "Aurelie"

# Speaking Rate
# Set as a multidimensional array:
#   The 1st value is the SelectedVoiceCreator
#   The 2nd value is the SelectedVoiceID
#   The 3rd value is the speaking rate
# Slow   : 90
# Normal : 175
# Fast   : 350
plutil -replace VoiceRateDataArray -json '[
  [
    1886745202,
    251668765,
    350
  ]
]' ~/Library/Preferences/com.apple.speech.voice.prefs.plist
