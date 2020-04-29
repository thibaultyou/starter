#!/usr/bin/env bash

echo "Generating SSH and GPG keys ..."

# Generate SSH key
ssh-keygen -t rsa -b 4096

# Print SSH key
# cat ~/.ssh/id_rsa.pub

# Generate GPG key
gpg --full-gen-key

# Print the GPG keys
# gpg --list-secret-keys --keyid-format LONG

# Export GPG key
# gpg --armor --export <KEY_ID>
