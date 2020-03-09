#!/usr/bin/env bash

###############################################################################
# App Store apps
###############################################################################

echo "Installing App Store apps ..."

# Mas install function
install () {
	# Check if the App is already installed
	mas list | grep -i "$1" > /dev/null

	if [ "$?" == 0 ]; then
		echo "==> $1 is already installed"
	else
		echo "==> Installing $1..."
		mas search "$1" | { read app_ident app_name ; mas install $app_ident ; }
	fi
}

install "Amphetamine"
install "Irvue"
install "Pages"
install "Keynote"
install "Numbers"
