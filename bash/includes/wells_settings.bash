#!/bin/bash

wells_settings() {

    echo -e "${BLUE}\nSSH shortcuts"
    echo "${YELLOW}wells | website vm"
    echo "ppl   | dev vm"
    echo "vm    | spotify vm"
    echo "jump  | jumphost"

    echo -e "\n${BLUE}Bash aliases${YELLOW}"
    echo -e "..    | cd .."
    echo "ll    | la -la"

    echo -e "${BLUE}\nFuzzy search shortcuts${YELLOW}"
    echo "fe    | open file in vim"
    echo "fd    | cd to directory"
    echo "fh    | repeat history"
    echo "fkill | kill process"

    echo -e "\n${BLUE}wells_settings | wsettings"
    echo -e "${WHITE}The command you just ran. This shows all available commands\n"
    echo -e "${BLUE}wells_update | wupdate"
    echo -e "${WHITE}This re-sources my dotfiles and optionally pushes any changes made to the wells_dotfiles repository\n"
    echo -e "${BLUE}wells_install | winstall"
    echo -e "${WHITE}This is the command used by wssh.  It clones the wells_dotfiles repo and then sets symlinks to bash, git, and vim\n"
    echo -e "${BLUE}wellssh | wssh"
    echo -e "${WHITE}ssh into a remote server and runs wells_install"
}

alias wsettings="wells_settings"
