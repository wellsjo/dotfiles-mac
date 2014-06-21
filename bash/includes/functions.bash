#!/bin/bash

# Simple helper to remove and make symlinks
function h.symlink() {
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


# Setup the dotfiles repo locally, or pull latest version from github.
# Create symlinks in the $HOME directory to elements in the repo
jpull() {
    local REPO='https://github.com/wellsjo/wells_dotfiles'
    local SGITURL="https://github.com/jhuntwork/.dotfiles/raw/e374d0dbc1754b21a3d36b9df5742d351d7fe460/git-static-x86_64-linux-musl.tar.xz"
    local SGITPATH="${HOME}/.git-static"
    local SGIT=git

    # If not installed globally already
    if ! ${SGIT} --version >/dev/null 2>&1 ; then
        SGIT="${SGITPATH}/git --exec-path=${SGITPATH}/git-core"

        # If the static version isnt available
        if ! ${SGIT} --version >/dev/null 2>&1 ; then
            cd ${HOME}
            curl -sL ${SGITURL} | tar -xJf -
        fi
    fi

    # If the dotfiles dir already exists
    if [ -d "${HOME}/.wells_dotfiles" ] ; then
        cd "${HOME}/.wells_dotfiles"
        ${SGIT} reset --hard HEAD >/dev/null 2>&1
        ${SGIT} pull
        ${SGIT} submodule init
        ${SGIT} submodule update
    else
        cd "${HOME}"
        ${SGIT} clone --depth 1 ${REPO} .wells_dotfiles
        cd "${HOME}/.wells_dotfiles"
        ${SGIT} submodule init
        ${SGIT} submodule update
    fi

    h.symlink "${HOME}/.wells_dotfiles/vim/vimrc" "${HOME}/.vimrc"
    h.symlink "${HOME}/.wells_dotfiles/vim" "${HOME}/.vim"
    h.symlink "${HOME}/.wells_dotfiles/bash/profile" "${HOME}/.profile"
    h.symlink "${HOME}/.wells_dotfiles/bash/profile" "${HOME}/.bashrc"
    h.symlink "${HOME}/.wells_dotfiles/bash" "${HOME}/.bash"
    h.symlink "${HOME}/.wells_dotfiles/git/gitconfig" "${HOME}/.gitconfig"
    h.symlink "${HOME}/.wells_dotfiles/git/gitignore_global" "${HOME}/.gitignore_global"

    cd "${HOME}"

    # Delete any broken symlinks in the homedir
    find -L . -maxdepth 1 -type l -exec rm -- {} +

    # Source the profile to get things going
    . "${HOME}/.profile"
}

alias wells_setup_init="jpull"

# Simple wrapper for ssh which makes jpull() available in the remote session
# regardless of whether .dotfiles is present remotely or not
jssh() {
    local func=$(typeset -f jpull)
    local func2=$(typeset -f symlink)
    ssh -A -t "$@" \
    "${func2} ;
    ${func} ;
    [ -r /etc/motd ] && cat /etc/motd ;
    [ -r \"\$HOME/.profile\" ] && . \"\$HOME/.profile\" ;
    type jssh >/dev/null 2>&1 || jpull ;
    exec env -i SSH_AUTH_SOCK=\"\$SSH_AUTH_SOCK\" \
      SSH_CONNECTION=\"\$SSH_CONNECTION\" \
      SSH_CLIENT=\"\$SSH_CLIENT\" SSH_TTY=\"\$SSH_TTY\" \
      HOME=\"\$HOME\" TERM=\"\$TERM\" \
      PATH=\"\$PATH\" SHELL=\"\$SHELL\" \
      USER=\"\$USER\" \$SHELL -i"
}
alias wellssh="jssh"
