#!/bin/bash

export EDITOR=vim
export HISTFILE="${HOME}/.history"
export HISTSIZE=10000
export GREP_OPTIONS='-I --color=auto --exclude-dir=.git --exclude-dir=node_modules'

# Different commands for Darwin
if [ $(uname) == "Darwin" ]; then
  alias l="ls -lhG"
  alias la="ls -lhaG"
else
  alias l="ls -lh --group-directories-first --color=auto -F"
  alias la="ls -lhA --group-directories-first --color=auto -F"
fi

alias cp="cp -i"                          # auto-confirm before overwriting something
alias df='df -h'                          # human-readable sizes

alias ..="cd .."
alias ...="cd ..; cd .."

# git
# TODO this should be in .gitconfig_global
alias gc="git commit -m"
alias ga="git add -p"
alias gs="git status"
alias gb="git branch"
alias gd="cdiff"
alias gl="git log"
alias lastcommit="git diff HEAD^ HEAD"

export FZF_TMUX=1
export HISTCONTROL=ignoreboth:erasedups

# tmux
alias t="tmux -2"
alias ta="tmux -2 attach"

alias ag="rg"
alias diff="icdiff"

# Start ssh-agent, load ssh keys
# https://unix.stackexchange.com/questions/90853/how-can-i-run-ssh-add-automatically-without-a-password-prompt
if [ -z "$SSH_AUTH_SOCK" ] ; then
  echo "starting ssh agent"
  eval `ssh-agent -s`
  ssh-add
fi

. $HOME/.dotfiles/scripts/git-completion.sh
. $HOME/.dotfiles/scripts/ssh-completion.sh
. $HOME/.dotfiles/scripts/encrypt.sh

# Load a local profile
[ -r "${HOME}/.localprofile" ] && . "${HOME}/.localprofile"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
