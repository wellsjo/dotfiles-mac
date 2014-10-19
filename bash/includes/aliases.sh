#!/bin/bash

# Spotify dev aliases
alias d="~/src/web-site/devify.sh --skip-language --auto"
alias c="console cache:clear"

# Custom ssh shortcuts
alias wells="ssh -i ~/Google\ Drive/Important/Misc\ Saved\ Files/Amazon\ Web\ Services/wells_2.pem ec2-user@54.83.193.197"
alias passenger="ssh -i ~/Google\ Drive/Important/Misc\ Saved\ Files/Amazon\ Web\ Services/wells_2.pem ubuntu@54.164.53.196"

alias vm="ssh -tA wells@www.bananajams.cloud.spotify.net 'cd src/web-site && tmux -2 attach; bash -l'"
alias jump="ssh -A wells@jump1.lon.spotify.net"

# General bash/git aliases
alias h="cd ~"
alias gs="git status"
alias gl="git log"
alias gd="git diff"
alias gb="git branch"

# save the ssh config, start tmux session, restore the ssh config
# this prevents you from having to kill your session to reload the ssh config
alias t="tmux -2"
alias ta="tmux -2 attach"

alias ..="cd .."
# color if supported
[ "$(uname -s)" = "Linux" ] && alias ls='ls --color'
alias ll='ls -la'
alias l='ll'
