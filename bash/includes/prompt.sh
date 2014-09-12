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
gray="\[\033[1;90m\]"

PS1="\n${green}\@ ${cyan}\u@\$(hostname_info):${yellow}\w ${green}\$(git_info)\n${green}>> ${white}"

# continue message
PS2="  continue > "

# my git portion of the prompt
# shows current branch and whether the working directory is clean
function git_info {

local g=`git rev-parse --blah 2> /dev/null`
if [[ ${#g} > 0 ]]; then

    local white='\033[37m'
    local green='\033[32m'
    local blue='\033[34m'

    gitstatus=$(git status | grep 'nothing to commit')

    if [[ ${#gitstatus} > 0 ]]; then
        gitdirty="✓"
    else
        gitdirty="+"
    fi

    local gitbranch=$(git branch | grep \* | tr -d "* ")

    echo -e "${white}μ${blue}${gitbranch} ${green}${gitdirty}"

fi

}

function hostname_info {

echo -e $(hostname)

}
