#!/bin/bash

set -e

# Make sure this script is run from the same directory
dir=`pwd`
if [ ! -e "${dir}/$(basename $0)"  ]; then
  echo "Script not called from within repository directory. Aborting."
  exit 2
fi

# Prompt for y/n when installing
# http://djm.me/ask
ask() {
  while true; do

    if [ "${2:-}" = "Y"  ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N"  ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi

    # Ask the question
    read -p "$1 [$prompt] " REPLY

    # Default?
    if [ -z "$REPLY"  ]; then
      REPLY=$default
    fi

    # Check if the reply is valid
    case "$REPLY" in
      Y*|y*) return 0 ;;
      N*|n*) return 1 ;;
    esac

  done
}

# Symlink helper function
symlink() {
  # If this isnt a symlink (and the file exists)
  if [ ! -L "$2" ] && [ -f "$2" ]; then
    # Backup the file
    mv "$2" "$2.backup" >/dev/null 2>&1
    echo -e "$2 --> $2.backup"

    # Now remove it, dirs too
    rm -rf "$2" >/dev/null 2>&1
  fi

  # If the target is already a symlink
  if [ -L "$2" ]; then
    rm "$2" >/dev/null 2>&1
  fi

  # Create symlink
  ln -s $1 $2
  echo -e "$1 --> $2"
}

# Removes broken symlinks
clean_symlinks() {
  find -L . -maxdepth 1 -type l -exec rm -- {} +
}

# Install vim and plugins
setup_vim() {
  symlink ${dir}/vimrc ${HOME}/.vimrc
  symlink ${dir}/config/vim ${HOME}/.vim
  vim +PlugInstall +qall +silent
}

# Installs LiquidPrompt
setup_liquid_prompt() {
  rm -rf ${dir}/extra/liquidprompt/
  git clone git@github.com:nojhan/liquidprompt.git ${dir}/extra/liquidprompt
  symlink ${dir}/extra/liquidprompt/liquidpromptrc-dist ${HOME}/.liquidpromptrc
  cat <<EOT >> ~/.localprofile
if [ -e ~/.liquidpromptrc ]; then
  source ~/.dotfiles/extra/liquidprompt/liquidprompt
  LP_PS1_PREFIX="\n"
  LP_PS1_POSTFIX="\n> "
  LP_MARK_DEFAULT=""
fi
EOT
}

# Symlink bash dotfiles
setup_bash() {
  symlink ${dir}/bashrc ${HOME}/.bashrc
  symlink ${dir}/bash_profile ${HOME}/.bash_profile
  symlink ${dir}/bash_profile ${HOME}/.profile
}

setup_wm() {
  symlink ${dir}/config/i3 ${HOME}/.config/i3
  symlink ${dir}/config/compton ${HOME}/.config/compton
}

# Ask to install everything
ask "Install bash settings?" Y && setup_bash
ask "Install tmux config?" Y && symlink ${dir}/config/tmux/tmux.conf ${HOME}/.tmux.conf
ask "Install vim settings and plugins?" Y && setup_vim
ask "Install LiquidPrompt? (requires git)" Y && setup_liquid_prompt
ask "Install git config?" Y && symlink ${dir}/gitconfig ${HOME}/.gitconfig
ask "Install gitignore_global?" Y && symlink ${dir}/gitignore_global ${HOME}/.gitignore_global
ask "Install Termite settings?" Y && symlink ${dir}/config/termite ${HOME}/.config/termite
ask "Install window manager settings? (i3/compton)" Y && setup_wm
ask "Install Xresources?" Y && symlink ${dir}/Xresources ${HOME}/.Xresources
ask "Install xinitrc?" Y && symlink ${dir}/xinitrc ${HOME}/.xinitrc

clean_symlinks
