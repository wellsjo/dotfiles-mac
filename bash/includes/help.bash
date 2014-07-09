#!/bin/bash

function wells_help() {

    echo -e "\n${YELLOW}wells_help | whelp"
    echo -e "${WHITE}The command you just ran. This shows all available commands\n"
    echo -e "${YELLOW}wells_vim | wvim"
    echo -e "${WHITE}Show my custom vim settings\n"
    echo -e "${YELLOW}wellssh | wssh"
    echo -e "${WHITE}ssh into a remote server and runs wells_install\n"
    echo -e "${YELLOW}wells_install | winstall"
    echo -e "${WHITE}This is the command used by wssh.  It clones the wells_dotfiles repo and then sets symlinks to bash, git, and vim\n"
    echo -e "${YELLOW}wells_update | wupdate"
    echo -e "${WHITE}This updates my dotfiles from the git repo then re-sources everything.\n"
    echo -e "${YELLOW}wells_push | wpush"
    echo -e "${WHITE}This re-sources my dotfiles and optionally pushes any changes made to the wells_dotfiles repository"

    echo -e "\n${YELLOW}Bash aliases${WHITE}"
    echo -e "ta    | tmux -2 attach"
    echo -e "t     | tmux -2"
    echo -e "..    | cd .."
    echo "ll    | ls -la"


    echo -e "\n${YELLOW}Spotify.com shortcuts${WHITE}"
    echo -e "d     | ./devify.sh --auto --skip-language"
    echo -e "c     | cosole cache:clear"

    echo -e "${YELLOW}\nFuzzy search shortcuts${WHITE}"
    echo "fe    | open file in vim"
    echo "fd    | cd to directory"
    echo "fh    | repeat history"
    echo "fkill | kill process"

    echo -e "${BRIGHT}${YELLOW}\nSSH shortcuts"
    echo "${WHITE}wells | wellsjohnston.com"
    echo "ppl   | developemnt"
    echo "vm    | spotify dev"
    echo "jump  | spotify jumphost"

    echo
}

function wells_vim() {

    echo -e "\n${YELLOW}Vim settings${WHITE}"
    # surround
    echo -e "ysiw(char)        | surround selection with (char)"
    echo -e "yss(char)         | surround sentence with (char)"
    echo -e "cs(char1)(char2)  | change surrounding (char1) with (char2)"
    echo -e "ds(char)          | remove (char) from surrounding"
    echo -e "S(char)           | surround selection with (char) in visual mode"

    echo

    # EasyMotion
    echo -e "(space)w          | search word forward"
    echo -e "(space)b          | search word back"
    echo -e "(space)s(char)    | search for (char)"
    echo

    echo -e "cntrl-t           | fuzzy file search"
    echo -e "cntrl-h           | toggle highlight"
    echo

    echo -e ":Gblame           | git blame"
    echo -e ":Git (command)    | any git command"

    echo
}

alias wsettings="wells_help"
alias whelp="wells_help"
alias wvim="wells_vim"
