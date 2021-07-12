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
brew install postgresql
# brew install ssh-copy-id
brew install stow
# brew install sqlite
brew install tree
# brew install zsh # Already installed and default shell in macOS 11

# zsh plugin dependencies
brew install autojump
brew install fzf


# Tap Casks
brew tap homebrew/cask

# Cask Apps
brew install --cask 1password
brew install --cask adobe-creative-cloud
brew install --cask alfred
brew install --cask appcleaner
brew install --cask carbon-copy-cloner
brew install --cask docker
brew install --cask expressvpn
brew install --cask homebrew/cask-versions/firefox-nightly 
brew install --cask google-chrome
brew install --cask homebrew/cask-versions/google-chrome-canary 
# brew install --cask google-drive
brew install --cask iina
brew install --cask insomnia
brew install --cask istat-menus
brew install --cask iterm2
brew install --cask jettison
brew install --cask keka
brew install --cask little-snitch
brew install --cask monitorcontrol
brew install --cask pgadmin4
# brew install --cask postman
# brew install --cask sourcetree
brew install --cask sip
brew install --cask spotify
brew install --cask visual-studio-code

# Cleanup Brew
brew cleanup

# Check integrity
brew doctor
