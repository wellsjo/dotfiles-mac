#!/bin/bash

# emphasized (bolded) colors
local BK="\[\033[1;30m\]"
local BC="\[\033[1;36m\]"
local BR="\[\033[1;31m\]"
local BG="\[\033[1;32m\]"
local BY="\[\033[1;33m\]"
local BB="\[\033[1;34m\]"
BW="\[\033[1;37m\]"

function parse_git_dirty {
[[ $(git status 2> /dev/null | tail -n1) != "(clean)" ]] && echo " [+]"
}

function parse_git_branch {
local BW="\[\033[1;37m\]"
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="${BG}\u ${BW}| ${BY}\W ${BW}| ${BC}\$(parse_git_branch)\n${BR}>> ${BW}"
export PS2="continue > "
