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

wells_update() {

    echo -e "\nUpdating git repo...\n"
    echo -e "Applying changes...\n"

    read -p "Do you want to update the git repository? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        cd ~/.wells_dotfiles
        git diff
        git add .
        git commit -m "updating from wells_update"
        git push
        cd ..
    fi

    echo -e "\nRe-sourcing wells_dotfiles..."
    . "${HOME}/.profile"

    echo -e "\nDone!"
}

alias wupdate="wells_update"

# Setup the dotfiles repo locally, or pull latest version from github.
# Create symlinks in the $HOME directory to elements in the repo
wells_install() {

    echo -e "\nInstalling wells_dotfiles..."

    local REPO='https://github.com/wellsjo/wells_dotfiles'
    local SGITURL="https://github.com/jhuntwork/.dotfiles/raw/e374d0dbc1754b21a3d36b9df5742d351d7fe460/git-static-x86_64-linux-musl.tar.xz"
    local SGITPATH="${HOME}/.git-static"
    local SGIT=git

    # If not installed globally already
    if ! ${SGIT} --version >/dev/null 2>&1 ; then
        echo "Git doesn't seem to be installed."
        echo "Fixing that..."
        SGIT="${SGITPATH}/git --exec-path=${SGITPATH}/git-core"

        # If the static version isnt available
        if ! ${SGIT} --version >/dev/null 2>&1 ; then
            cd ${HOME}
            curl -sL ${SGITURL} | tar -xJf -
        fi
    fi

    # If the dotfiles dir already exists
    if [ -d "${HOME}/.wells_dotfiles" ] ; then
        echo "wells_dotfiles are already present."
        cd "${HOME}/.wells_dotfiles"
        ${SGIT} reset --hard HEAD >/dev/null 2>&1
        echo "Updating from git repo..."
        ${SGIT} pull
        ${SGIT} submodule init
        ${SGIT} submodule update
    else
        echo "wells_dotfiles not present"
        echo -e "Cloning git repo from ${REPO}..."
        cd "${HOME}"
        ${SGIT} clone --depth 1 ${REPO} .wells_dotfiles
        cd "${HOME}/.wells_dotfiles"
        ${SGIT} submodule init
        ${SGIT} submodule update
    fi

    echo -e "\nSetting symlinks..."
    h.symlink "${HOME}/.wells_dotfiles/vim/vimrc" "${HOME}/.vimrc"
    h.symlink "${HOME}/.wells_dotfiles/vim" "${HOME}/.vim"
    h.symlink "${HOME}/.wells_dotfiles/bash/profile" "${HOME}/.profile"
    h.symlink "${HOME}/.wells_dotfiles/bash/profile" "${HOME}/.bashrc"
    h.symlink "${HOME}/.wells_dotfiles/bash" "${HOME}/.bash"
    h.symlink "${HOME}/.wells_dotfiles/git/gitconfig" "${HOME}/.gitconfig"
    h.symlink "${HOME}/.wells_dotfiles/git/gitignore_global" "${HOME}/.gitignore_global"
    h.symlink "${HOME}/.wells_dotfiles/bash/fzf" "${HOME}/.fzf"

    cd "${HOME}"

    # Delete any broken symlinks in the homedir
    find -L . -maxdepth 1 -type l -exec rm -- {} +

    # Source the profile to get things going
    . "${HOME}/.profile"

    echo -e "\nDone!"
    echo -e "\nType 'wells_settings' to get a list of available commands"

}

alias winstall="wells_install"

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
