#!/usr/bin/env bash

echo '\n'
echo '🟡 Initializing rbenv:'

rbenv init
eval "$(rbenv init - zsh)"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash

echo '\n'
echo '🟡 Installing Ruby:'

rbenv install 3.1.1
rbenv global 3.1.1

echo '\n'
echo '🟢 Ruby environment is ready.'
echo '\n'