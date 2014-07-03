#!/bin/bash

# emphasized (bolded) colors
BC="\[\033[1;36m\]"
BR="\[\033[1;31m\]"
BG="\[\033[1;32m\]"
BY="\[\033[1;33m\]"
BW="\[\033[1;37m\]"

function git_info {
if [ -d ".git" ]; then
    gitstatus=$(git status | grep clean)
    if [[ ${#gitstatus} == 0 ]]; then
        gitdirty=" [+]"
    else
        gitdirty=" (clean)"
    fi
fi
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/μ\1${gitdirty}/"
}

export PS1="\n${BC}\u ${BW}| ${BY}\W ${BG}\$(git_info)\n${BR}>> ${BW}"
export PS2="    continue > "
