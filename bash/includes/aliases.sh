#!/bin/bash

# @author Wells Johnston <w@wellsjohnston.com>

# Shorthand
alias h="cd ~"
alias l="ls -lha"
alias la="ls -lha"
alias c="clear"
alias ..="cd .."

# git
alias gc="git commit -m $1"
alias ga="git add -p"
alias gs="git status"
alias gb="git branch"
alias gp="git push"
alias gd="git diff"
alias gl="git log"
alias lastcommit="git diff HEAD^ HEAD"

# tmux
alias t="tmux -2"
alias ta="tmux -2 attach"
