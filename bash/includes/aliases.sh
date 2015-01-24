#!/bin/bash

# Spotify dev aliases
alias d="~/src/website/devify.sh --skip-language --auto"
alias c="clear"

# Custom ssh shortcuts
alias wells="ssh -i ~/Google\ Drive/Persisted\ Files/Amazon\ Web\ Services/wells_2.pem ec2-user@54.83.193.197"
alias passenger="ssh -i ~/Google\ Drive/Persisted\ Files/Amazon\ Web\ Services/wells_2.pem ubuntu@54.164.53.196"

alias vm="ssh -tA wells@www.captain-planet.cloud.spotify.net"
alias yir="ssh -A awseu3-webgate-a1.yirendpoint.cloud.spotify.net"
alias jump="ssh -A wells@jump1.lon.spotify.net"
alias stage="ssh -A wells@lon3-wwwstaging-a1.lon3.spotify.net"
alias prod1="ssh -A wells@lon2-www-a1.lon.spotify.net"
alias prod2="ssh -A wells@lon2-www-a2.lon.spotify.net"
alias prod3="ssh -A wells@lon2-www-a3.lon.spotify.net"
alias prod4="ssh -A wells@lon2-www-a4.lon.spotify.net"
alias prod5="ssh -A wells@lon2-www-a5.lon.spotify.net"

# General bash/git aliases
alias colors="git_prompt_color_samples"
alias wells_colors="colors"
alias h="cd ~"
alias gs="git status"
alias gl="git log"
alias gd="git diff"
alias gb="git branch"

# general dev shortcuts
alias enablepuppet="sudo sppuppet enable-cron"
alias disablepuppet="sudo sppuppet disable-cron"
alias startpuppet="sudo sppuppet agent -vt"

# save the ssh config, start tmux session, restore the ssh config
# this prevents you from having to kill your session to reload the ssh config
alias t="tmux -2"
alias ta="tmux -2 attach"

alias ..="cd .."
# color if supported
[ "$(uname -s)" = "Linux" ] && alias ls='ls --color'
alias ll='ls -la'
alias l='ll'
