#!/usr/bin/env bash

###############################################################################
# Node
###############################################################################

# Node and yarn *should* be installed at this point
hash node 2>/dev/null || echo "Please install node before continuing"
hash npm 2>/dev/null || echo "Please install npm before continuing"

# Update npm
npm update -g npm

# Install Node packages
node_packages=(
  typescript
)

# Loop through each package individally because
# any errors will stop all installations
for package in "${node_packages[@]}"; do
  npm install -g "$package"
done
