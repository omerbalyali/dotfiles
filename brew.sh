#!/usr/bin/env bash

echo 'Checking Homebrew installation...'

which -s brew
if [[ $? != 0 ]] ; then
  echo "No installation found. Installing Homebrew..."
  # Install Homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed, updating Homebrew..."
# Update to latest Homebrew
  brew update
fi

# Upgrade all formulae
brew upgrade

# Homebrew installation location
BREW_LOCATION=$(brew --prefix)

# Install GNU Core Utils
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Binaries
brew install ffmpeg
brew install git
brew install openssl
brew install postgresql
brew install ssh-copy-id
brew install sqlite

# Tap Casks
brew tap caskroom/cask

# Cask Apps
brew install 1password
brew install alfred@3
brew install appcleaner
brew install carbon-copy-cloner
brew install docker
brew install expressvpn
brew install homebrew/cask-versions/firefox-nightly 
brew install google-chrome
brew install homebrew/cask-versions/google-chrome-canary 
brew install google-drive
brew install iawriter
brew install iina
brew install insomnia
brew install istat-menus
brew install iterm2
brew install jettison
brew install keka
brew install little-snitch
brew install monitorcontrol
brew install pgadmin4
brew install postman
brew install sourcetree
brew install spotify
brew install qbittorrent
brew install visual-studio-code


# Cleanup Brew
brew cleanup

# Check integrity
brew doctor