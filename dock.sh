#!/usr/bin/env bash

echo '\n'
echo '🟡 Organizing dock items (starting with removing each item, except Finder):'

# Remove everything, except Finder from Dock
dockutil --remove all

echo '\n'
echo '🟡 Adding new dock items:'

dockutil --add '/System/Applications/Calendar.app'
dockutil --add '/Applications/Google Chrome.app'
dockutil --add '/Applications/Firefox Nightly.app'
dockutil --add '/Applications/Adobe Illustrator 2022/Adobe Illustrator.app'
dockutil --add '/Applications/Adobe InDesign 2022/Adobe InDesign 2022.app'
dockutil --add '/Applications/Visual Studio Code.app'
if $music
then
  dockutil --add '/Applications/Bitwig Studio.app'
fi
dockutil --add '/Applications/Spotify.app'
if $music
then
  dockutil --add '/Applications/Focusrite Control.app'
fi
dockutil --add '/Applications/Visual Studio Code.app' --replacing 'Visual Studio Code'
dockutil --add '/Applications/iA Writer.app'
dockutil --add '/System/Applications/Notes.app'
dockutil --add '/Applications/iTerm.app'
dockutil --add '/System/Applications/System Preferences.app'

dockutil --add '/Applications/' --view list --display folder --sort name
if $personalized
then
  dockutil --add '/Volumes/Alpha/Folders' --view list --display folder --sort name
fi

echo '\n'
echo '🟢 Dock items added.'
echo '\n'