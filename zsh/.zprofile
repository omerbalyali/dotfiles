# =============================================================================
# .zprofile - Login shell configuration
# Loaded once when logging in (before .zshrc)
# =============================================================================

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------
# Apple Silicon path
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
# Intel Mac path (fallback)
elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# -----------------------------------------------------------------------------
# fnm (Fast Node Manager)
# -----------------------------------------------------------------------------
if command -v fnm &>/dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

# -----------------------------------------------------------------------------
# pnpm
# -----------------------------------------------------------------------------
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# -----------------------------------------------------------------------------
# Local binaries
# -----------------------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
