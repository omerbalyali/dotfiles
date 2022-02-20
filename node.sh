#!/usr/bin/env bash

echo '\n'
echo '🟡 Installing NVM and Node LTS:'

# Install NVM
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh)"

# Source NVM to make it available in the current terminal session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node LTS
nvm install --lts --default

# Update npm
npm install -g npm@latest


echo '\n'
echo '🟡 Installing pnpm and global packages:'

# Install pnpm
curl -L https://raw.githubusercontent.com/pnpm/self-installer/master/install.js | node

# Install Typescript
pnpm add --global typescript

# Install Rush
pnpm add --global @microsoft/rush

# Install ESLint
# pnpm add --global eslint

# Install Prettier
# pnpm add --global prettier

echo '\n'
echo '🟢 NVM, Node LTS and pnpm & global packages are installed.'
echo '\n'
