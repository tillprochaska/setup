#!/usr/bin/env bash

echo "In order to apply certain settings, you need to temporarily (!)" \
	"grant full disk access permission to the shell you’re running this script in."

read -p "Press any key to continue."


# Ask for the administrator password upfront
sudo -v


# Install packages, casks and apps from App Store
brew bundle --file ./dotfiles/Brewfile


# Set default shell
shell_path=$(which fish)

echo $shell_path | sudo tee -a /etc/shells > /dev/null
chsh -s $shell_path


# Apply macOS and application settings
./scripts/macos.sh


# Copy Sublime Text preferences
cp ./dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings


echo "🚨🚨🚨 Do not forget to reset full disk access permission! 🚨🚨🚨"