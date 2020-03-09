#!/usr/bin/env bash

###############################################################################
# Keyboard
###############################################################################

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set key repeat rate (minimum 1)
# Off: 300000
# Slow: 120
# Fast: 2
defaults write NSGlobalDomain KeyRepeat -int 1

# Set delay until repeat (in milliseconds)
# Long: 120
# Short: 15
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Adjust keyboard brightness in low light
defaults write com.apple.BezelServices kDim -bool true
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool true

# Dim keyboard after idle time (in seconds)
defaults write com.apple.BezelServices kDimTime -int 300
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Keyboard Dim Time" -int 300

# Full Keyboard Access
# In windows and dialogs, press Tab to move keyboard focus between:
# 1 : Text boxes and lists only
# 3 : All controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Use F1, F2, etc. keys as standard function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool false

# Use smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Set Double and Single quotes
defaults write NSGlobalDomain NSUserQuotesArray -array '"\""' '"\""' '"'\''"' '"'\''"'

# Use smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
#defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Adjust blinking cursor speed
defaults write -g NSTextInsertionPointBlinkPeriodOn -float 300
defaults write -g NSTextInsertionPointBlinkPeriodOff -float 200

# Dictation
###############################################################################

# Enable Dictation
defaults write com.apple.assistant.support "Dictation Enabled" -bool true
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
  DictationIMMasterDictationEnabled -bool true
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \ DictationIMIntroMessagePresented -bool true

# Use Enhanced Dictation
# Allows offline use and continuous dictation with live feedback
if [ -d '/System/Library/Speech/Recognizers/SpeechRecognitionCoreLanguages/fr_FR.SpeechRecognition' ]; then
  defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
     DictationIMPresentedOfflineUpgradeSuggestion -bool true
  defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
    DictationIMSIFolderWasUpdated -bool true
  defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
    DictationIMUseOnlyOfflineDictation -bool true
fi
