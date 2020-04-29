  #!/usr/bin/env bash

###############################################################################
# Shells
###############################################################################

echo "Shell settings ..."

# Add shells installed by Homebrew
sudo bash -c "which fish bash >> /etc/shells"

# Set default shell for the current user
chsh -s $(which fish)

# Install oh-my-fish
curl -L https://get.oh-my.fish | fish