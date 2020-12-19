#!/usr/bin/env bash

echo 'Checking Homebrew installation...'

#which -s brew
#if [[ $? != 0 ]] ; then
#  echo "No installation found. Installing Homebrew..."
  # Install Homebrew
#  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#else
 # echo "Homebrew is already installed, moving on..."
#fi

# Update to latest Homebrew
  brew update

# Upgrade all formulae
brew upgrade

# Homebrew installation location
BREW_LOCATION=$(brew --prefix)

# Install GNU Core Utils
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Binaries
# brew install ffmpeg
brew install dockutil
brew install git
brew install mas
# brew install openssl
# brew install postgresql
# brew install ssh-copy-id
brew install stow
# brew install sqlite
# brew install zsh

# zsh plugin dependencies
brew install autojump
brew install fzf


# Tap Casks
brew tap homebrew/cask

# Cask Apps
brew install 1password
brew install alfred
brew install appcleaner
brew install carbon-copy-cloner
# brew install docker
brew install expressvpn
# brew install homebrew/cask-versions/firefox-nightly 
brew install google-chrome
# brew install homebrew/cask-versions/google-chrome-canary 
# brew install google-drive
brew install iina
# brew install insomnia
brew install istat-menus
brew install iterm2
brew install jettison
brew install keka
brew install little-snitch
brew install monitorcontrol
# brew install pgadmin4
# brew install postman
# brew install sourcetree
brew install spotify
brew install visual-studio-code

# Cleanup Brew
brew cleanup

# Check integrity
brew doctor
