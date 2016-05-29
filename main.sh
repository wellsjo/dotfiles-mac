#!/bin/bash

##
# Main functions used for controlling my setup
#
# @author  Wells Johnston <w@wellsjohnston.com>

# re-source dotfiles from git repo
wells_update() {
  echo -e "\nInstalling dotfiles..."
  DIR=$PWD
  cd "${HOME}/.dotfiles"
  git pull
  git submodule update --remote
  cd $DIR
}
alias wupdate="wells_update"

# Setup the dotfiles repo locally, or pull latest version from github.
# Create symlinks in the $HOME directory to elements in the repo
wells_install() {

  touch ~/.vim-undohist
  touch ~/.vim-backup

  echo -e "\nSetting symlinks..."
  symlink "${HOME}/.dotfiles/vim/vimrc" "${HOME}/.vimrc"
  symlink "${HOME}/.dotfiles/vim" "${HOME}/.vim"

  symlink "${HOME}/.dotfiles/bash/profile" "${HOME}/.profile"
  symlink "${HOME}/.dotfiles/bash/profile" "${HOME}/.bashrc"
  symlink "${HOME}/.dotfiles/bash/profile" "${HOME}/.bash_profile"

  symlink "${HOME}/.dotfiles/bash" "${HOME}/.bash"
  symlink "${HOME}/.dotfiles/git/gitconfig" "${HOME}/.gitconfig"
  symlink "${HOME}/.dotfiles/tmux/tmux.conf" "${HOME}/.tmux.conf"
  symlink "${HOME}/.dotfiles/bash/liquidprompt/liquidpromptrc-dist" "${HOME}/.liquidpromptrc"

  cd "${HOME}/.dotfiles"
  git submodule init
  git submodule update

  # source tmux
  echo -e "\nSourcing tmux..."
  tmux source ~/.tmux.conf

  cd "${HOME}"

  # Delete any broken symlinks in the homedir
  find -L . -maxdepth 1 -type l -exec rm -- {} +

  # Source the profile to get things going
  . "${HOME}/.profile"

  echo -e "\nDone!"
}
alias winstall="wells_install"

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

# Create symlink
ln -s $1 $2
}
