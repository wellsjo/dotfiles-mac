#!/bin/bash

# @author  Wells Johnston <w@wellsjohnston.com>

# re-source dotfiles from git repo
wells_update() {
    echo
    read -p "Do you want to update and re-source from the remote dotfiles repository? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        update_from_repo
    fi
}
alias wupdate="wells_update"

# re-source local dotfiles
wells_source() {
    echo "Re-sourcing local dotfiles..."
    source ~/.dotfiles/bash/profile
}
alias wsource="wells_source"

# Setup the dotfiles repo locally, or pull latest version from github.
# Create symlinks in the $HOME directory to elements in the repo
wells_install() {

    update_from_repo

    echo -e "\nSetting symlinks..."
    symlink "${HOME}/.dotfiles/vim/vimrc" "${HOME}/.vimrc"
    symlink "${HOME}/.dotfiles/vim" "${HOME}/.vim"

    symlink "${HOME}/.dotfiles/bash/profile" "${HOME}/.profile"
    symlink "${HOME}/.dotfiles/bash/profile" "${HOME}/.bashrc"
    symlink "${HOME}/.dotfiles/bash/profile" "${HOME}/.bash_profile"

    symlink "${HOME}/.dotfiles/bash" "${HOME}/.bash"
    symlink "${HOME}/.dotfiles/git/gitconfig" "${HOME}/.gitconfig"
    symlink "${HOME}/.dotfiles/bash/fzf" "${HOME}/.fzf"
    symlink "${HOME}/.dotfiles/tmux/tmux.conf" "${HOME}/.tmux.conf"
    symlink "${HOME}/.dotfiles/bash/liquidprompt/liquidpromptrc-dist" "${HOME}/.liquidpromptrc"

    # source tmux
    echo -e "\nSourcing tmux..."
    tmux source ~/.tmux.conf

    cd "${HOME}"

    # Delete any broken symlinks in the homedir
    find -L . -maxdepth 1 -type l -exec rm -- {} +

    # Source the profile to get things going
    . "${HOME}/.profile"

    echo -e "\nDone!"
    echo -e "\nType 'wells_settings' to get a list of available commands"
}
alias winstall="wells_install"

update_from_repo() {
    echo -e "\nInstalling dotfiles..."

    local REPO='https://github.com/wellsjo/dotfiles'

    # If the dotfiles dir already exists
    if [ -d "${HOME}/.dotfiles" ] ; then
        cd "${HOME}/.dotfiles"
        git reset --hard HEAD >/dev/null 2>&1
        echo "Updating from git repo..."
        git pull
    else
        echo "dotfiles not present"
        echo -e "Cloning git repo from ${REPO}..."
        cd "${HOME}"
        git clone --depth 1 ${REPO} .dotfiles
        cd "${HOME}/.dotfiles"
    fi
}

# Simple wrapper for ssh which makes wells_update() available in the remote session
# regardless of whether .dotfiles is present remotely or not
wellssh() {
    local func=$(typeset -f wells_install)
    local func2=$(typeset -f symlink)
    ssh -A -t "$@" \
    "${func2} ;
    ${func} ;
    [ -r /etc/motd ] && cat /etc/motd ;
    [ -r \"\$HOME/.profile\" ] && . \"\$HOME/.profile\" ;
    type wellssh >/dev/null 2>&1 ||  wells_update;
    exec env -i SSH_AUTH_SOCK=\"\$SSH_AUTH_SOCK\" \
      SSH_CONNECTION=\"\$SSH_CONNECTION\" \
      SSH_CLIENT=\"\$SSH_CLIENT\" SSH_TTY=\"\$SSH_TTY\" \
      HOME=\"\$HOME\" TERM=\"\$TERM\" \
      PATH=\"\$PATH\" SHELL=\"\$SHELL\" \
      USER=\"\$USER\" \$SHELL -i"
}

# Display available functions/readme
function wells_help() {
    # spit out the README while stripping ugly tags
    cat ~/.dotfiles/README.md | sed -r 's/<\/?pre>//'
}
alias wsettings="wells_help"
alias whelp="wells_help"

# Helper to safely remove and make symlinks
function symlink() {
    # If this isnt a symlink
    if [ ! -L "$2" ]; then
        # Backup the file
        mv "$2" "$2.backup" >/dev/null 2>&1

        # Now remove it, dirs too
        rm -rf "$2" >/dev/null 2>&1
    fi

    # If the target is already a symlink
    if [ -L "$2" ]; then
        rm "$2" >/dev/null 2>&1
    fi

    # Create that symlink!
    ln -s $1 $2
}
