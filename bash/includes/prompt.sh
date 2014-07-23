#!/bin/bash

# This file sets up my bash shell prompt

# emphasized (bolded) colors

# bash shell prompt:
# @time @user_name @computer_name /@current_directory μ @git_branch [+]
# >>

cyan="\[\033[1;36m\]"
green="\[\033[1;32m\]"
yellow="\[\033[1;33m\]"
white="\[\033[1;37m\]"
darkgrey="\[\033[1;30m\]"

PS1="\n${darkgrey}[${time}]/[\u@\h] ${white}/${yellow}\W ${green}\$(git_info)\n${white}>> "

# continue message
PS2="   continue > "

# my git portion of the prompt
# shows current branch and whether the working directory is clean
function git_info {
local d=${PWD}
while [ "$d" != "" ]; do
    if [ -d "$d"/.git ]; then
        local white='\033[37m'
        local green='\033[32m'
        local BO='\033[35m'
        gitstatus=$(git status | grep 'nothing to commit')
        if [[ ${#gitstatus} > 0 ]]; then
            gitdirty="✓"
        else
            gitdirty="+"
        fi
        local gitbranch=$(git branch | grep \* | tr -d "* ")
        echo -e "${white}μ${BO} ${gitbranch} ${green}${gitdirty}"
        break;
    else
        d=${d%/*}
    fi
done
}
