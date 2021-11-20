# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Node LTS
nvm install --lts
nvm alias default 'lts/*'
nvm use default

# Update npm
npm install -g npm@latest

# Install pnpm
curl -L https://raw.githubusercontent.com/pnpm/self-installer/master/install.js | node

# Install Rush
pnpm add --global @microsoft/rush

# Install Rush
pnpm add --global typescript

# Install ESLint
# pnpm add --global eslint

# Install Prettier
# pnpm add --global prettier



