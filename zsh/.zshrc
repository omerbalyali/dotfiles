# =============================================================================
# .zshrc - Interactive shell configuration
# Loaded for every new terminal session
# =============================================================================

# -----------------------------------------------------------------------------
# Environment Variables
# -----------------------------------------------------------------------------
export DOTFILES="$HOME/.dotfiles"
export EDITOR="code --wait"
export VISUAL="$EDITOR"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# -----------------------------------------------------------------------------
# History Configuration
# -----------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY          # Write timestamps to history
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicates first
setopt HIST_IGNORE_DUPS          # Don't record duplicates
setopt HIST_IGNORE_SPACE         # Don't record commands starting with space
setopt HIST_VERIFY               # Show command before executing from history
setopt SHARE_HISTORY             # Share history between sessions
setopt APPEND_HISTORY            # Append to history, don't overwrite

# -----------------------------------------------------------------------------
# Zsh Options
# -----------------------------------------------------------------------------
setopt AUTO_CD                   # cd by typing directory name
setopt AUTO_PUSHD                # Push directories to stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicates
setopt PUSHD_SILENT              # Don't print directory stack
setopt CORRECT                   # Spelling correction for commands
setopt INTERACTIVE_COMMENTS      # Allow comments in interactive shell
setopt NO_BEEP                   # No beep on error

# -----------------------------------------------------------------------------
# Completion System
# -----------------------------------------------------------------------------
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Completion menu
zstyle ':completion:*' menu select

# Colors in completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# -----------------------------------------------------------------------------
# Key Bindings
# -----------------------------------------------------------------------------
bindkey -e                       # Emacs-style key bindings
bindkey '^[[A' history-search-backward  # Up arrow
bindkey '^[[B' history-search-forward   # Down arrow
bindkey '^[[H' beginning-of-line        # Home
bindkey '^[[F' end-of-line              # End
bindkey '^[[3~' delete-char             # Delete

# -----------------------------------------------------------------------------
# Homebrew Prefix (for plugin paths)
# -----------------------------------------------------------------------------
if [[ -n "$HOMEBREW_PREFIX" ]]; then
    BREW_PREFIX="$HOMEBREW_PREFIX"
else
    BREW_PREFIX="/opt/homebrew"
fi

# -----------------------------------------------------------------------------
# Plugins (via Homebrew)
# -----------------------------------------------------------------------------

# Zsh Autosuggestions
if [[ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Zsh Syntax Highlighting (must be last plugin)
if [[ -f "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# -----------------------------------------------------------------------------
# Tools Initialization
# -----------------------------------------------------------------------------

# zoxide (smart cd)
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# fzf
if [[ -f "$HOME/.fzf.zsh" ]]; then
    source "$HOME/.fzf.zsh"
elif [[ -f "$BREW_PREFIX/opt/fzf/shell/completion.zsh" ]]; then
    source "$BREW_PREFIX/opt/fzf/shell/completion.zsh"
    source "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
fi

# fzf options
export FZF_DEFAULT_OPTS='
    --height 40%
    --layout=reverse
    --border
    --info=inline
'
export FZF_CTRL_R_OPTS='--sort --exact'

# -----------------------------------------------------------------------------
# Starship Prompt (load last for proper prompt)
# -----------------------------------------------------------------------------
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# -----------------------------------------------------------------------------
# Aliases - Navigation
# -----------------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias -- -="cd -"

alias dev="cd ~/Development"
alias work="cd ~/Development/Work"
alias projects="cd ~/Development/Projects"
alias dot="cd ~/.dotfiles"

# -----------------------------------------------------------------------------
# Aliases - Listing (eza)
# -----------------------------------------------------------------------------
if command -v eza &>/dev/null; then
    alias ls="eza"
    alias ll="eza -l --git --icons"
    alias la="eza -la --git --icons"
    alias lt="eza -T --git --icons --level=2"
    alias lta="eza -Ta --git --icons --level=2"
else
    alias ll="ls -lh"
    alias la="ls -lAh"
fi

# -----------------------------------------------------------------------------
# Aliases - Git
# -----------------------------------------------------------------------------
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gb="git branch"
alias gsw="git switch"
alias gco="git checkout"
alias glog="git log --oneline --graph"

# -----------------------------------------------------------------------------
# Aliases - Modern CLI Tools
# -----------------------------------------------------------------------------
if command -v bat &>/dev/null; then
    alias cat="bat --paging=never"
    alias catp="bat"  # with pager
fi

if command -v fd &>/dev/null; then
    alias find="fd"
fi

if command -v rg &>/dev/null; then
    alias grep="rg"
fi

# -----------------------------------------------------------------------------
# Aliases - Homebrew
# -----------------------------------------------------------------------------
alias brewup="brew update && brew upgrade && brew cu -a && brew cleanup"
alias brewdump="brew bundle dump --force --file=~/.dotfiles/Brewfile"

# -----------------------------------------------------------------------------
# Aliases - pnpm global management
# -----------------------------------------------------------------------------
alias pnpm-save="pnpm list -g --depth=0 | tail -n +2 | awk '{print \$1}' | grep -v '^$' > ~/.dotfiles/pnpm-globals.txt && echo '✓ Saved pnpm globals to ~/.dotfiles/pnpm-globals.txt'"
alias pnpm-restore="xargs -I {} pnpm add -g {} < ~/.dotfiles/pnpm-globals.txt"

# -----------------------------------------------------------------------------
# Aliases - Utilities
# -----------------------------------------------------------------------------
alias reload="source ~/.zshrc && echo '✓ Reloaded ~/.zshrc'"
alias path='echo -e ${PATH//:/\\n}'
alias ports="lsof -i -P -n | grep LISTEN"
alias myip="curl -s https://ipinfo.io/ip"
alias localip="ipconfig getifaddr en0"

# Clipboard
alias copy="pbcopy"
alias paste="pbpaste"

# Quick edit
alias zshrc="$EDITOR ~/.zshrc"
alias gitconfig="$EDITOR ~/.gitconfig"

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"    ;;
            *.tar.gz)    tar xzf "$1"    ;;
            *.bz2)       bunzip2 "$1"    ;;
            *.rar)       unrar x "$1"    ;;
            *.gz)        gunzip "$1"     ;;
            *.tar)       tar xf "$1"     ;;
            *.tbz2)      tar xjf "$1"    ;;
            *.tgz)       tar xzf "$1"    ;;
            *.zip)       unzip "$1"      ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1"       ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick HTTP server in current directory
serve() {
    local port="${1:-8000}"
    echo "Serving on http://localhost:$port"
    python3 -m http.server "$port"
}

# -----------------------------------------------------------------------------
# Local Configuration (not tracked in git)
# -----------------------------------------------------------------------------
if [[ -f "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi
