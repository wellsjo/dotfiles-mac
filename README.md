This is my portable development setup.  I use a combination of vim, tmux, git, and shell scripts to get things done.  My dotfiles also come with a bunch of useful functions and aliases available in bash.

To install manually, simply clone this repo, source dotfiles/bash/profile, then type ```wells_install```.  Or just copy this line:

<pre>
git clone git@github.com:wellsjo/dotfiles.git ~/.dotfiles && source ~/.dotfiles/bash/profile && wells_install
</pre>

That line clones this repository and then sets symlinks to the bash, vim, and git dotfiles from the home directory.  Type 'whelp' to get a list of functions and commands available.  Enjoy

####Bash
<pre>
wellssh             # ssh into a remote server install dotfile setup from this repository

winstall            # this is used by wssh to install my dotfiles upon entering a remote machine.
                    # alternatively, you can just clone this repository, source the profile located
                    # in dotfiles/bash/profile, then run winstall.  This is explained above.

up <number>         # cd back <number> times
back <number>       # go back <number> in cd history
..                  # go up one directory (alias for "cd ..")
l                   # alias for "ls -lh"
la                  # alias for "ls -lah"

gs                  # git status
gl                  # git log
gd                  # git diff
gb                  # git branch

t                   # tmux -2
ta                  # tmux -2 attach

countdown <number>  # countdown number of seconds in the terminal
</pre>

####Vim
<pre>
### Miscellaneous Shortcuts
m                 # open recently used filesc (MRU)
gt                # go forward a tab
gr                # go back a tab
gc                # toggle comment on selected
gcc               # toggle comment on line

ctrl-f            # :w shorthand
Q                 # :wq shorthand
ctrl-g            # highlight search word under cursor
ctrl-h            # toggle highlight

sudow             # force-save a read-only file (VERY USEFUL)

\                 # toggle NerdTree
;;                # global search/replace shorthand
,,                # toggle c-tags taglist

### Movement
s                 # open buffer in vertial split
h                 # open buffer in horizontal split
ctrl-k            # go up window
ctrl-j            # go down window
ctrl-O            # previous window
ctrl-P            # next window

### surround.vim
ysiw(char)        # surround selection with (char)
yss(char)         # surround sentence with (char)
cs(char1)(char2)  # change surrounding (char1) with (char2)
ds(char)          # remove (char) from surrounding
S(char)           # surround selection with (char) in visual mode

### EasyMotion
(space)s(char)    # search for (char)
(space)w          # search word forward
(space)b          # search word back

### FZF
cntrl-t           # fuzzy file search

### Fugitive
:Gblame           # git blame
:Git (command)    # any git command
</pre>

##Dependencies
- ack v2.0+
- tmux
- exuberant-ctags

```bash
brew install ack
brew install tmux
brew install ctags
ctags -R .                # assuming this is the directory you want to index
ctags -R -f ./.git/tags . # to install to a more appropriate location
```
