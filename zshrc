# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="/Users/wells/.oh-my-zsh"

# Prompt https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Start ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding on

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  alias-finder
  # aws
  brew
  colored-man-pages
  colorize
  command-not-found
  common-aliases
  copybuffer
  docker
  emoji
  encode64
  extract
  fzf
  git-extras
  git
  golang
  httpie
  iterm2
  jsontools
  npm
  macos
  pip
  ripgrep
  safe-paste
  sublime
  tmux
  urltools
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export EDITOR='vim'

# Aliases
alias t="tmux"
alias ag="rg"
alias l="gls -lhG --group-directories-first --color"
alias la="gls -lhaG --group-directories-first --color"

alias gs="git status"
alias gb="git branch"
alias ga="git add -p"
alias gd="git icdiff"
alias gl="git --no-pager log --oneline -n 5"
alias gll="git --no-pager log --oneline -n 25"
alias gc="git commit -m"

# Load local profile
[ -f ~/.localprofile ] && source ~/.localprofile

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Make it so that git autocomplete never makes remote calls for auto-complete
__git_heads_remote() {}

eval "$(/opt/homebrew/bin/brew shellenv)"

# zprof
