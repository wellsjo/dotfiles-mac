# Dotfiles
My portable dev environment (OSX, Linux)
- vim config
- tmux config
- git config
- liquid shell prompt
- vim auto-completion
- git auto-completion
- ssh auto-completion

## Install
Paste this in the terminal. It will clone the repo, source the bash profile, then run an install script.
```bash
(
  git clone git@github.com:wellsjo/dotfiles.git ~/.dotfiles; 
  source ~/.dotfiles/bash/profile; 
  install_dotfiles; 
  vim +PlugInstall +qall +silent; 
  cd .dotfiles/vim/plugged/completor.vim && make js
)
```

## Dependencies
- tmux
- git
- node / npm
