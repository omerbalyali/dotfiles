#!/usr/bin/env bash

# --------
echo '🟡 Installing Homebrew:'
echo '\n'

which -s brew
if [[ $? != 0 ]] ; then
  echo '🔵 No Homebrew installation found. Installing now...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo '\n'
  echo '🟢 Homebrew is already installed, moving on...'
fi

echo '\n'
echo '🟡 Updating Homebrew:'

# Update to latest Homebrew
brew update

# Upgrade all formulae
brew upgrade

# Homebrew installation location
BREW_LOCATION=$(brew --prefix)

echo '\n'
echo '🟡 Installing GNU Core Utils:'
echo '\n'

# Install GNU Core Utils
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

echo '\n'
echo '🟡 Installing other binaries:'
echo '\n'

brew install \
  ack \
  bat \
  dockutil \
  ffmpeg \
  fzf \
  git \
  mas \
  postgresql \
  rbenv \
  ruby-build \
  stow \
  tree

echo '\n'
echo '🟡 Installing zsh dependencies:'
echo '\n'

brew install \
  autojump \
# fzf

echo '\n'
echo '🟡 Tapping Casks:'
echo '\n'

brew tap homebrew/cask
brew tap homebrew/cask-drivers

echo '\n'
echo '🟡 Installing Apps (casks):'
echo '\n'

brew install --cask \
  1password \
  adobe-creative-cloud \
  appcleaner \
  expressvpn \
  homebrew/cask-versions/firefox-nightly \
  google-chrome \
  iina \
  iterm2 \
  keka \
  little-snitch \
  monitorcontrol \
  raycast \
  sip \
  spotify \
  visual-studio-code

if $extras
then
  echo "echo '🟡 Installing Extra Apps:'"
fi

if $music
then
  echo "echo '🟡 Installing Music Apps:'"
  brew install --cask \
    bitwig-studio \
    ilok-license-manager
fi

if $personalized
then
  echo "echo '🟡 Installing Personalized Apps:'"
  brew install --cask \
    carbon-copy-cloner \
    discord \
    focusrite-control \
    istat-menus \
    jettison \
fi

echo '\n'
echo '🟡 Cleaning up:'
brew cleanup 

echo '\n'
echo '🟡 Checking integrity:'
brew doctor


echo '\n'
echo '🟢 Homebrew & Apps are installed.'
echo '\n'