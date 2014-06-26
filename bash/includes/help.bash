#!/bin/bash

function wells_help() {

    echo -e "${BRIGHT}${YELLOW}\nSSH shortcuts"
    echo "${WHITE}wells | website vm"
    echo "ppl   | dev vm"
    echo "vm    | spotify vm"
    echo "jump  | jumphost"

    echo -e "\n${YELLOW}Spotify.com shortcuts${WHITE}"
    echo -e "d     | ./devify.sh --auto --skip-language"
    echo -e "c     | cosole cache:clear"

    echo -e "\n${YELLOW}Bash aliases${WHITE}"
    echo -e "..    | cd .."
    echo "ll    | ls -la"

    echo -e "${YELLOW}\nFuzzy search shortcuts${WHITE}"
    echo "fe    | open file in vim"
    echo "fd    | cd to directory"
    echo "fh    | repeat history"
    echo "fkill | kill process"

    echo -e "\n${YELLOW}wells_settings | wsettings"
    echo -e "${WHITE}The command you just ran. This shows all available commands\n"
    echo -e "${YELLOW}wellssh | wssh"
    echo -e "${WHITE}ssh into a remote server and runs wells_install\n"
    echo -e "${YELLOW}wells_install | winstall"
    echo -e "${WHITE}This is the command used by wssh.  It clones the wells_dotfiles repo and then sets symlinks to bash, git, and vim\n"
    echo -e "${YELLOW}wells_update | wupdate"
    echo -e "${WHITE}This updates my dotfiles from the git repo then re-sources everything.\n"
    echo -e "${YELLOW}wells_push | wpush"
    echo -e "${WHITE}This re-sources my dotfiles and optionally pushes any changes made to the wells_dotfiles repository"
    echo
}

alias wsettings="wells_help"
alias whelp="wells_help"
