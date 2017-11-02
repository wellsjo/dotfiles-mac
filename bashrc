#!/bin/bash

export EDITOR=vim
export HISTFILE="${HOME}/.history"
export HISTSIZE=10000

# liquid prompt
if [ -e ~/.liquidpromptrc ]; then
  source ~/.dotfiles/extra/liquidprompt/liquidprompt
  LP_PS1_PREFIX="\n"
  LP_PS1_POSTFIX="\n> "
  LP_MARK_DEFAULT=""
fi

# Aliases

# Different commands for Darwin
if [ $(uname) == "Darwin" ]; then
  alias l="ls -lhG"
  alias la="ls -lhaG"
else
  alias l="ls -lh --group-directories-first --color=auto -F"
  alias la="ls -lhA --group-directories-first --color=auto -F"
fi

alias grep="grep --color=auto"
alias cp="cp -i"                          # auto-confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB (doesn't work on mac)

alias c="clear"
alias ..="cd .."
alias ...="cd .. && cd .."
alias ....="cd .. && cd .. && cd .."

# git
alias ga="git add -p"
alias gs="git status"
alias gb="git branch"
alias gd="git diff"
alias gl="git log"
alias lastcommit="git diff HEAD^ HEAD"

# tmux
alias t="tmux -2"
alias ta="tmux -2 attach"

# Start ssh-agent, load ssh keys
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

. $HOME/.dotfiles/scripts/git-completion.sh
. $HOME/.dotfiles/scripts/ssh-completion.sh

# Update path
export PATH=$HOME/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.bpkg/bin:"$PATH"

# Load a local profile
[ -r "${HOME}/.localprofile" ] && . "${HOME}/.localprofile"
