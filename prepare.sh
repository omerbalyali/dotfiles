#!/usr/bin/env bash

echo 'New macOS environment is being initialized...'

# --------
echo 'Updating macOS and installing command-line tools'

# Update macOS to latest minor version
sudo softwareupdate -i -a

# Install macOS Command Line Tools
xcode-select --install