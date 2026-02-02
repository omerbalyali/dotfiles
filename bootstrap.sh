#!/bin/bash
#
# Bootstrap script for fresh macOS setup
# Run: ./bootstrap.sh
#

set -e

echo "🚀 Starting dotfiles bootstrap..."
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_step() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# -----------------------------------------------------------------------------
# 1. macOS Updates
# -----------------------------------------------------------------------------
print_step "Checking for macOS updates..."

if softwareupdate -l 2>&1 | grep -q "No new software available"; then
    print_success "macOS is up to date"
else
    print_warning "Updates available. Install with: sudo softwareupdate -i -a"
fi

# -----------------------------------------------------------------------------
# 2. Xcode Command Line Tools
# -----------------------------------------------------------------------------
print_step "Checking Xcode Command Line Tools..."

if xcode-select -p &>/dev/null; then
    print_success "Xcode CLI tools already installed"
else
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install

    # Wait for installation
    echo "Waiting for Xcode CLI tools installation..."
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
    print_success "Xcode CLI tools installed"
fi

# -----------------------------------------------------------------------------
# 3. Homebrew
# -----------------------------------------------------------------------------
print_step "Checking Homebrew..."

if command -v brew &>/dev/null; then
    print_success "Homebrew already installed"
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for this session (Apple Silicon)
    eval "$(/opt/homebrew/bin/brew shellenv)"
    print_success "Homebrew installed"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update
print_success "Homebrew updated"

# -----------------------------------------------------------------------------
# 4. Install packages from Brewfile
# -----------------------------------------------------------------------------
print_step "Installing packages from Brewfile..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export HOMEBREW_BUNDLE_FILE="$DOTFILES_DIR/Brewfile"

brew bundle --file="$DOTFILES_DIR/Brewfile"
print_success "Brewfile packages installed"

# -----------------------------------------------------------------------------
# 5. Create necessary directories
# -----------------------------------------------------------------------------
print_step "Creating directories..."

mkdir -p ~/.config
mkdir -p ~/Development
mkdir -p ~/Development/Personal
mkdir -p ~/Development/Work

print_success "Directories created"

# -----------------------------------------------------------------------------
# 6. Stow dotfiles
# -----------------------------------------------------------------------------
print_step "Symlinking dotfiles with stow..."

source "$DOTFILES_DIR/stow.sh"
print_success "Dotfiles symlinked"

# -----------------------------------------------------------------------------
# 7. Setup fnm (Fast Node Manager)
# -----------------------------------------------------------------------------
print_step "Setting up fnm..."

if command -v fnm &>/dev/null; then
    # Install latest LTS Node.js
    if ! fnm list | grep -q "lts"; then
        echo "Installing Node.js LTS..."
        fnm install --lts
        fnm default lts-latest
        print_success "Node.js LTS installed"
    else
        print_success "Node.js already installed via fnm"
    fi
fi

# -----------------------------------------------------------------------------
# 8. Setup fzf key bindings
# -----------------------------------------------------------------------------
print_step "Setting up fzf..."

if [[ -f "$(brew --prefix)/opt/fzf/install" ]]; then
    # Install fzf key bindings and fuzzy completion (non-interactive)
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc --no-bash --no-fish
    print_success "fzf configured"
fi

# -----------------------------------------------------------------------------
# 9. Restore pnpm global packages
# -----------------------------------------------------------------------------
print_step "Checking pnpm global packages..."

if [[ -f "$DOTFILES_DIR/pnpm-globals.txt" ]] && command -v pnpm &>/dev/null; then
    echo "Restoring pnpm global packages..."
    while IFS= read -r package; do
        [[ -z "$package" || "$package" =~ ^# ]] && continue
        pnpm add -g "$package" 2>/dev/null || true
    done < "$DOTFILES_DIR/pnpm-globals.txt"
    print_success "pnpm globals restored"
else
    print_warning "No pnpm-globals.txt found or pnpm not installed"
fi

# -----------------------------------------------------------------------------
# 10. Set Zsh as default shell
# -----------------------------------------------------------------------------
print_step "Checking default shell..."

if [[ "$SHELL" != *"zsh"* ]]; then
    echo "Setting Zsh as default shell..."
    chsh -s $(which zsh)
    print_success "Zsh set as default shell"
else
    print_success "Zsh is already default shell"
fi

# -----------------------------------------------------------------------------
# Done!
# -----------------------------------------------------------------------------
echo ""
echo -e "${GREEN}✨ Bootstrap complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal (or run: source ~/.zshrc)"
echo "  2. Set up SSH keys (see README.md)"
echo "  3. Configure Git signing in 1Password"
echo "  4. Try Warp terminal: open -a Warp"
echo ""
echo "Useful commands:"
echo "  z <dir>       - Smart directory jump"
echo "  ctrl+r        - Fuzzy search history"
echo "  fnm use 20    - Switch Node version"
echo ""
