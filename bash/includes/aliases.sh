#!/bin/bash

# @author Wells Johnston <w@wellsjohnston.com>

# Shorthand
alias l="ls -lha"
alias c="clear"
alias ..="cd .."
alias ...="cd .. && cd .."
alias ....="cd .. && cd .. && cd .."

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
