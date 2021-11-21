#!/usr/bin/env bash

echo 'Oh-My-ZSH and Spaceship prompt is intalling...'

# --------
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


echo 'Stowing dotfiles'

# --------
# Stow .dotfiles
stow git
stow npm
stow prettier
stow zsh


echo 'Installing apps from Mac App Store'

# --------
# Mas - https://github.com/mas-cli/mas

# Magnet App (Window Manager)
mas install 441258766

# iA writer
mas install 775737590