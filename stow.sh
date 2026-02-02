#!/bin/bash
#
# Symlink dotfiles using GNU Stow
#

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME"
CONFIG_DIR="$HOME/.config"

echo "Stowing dotfiles from: $DOTFILES_DIR"

# Remove conflicting files before stowing
conflicting_files=(
    "$TARGET_DIR/.zshrc"
    "$TARGET_DIR/.zprofile"
    "$TARGET_DIR/.gitconfig"
    "$TARGET_DIR/.gitconfig.personal"
    "$TARGET_DIR/.gitignore_global"
    "$CONFIG_DIR/starship.toml"
)

for file in "${conflicting_files[@]}"; do
    if [[ -f "$file" && ! -L "$file" ]]; then
        echo "Removing conflicting file: $file"
        rm "$file"
    fi
done

# Ensure .config directory exists
mkdir -p "$CONFIG_DIR"

# Stow directories to home
echo "Stowing git..."
stow -d "$DOTFILES_DIR" -t "$TARGET_DIR" git

echo "Stowing zsh..."
stow -d "$DOTFILES_DIR" -t "$TARGET_DIR" zsh

# Stow config directory (starship)
echo "Stowing config (starship)..."
stow -d "$DOTFILES_DIR" -t "$CONFIG_DIR" config

echo "✓ Dotfiles stowed successfully"
