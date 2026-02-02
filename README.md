# .dotfiles

> macOS development environment for Apple Silicon

A minimal, fast dotfiles setup using Homebrew, GNU Stow, Starship prompt, and vanilla Zsh.

## Status

Last updated: February 2026

## Quick Start

### Fresh Machine Setup

```bash
# Clone the repo
git clone https://github.com/omerbalyali/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run bootstrap (installs everything)
./bootstrap.sh
```

### Existing Machine Update

```bash
cd ~/.dotfiles
brew bundle
./stow.sh
```

---

## What's Included

| Component | Tool | Purpose |
|-----------|------|---------|
| Shell | Zsh (vanilla) | Fast, no framework overhead |
| Prompt | Starship | Git branch, status, fast rendering |
| Package Manager | Homebrew | Apps & CLI tools |
| Dotfile Manager | GNU Stow | Symlink management |
| Node Version | fnm | Fast Node.js version switching |
| Directory Jump | zoxide | Smart cd replacement |
| Fuzzy Finder | fzf | File/history search |
| Terminal | iTerm2 + Warp | Both installed, try Warp |


---

## Directory Structure

```
~/.dotfiles/
├── bootstrap.sh          # One-command fresh setup
├── Brewfile              # Homebrew packages
├── stow.sh               # Symlink management
├── pnpm-globals.txt      # Global pnpm packages list
│
├── git/                  # → ~/.gitconfig, etc.
│   ├── .gitconfig
│   ├── .gitconfig.personal
│   └── .gitignore_global
│
├── zsh/                  # → ~/.zshrc, ~/.zprofile
│   ├── .zshrc
│   └── .zprofile
│
└── config/               # → ~/.config/starship.toml
    └── starship.toml
```

---

## Daily Commands Reference

### Navigation (zoxide)

```bash
z projects      # Jump to ~/projects or most frecent match
z dot           # Jump to ~/.dotfiles
zi              # Interactive selection with fzf
z -            # Go back to previous directory
```

### Fuzzy Finding (fzf)

```bash
# In terminal
ctrl+r          # Search command history
ctrl+t          # Search files in current directory
alt+c           # cd into selected directory

# With other commands
vim $(fzf)      # Open file in vim
cat $(fzf)      # Cat selected file
code $(fzf)     # Open in VS Code
```

### Node.js (fnm)

```bash
fnm list        # List installed versions
fnm install 20  # Install Node 20.x
fnm use 20      # Use Node 20 in current shell
fnm default 20  # Set default version
fnm current     # Show current version
```

### Git Shortcuts (aliases)

```bash
g s             # git status
g a             # git add
g c             # git commit
g sw            # git switch
g b             # git branch
g l             # Pretty log with graph
g lg            # Oneline log with graph
g last          # Show last commit
g unstage       # Unstage files
```

### File Operations

```bash
ll              # Detailed list (eza)
la              # List all including hidden
lt              # Tree view
cat file        # Syntax highlighted (bat)
```

### Homebrew

```bash
brew update     # Update Homebrew
brew upgrade    # Upgrade all packages (formulas only)
brew cu         # Upgrade casks (requires buo/cask-upgrade tap)
brew cu -a      # Upgrade all casks, including auto-update ones
brew cleanup    # Remove old versions
brew bundle dump --force  # Export current packages to Brewfile
brew bundle     # Install from Brewfile
```

### pnpm Global Packages

```bash
pnpm add -g package-name    # Install globally
pnpm-save                   # Save current globals to dotfiles
pnpm-restore                # Restore globals from dotfiles
```

---

## Useful Commands Reference

### System

```bash
# Disk usage
df -h                       # Disk free space
du -sh *                    # Size of items in current dir
ncdu                        # Interactive disk usage (install: brew install ncdu)

# Process management
top                         # Process viewer
htop                        # Better process viewer
kill -9 PID                 # Force kill process
pkill -f "process name"     # Kill by name

# Network
lsof -i :3000               # What's using port 3000
curl -I https://example.com # Check HTTP headers
ping google.com             # Test connectivity
```

### Development

