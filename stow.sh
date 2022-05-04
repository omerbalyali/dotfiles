#!/usr/bin/env bash

echo '\n'
echo '🟡 Removing default config files:'
rm ~/.zshrc

echo '\n'
echo '🟡 Stowing config files:'
stow git
stow npm
stow prettier
stow zsh
stow vscode


echo '\n'
echo '🟡 Adding shell aliases:'

# if $personalized
# then
#   echo "\n GENERIC_ALIASES=false \n" >> ./zsh/.zshrc
# else
#   echo "\n GENERIC_ALIASES=true \n" >> ./zsh/.zshrc
# fi


echo '\n'
echo '🟢 Config files are stowed/linked.'
echo '\n'