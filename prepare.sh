#!/usr/bin/env bash


# --------
echo '🟡 Installing all new macOS updates (if there is any) and installing command-line tools:'
echo '\n'

# Update macOS to latest minor version
sudo softwareupdate -i -a

# Install macOS Command Line Tools
xcode-select --install

echo '\n'
echo '🟢 macOS is updated, command-line tools are installed.'
echo '\n'