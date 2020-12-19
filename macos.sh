#!/usr/bin/env bash

echo 'New macOS environment is being initialized...'

# --------
# Software Update & Dev Tools

# Update macOS to latest minor version
sudo softwareupdate -i -r

# Install macOS Command Line Tools
xcode-select --install


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


# --------
# Stow .dotfiles
stow git
stow npm
stow prettier
stow zsh


# --------
# Mas - https://github.com/mas-cli/mas

# Magnet App (Window Manager)
mas install 441258766

# iA writer
mas install 775737590


# --------
# Install Fonts




# Post-install
echo '🤖 Download Focusrite MixControl software 3.9 for Mac from https://focusrite.com/en'