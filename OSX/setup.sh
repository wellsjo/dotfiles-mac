#!/bin/bash

######################
# Get set up on OSX! #
######################

###
# First you are going to want to accept XCode's terms/conditions
# and download their developer tools (which inclues git)
#

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# commonly used software
brew install tmux
brew install reattach-to-user-namespace
brew install htop
brew install git-extras

# node/npm
mkdir ~/.nave
cd ~/.nave
wget http://github.com/isaacs/nave/raw/master/nave.sh
sudo ln -s $PWD/nave.sh /usr/local/bin/nave
nave usemain $(nave stable)

# node modules
npm i serve -g

# programming languages
brew install python

# pip
cd ~
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
