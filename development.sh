# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# Install Node
nvm install node
nvm alias default node
nvm use node

# Update npm
npm install -g npm@latest

# Install pnpm
curl -L https://raw.githubusercontent.com/pnpm/self-installer/master/install.js | node

# Install ESLint
pnpm add --global eslint

# Install Prettier
pnpm add --global prettier