```bash
# Find files
fd pattern                  # Find files by name
fd -e js                    # Find by extension
rg "pattern"                # Search file contents (ripgrep)
rg "TODO" --type js         # Search in specific file type

# Git advanced
git stash                   # Stash changes
git stash pop               # Apply stashed changes
git rebase -i HEAD~3        # Interactive rebase last 3 commits
git cherry-pick <hash>      # Apply specific commit
git reflog                  # View all git history (recovery)

# Docker (if installed)
docker ps                   # Running containers
docker compose up -d        # Start services
docker system prune         # Clean up
```

### macOS Specific

```bash
# Clipboard
pbcopy < file              # Copy file to clipboard
pbpaste > file             # Paste clipboard to file
echo "text" | pbcopy       # Copy text to clipboard

# Quick Look
qlmanage -p file           # Preview file

# Open apps
open .                     # Open current dir in Finder
open -a "App Name"         # Open application
open https://url.com       # Open URL in browser

# Spotlight
mdfind "query"             # Search like Spotlight
```

---

## SSH Setup Guide

> SSH keys are not included in this repo for security. Set them up manually on each machine.

### Generate New SSH Key

```bash
# Generate ED25519 key (recommended)
ssh-keygen -t ed25519 -C "your_email@example.com"

# Or with custom filename
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/github
```

### Add to SSH Agent

```bash
# Start agent
eval "$(ssh-agent -s)"

# Add key (macOS - stores in Keychain)
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

### SSH Config Example

Create `~/.ssh/config`:

```ssh
# Default GitHub
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    AddKeysToAgent yes
    UseKeychain yes

# Work GitHub (example)
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work
    AddKeysToAgent yes
    UseKeychain yes

# Custom server
Host myserver
    HostName 192.168.1.100
    User admin
    IdentityFile ~/.ssh/server_key
```

### Add Key to GitHub

```bash
# Copy public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub

# Then add at: https://github.com/settings/keys
```

### 1Password SSH Agent (Recommended)

If using 1Password, enable the SSH Agent in 1Password settings. Then commits are signed automatically.

See: https://developer.1password.com/docs/ssh/

---

## Git Configuration

### Directory-Based Config

The setup supports different identities per directory:

```gitconfig
# In ~/.gitconfig
[includeIf "gitdir:~/"]
    path = ~/.gitconfig.personal

[includeIf "gitdir:~/Work/"]
    path = ~/.gitconfig.work
```

### Adding Work Config

Create `~/.gitconfig.work`:

```gitconfig
[user]
    name = Your Work Name
    email = work@company.com
    signingkey = ssh-ed25519 AAAA...

[core]
    sshCommand = "ssh -i ~/.ssh/work_key"
```

---

## VS Code Settings

Settings are synced via VS Code's built-in GitHub sync (Settings Sync).

To enable:
1. Open VS Code
2. Click profile icon (bottom left)
3. Turn on Settings Sync
4. Sign in with GitHub

This syncs: settings, keybindings, extensions, snippets, UI state.

### Alternative: Dotfiles Sync

If you prefer dotfiles management, symlink VS Code settings:

```bash
# macOS VS Code settings location
~/.dotfiles/vscode/settings.json → ~/Library/Application Support/Code/User/settings.json
```

---

## Updating

### Update Everything

```bash
cd ~/.dotfiles
git pull
brew bundle
./stow.sh
```

### Regenerate Brewfile

After installing new packages:

```bash
brew bundle dump --force --file=~/.dotfiles/Brewfile
```

### Save pnpm Globals

```bash
pnpm-save  # Alias defined in .zshrc
```

---

## Troubleshooting

### Shell Slow to Start

Profile startup time:

```bash
time zsh -i -c exit
```

### Stow Conflicts

If stow reports conflicts:

```bash
# Remove conflicting file
rm ~/.zshrc

# Re-run stow
./stow.sh
```

### Homebrew Issues

```bash
brew doctor        # Diagnose issues
brew update-reset  # Reset to latest
```

### fnm Not Working

Ensure `.zprofile` is loaded:

```bash
source ~/.zprofile
```

---

## License

MIT License - Feel free to fork and customize.

## Credits

&copy; 2026 &mdash; Ömer Balyalı
