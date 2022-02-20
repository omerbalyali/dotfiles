#!/usr/bin/env bash

# Mas - https://github.com/mas-cli/mas
echo '\n'
echo '🟡 Installing Apps from Mac App Store:'
echo '\n'

if $extras
then
  # XCode
  mas install 497799835
fi

# Swift Playgrounds
# mas install 1496833156

# Apple Developer
# mas install 640199958

# TestFlight
# mas install 899247664

# Magnet App (Window Manager)
mas install 441258766

# iA writer
mas install 775737590


echo '\n'
echo '🟢 App Store Apps are installed.'
echo '\n'