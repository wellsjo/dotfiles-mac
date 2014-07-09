###Setup script:
<pre>
git clone git@github.com:wellsjo/wells_dotfiles.git .wells_dotfiles && source .wells_dotfiles/bash/profile && wells_install
</pre>

It clones this repository and then sets symlinks to the bash, vim, and git dotfiles.  Type 'whelp' to get a list of functions and commands available.  Enjoy

####Bash aliases & functions
<pre>
whelp      # get a list of available commands
wssh       # ssh into a remote server and installs my dotfile setup from this repository
winstall   # this is used by wssh to install my dotfiles upon entering a remote machine.
           # alternatively, you can just clone this repository, source the profile located 
           # in wells_dotfiles/bash/profile, then run winstall.  This is explained above.

wupdate    # updates dotfile settings from this repo.  optionally just updates locally.
wpush      # updates the remote repo.  you can fork this and go nuts, if you'd like.

ta         # tmux -2 attach
t          # tmux -2
..         # cd ..
ll         # ls -la

fe         # fuzzy find & open file in vim
fd         # fuzzy find & go to directory
fh         # fuzzy search repeat history
fkill      # fuzzy search & kill process(es)
</pre>

####Vim key mappings
<pre>
# Miscellaneous Shortcuts
gt                # go forward a tab
gr                # go back a tab
gc                # toggle comment

# surround.vim
ysiw(char)        # surround selection with (char)
yss(char)         # surround sentence with (char)
cs(char1)(char2)  # change surrounding (char1) with (char2)
ds(char)          # remove (char) from surrounding
S(char)           # surround selection with (char) in visual mode

# EasyMotion
(space)w        # search word forward
(space)b        # search word back
(space)s(char)  # search for (char) 

# FZF
cntrl-t         # fuzzy file search
cntrl-h         # toggle highlight

# Fugitive
:Gblame         # git blame
:Git (command)  # any git command
</pre>
