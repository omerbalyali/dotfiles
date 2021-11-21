#!/usr/bin/env bash

# --------
echo 'Oh-My-ZSH and Spaceship prompt is intalling...'

# ZSH

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Spaceship Theme/Prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Change shell to ZSH
# chsh -s $(which zsh)


# --------
echo 'Stowing dotfiles'

# Stow .dotfiles
stow git
stow npm
stow prettier
stow zsh


echo 'Installing NVM and Node LTS'

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Node LTS
nvm install --lts
nvm alias default 'lts/*'
nvm use default

# Update npm
npm install -g npm@latest


# --------
echo 'Installing pnpm and global packages'

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



