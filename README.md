# Dotfiles
Modular dotfiles setup I use for macOS and Arch Linux. Feel free to use, but please read through everything before installing.

### Available Configs
- vim
- tmux
- git
- compton
- i3, i3gaps, i3blocks
- LiquidShell (prompt)

### Included Scripts
- git auto-completion
- ssh auto-completion

## Before Installing
- You will want to edit `gitconfig` as it uses my name and email
- You should be aware that my compton config is optimized for my NVIDIA Titan X (pascal) GPU

## Install
Paste this in the terminal. It will clone the repo, source the bash profile, then run an install script.
```bash
git clone git@github.com:wellsjo/dotfiles.git ~/.dotfiles; cd ~/.dotfiles; bash setup
```
