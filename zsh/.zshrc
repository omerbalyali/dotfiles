# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"

# Theme
ZSH_THEME="spaceship"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump brew git macos colored-man-pages copydir zsh-autosuggestions zsh-interactive-cd zsh-syntax-highlighting)

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  docker        # Docker section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# LS_COLORS="di=32:ln=30:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# LS_COLORS=gxfxcxdxbxexexabagacad

SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR=220 # Tuned Yellow
SPACESHIP_DIR_COLOR=084 # Light green
SPACESHIP_CHAR_COLOR_SUCCESS=046 # Bright green
SPACESHIP_GIT_BRANCH_COLOR=206 # Pink
SPACESHIP_GIT_STATUS_COLOR=226 # Yellow
SPACESHIP_PACKAGE_COLOR=105 # Light indigo
SPACESHIP_PACKAGE_SYMBOL=""
SPACESHIP_NODE_COLOR=059 # Dark green

SPACESHIP_EXEC_TIME_SHOW=true

SPACESHIP_GIT_STATUS_UNTRACKED=" untracked "
SPACESHIP_GIT_STATUS_ADDED=" added "
SPACESHIP_GIT_STATUS_MODIFIED=" modified "
SPACESHIP_GIT_STATUS_RENAMED=" renamed "
SPACESHIP_GIT_STATUS_DELETED=" deleted "
SPACESHIP_GIT_STATUS_STASHED=" stashed "
SPACESHIP_GIT_STATUS_UNMERGED=" unmerged "
SPACESHIP_GIT_STATUS_AHEAD=" ahead "
SPACESHIP_GIT_STATUS_BEHIND=" behind "
SPACESHIP_GIT_STATUS_DIVERGED=" diverged "

# SPACESHIP_CHAR_COLOR_FAILURE=160 # Bright Red

source $ZSH/oh-my-zsh.sh


# Custom colors for colored-man-pages
less_termcap[md]="${fg_bold[blue]}"
less_termcap[us]="${fg_bold[yellow]}"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# sbin
export PATH="/usr/local/sbin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"


# Dotfiles Aliases
alias dotfiles="cd ~/.dotfiles"
alias setup-mac="source ~/.dotfiles/setup.sh"
alias update-brew="brew doctor && brew update && brew upgrade --greedy && brew cleanup"
alias update-dock-mac="source ~/.dotfiles/dock.sh"
alias update-node="export PREUPDATE_NODE=$(node -v) && nvm alias preupdate_version $PREUPDATE_NODE && nvm install --lts --default --reinstall-packages-from=node && nvm alias default lts/* && nvm use default && nvm uninstall preupdate_version && nvm unalias preupdate_version && unset PREUPDATE_NODE"
alias update-mac="sudo softwareupdate -i -r && update-brew && update-dock-mac"
