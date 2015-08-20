This is my portable development setup.  I use a combination of vim, tmux, git, and shell scripts to get things done.  My dotfiles also come with a bunch of useful functions and aliases available in bash.

To install manually, simply clone this repo, source dotfiles/bash/profile, then type ```wells_install```.  Or just copy this line:

<pre>
git clone git@github.com:wellsjo/dotfiles.git ~/.dotfiles; \
source ~/.dotfiles/bash/profile; \
wells_install;

</pre>

### Fugitive
:Gblame           # git blame
:Git (command)    # any git command
</pre>

##Dependencies
- ack v2.0+
- tmux
- exuberant-ctags
