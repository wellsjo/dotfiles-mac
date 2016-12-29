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
)
```

## Aliases
```bash
# Shorthand
alias h="cd ~"
alias l="ls -lha"
alias la="ls -lha"
alias c="clear"
alias ..="cd .."

# git
alias gc="git commit -m $1"
alias ga="git add -p"
alias gs="git status"
alias gb="git branch"
alias gp="git push"
alias gd="git diff"
alias gl="git log"
alias lastcommit="git diff HEAD^ HEAD"

# tmux
alias t="tmux -2"
alias ta="tmux -2 attach"
```

## Dependencies
- tmux
- git
- node / npm
