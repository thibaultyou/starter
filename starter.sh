#!/usr/bin/env bash

echo "Applying system settings ..."

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## .gitignore
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore -o ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Set global variables
PREF_FILES=()
AFFECTED_APPS=()

# Source lib tools
source 'lib/loginitem.sh'

# Add preference file followed by any number of affected applications
function set_prefs {
  PREF_FILES+=("apps/$1.sh")
  shift
  AFFECTED_APPS+=("$@")
}

# Sources all the preference files
function source_prefs {
  for file in "${PREF_FILES[@]}"; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
  done
}

# Check for open application
function get_open_affected_apps {
  open_apps=()

  # Store the open apps in an array
  for app in "${AFFECTED_APPS[@]}"; do
    (( $(osascript -e "tell app \"System Events\" to count processes whose name is \"${app}\"") > 0 )) \
    && open_apps+=("$app")
  done

  echo "The following open applications will be affected:"

  # Print the open apps in columns
  printf -- '%s\n' "${open_apps[@]}" | column -x

  echo "Would you like to quit these apps now? [Y/n] "
}

# Quit affected applications
function quit_apps {
  for app in "${AFFECTED_APPS[@]}"; do
    case "$app" in
      'Quick Look')
        # Restart Quick Look
        qlmanage -r
        ;;
      *)
        killall "$app" &>/dev/null
        ;;
    esac
  done
}

# Prompt if user wants to restart the machine
function prompt_restart {
  echo "Done. Note that some of these changes require a logout/restart to take effect."
  read -p "Would you like to restart the computer now? [Y/n] " -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
      osascript -e 'tell app "System Events" to restart'
  fi
}

# System preferences
system_preferences=(
  accessibility
  app-store
  dashboard
  date-time
  desktop
  desktop-screen-saver
  displays
  dock
  energy-saver
  general
  keyboard
  language-region
  mission-control
  network
  notifications
  other
  pbs
  printers-scanners
  security-privacy
  sharing
  siri
  sound
  spotlight
  time-machine
  trackpad
  users-groups
)

for pane in "${system_preferences[@]}"; do
  PREF_FILES+=("system/${pane}.sh")
done

for pane in "cfprefsd" "SystemUIServer" "Finder" "Dock" "SpeechSynthesisServer"; do
  AFFECTED_APPS+=("$pane")
done

# Apps preferences
set_prefs app-store "App Store"
set_prefs finder "Finder"
set_prefs transmission "Transmission"
set_prefs irvue "Irvue"
set_prefs vscode "Visual Studio Code"

# Run
get_open_affected_apps
source_prefs
quit_apps

prompt_restart
