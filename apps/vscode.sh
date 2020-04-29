#!/usr/bin/env bash

###############################################################################
# Visual Studio Code
###############################################################################

echo "Updating VSCode settings ..."

# Install setting-sync extension
code --install-extension shan.code-settings-sync

# Download backup
echo ''
echo 'To download your VSCode settings :'
echo "  type 'code' in a terminal then :"
echo "  cmd + P > Sync: Download Settings"
echo ''