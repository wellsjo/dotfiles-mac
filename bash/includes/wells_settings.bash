#!/bin/bash

function wells_settings() {

    echo -e "${BLUE}\nSSH shortcuts"
    echo "${WHITE}wells | website vm"
    echo "ppl   | dev vm"
    echo "vm    | spotify vm"
    echo "jump  | jumphost"

    echo -e "\n${BLUE}Bash aliases${WHITE}"
    echo -e "..    | cd .."
    echo "ll    | ls -la"

    echo -e "${BLUE}\nFuzzy search shortcuts${WHITE}"
    echo "fe    | open file in vim"
    echo "fd    | cd to directory"
    echo "fh    | repeat history"
    echo "fkill | kill process"

    echo -e "\n${BLUE}wells_settings | wsettings"
    echo -e "${WHITE}The command you just ran. This shows all available commands\n"
    echo -e "${BLUE}wellssh | wssh"
    echo -e "${WHITE}ssh into a remote server and runs wells_install\n"
    echo -e "${BLUE}wells_install | winstall"
    echo -e "${WHITE}This is the command used by wssh.  It clones the wells_dotfiles repo and then sets symlinks to bash, git, and vim\n"
    echo -e "${BLUE}wells_update | wupdate"
    echo -e "${WHITE}This updates my dotfiles from the git repo then re-sources everything.\n"
    echo -e "${BLUE}wells_push | wpush"
    echo -e "${WHITE}This re-sources my dotfiles and optionally pushes any changes made to the wells_dotfiles repository"
    echo
}

alias wsettings="wells_settings"
