# Starter

Take the monotony out of macOS system setup.

When configuring a new Mac, or when performing a clean installation of macOS, there are a number of setup tasks that may be automated, including:

- The installation of 3rd party applications.
- The installation of command line tools.
- Configuration of system and application preferences.

Starter allows users to configure these settings prior to installation, and create reproducible macOS environments.

## Installation

Log into the App Store with Apple account:

    open -a /Applications/App\ Store.app

Simply clone the repository, `cd` into the local `starter` repository and then:

    source install.sh

To configure the various system and application preferences:

    source starter.sh

To generate SSH and GPG keys:

    source keys.sh

## Tools

Starter uses Homebrew and Cask to install 3rd party applications.

While Starter will install these tools prior to launch, it is recommended that any 'dotfiles' that may affect the configuration of these tools be installed prior to initializing Starter.
