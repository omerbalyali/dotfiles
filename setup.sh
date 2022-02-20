#!/usr/bin/env bash
echo '▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼ ▼'
echo 'New macOS Monterey environment is being initialized...'
echo '\n'

extras=false
music=false
personalized=false

while [ "${1:-}" != "" ]; do
  case "$1" in
    "-e" | "--extras")
      extras=true
      ;;
    "-m" | "--music")
      music=true
      ;;
    "-p" | "--personalized")
      personalized=true
      ;;
  esac
shift
done

# Prepare the system
source prepare.sh

# Install homebrew and apps
source brew.sh

# Install App Store Apps
source appstore.sh

# Stow dotfiles/configs
source stow.sh

# Install zsh plugins
source zsh.sh

# Install Node environment
source node.sh

# Install Node environment
source dock.sh

echo '▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ ▲ '