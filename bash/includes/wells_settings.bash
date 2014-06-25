#!/bin/bash

wells_settings() {

    echo -e "${CYAN}\nSSH shortcuts"
    echo "${YELLOW}wells | website vm"
    echo "ppl   | dev vm"
    echo "vm    | spotify vm"
    echo "jump  | jumphost"

    echo -e "\n${CYAN}Bash aliases${YELLOW}"
    echo -e "..    | cd .."
    echo "ll    | la -la"

    echo -e "${CYAN}\nFuzzy search shortcuts${YELLOW}"
    echo "fe    | open file in vim"
    echo "fd    | cd to directory"
    echo "fh    | repeat history"
    echo "fkill | kill process"

    echo -e "\n${CYAN}Other commands${YELLOW}"
    echo "wells_settings | wsettings"
    echo "wells_update   | wupdate"
    echo "wells_install  | winstall"
    echo "wellssh"

}

alias wsettings="wells_settings"
