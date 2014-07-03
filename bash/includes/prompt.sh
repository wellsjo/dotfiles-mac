#!/bin/bash

# emphasized (bolded) colors
BC="\[\033[1;36m\]"
BR="\[\033[1;31m\]"
BG="\[\033[1;32m\]"
BY="\[\033[1;33m\]"
BW="\[\033[1;37m\]"

function parse_git_dirty {
[[ $(git status 2> /dev/null | tail -n1) != "(clean)" ]] && echo "*"
}

function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1)$(parse_git_dirty)/"
}

export PS1="${BC}\u ${BW}| ${BY}\W ${BG}\$(parse_git_branch)\n${BR}>> ${BW}"
export PS2="    continue > "
