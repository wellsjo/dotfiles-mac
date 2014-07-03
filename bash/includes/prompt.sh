#!/bin/bash

# This file sets up my bash shell prompt

# emphasized (bolded) colors
BC="\[\033[1;36m\]"
BR="\[\033[1;31m\]"
BG="\[\033[1;32m\]"
BY="\[\033[1;33m\]"
BW="\[\033[1;37m\]"

# bash shell prompt:
# @user_name | @current_directory μ @git_branch [+]
# >>
PS1="\n${BC}\u ${BW}| ${BY}\W ${BG}\$(git_info)\n${BW}>> "

# [+] indicates whether the git branch is dirty

# continue message
PS2="  continue > "

function git_info {
if [ -d ".git" ]; then
    local BW='\033[37m'
    local BR='\033[31m'
    local BG='\033[32m'
    gitstatus=$(git status | grep clean)
    if [[ ${#gitstatus} == 0 ]]; then
        gitdirty="[+]"
    else
        gitdirty="✓"
    fi
    local gitbranch=$(git branch | grep \* | tr -d "* ")
    echo -e "${BW}| μ${gitbranch} ${BG}${gitdirty}"
fi

}
