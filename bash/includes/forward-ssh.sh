#!/bin/sh

# Pass SSH credentials to a tmux session

# This is to save my ssh credentials that have been fowarded, so they can be picked up by a tmux session
# basic strategy is to take ssh creds and save them as variables in "latestagent".  Then when a tmux session starts,
# export those variables into the session by typing executing "fixssh"

# @author Wells Johnston <w@wellsjohnston.com>

# doesn't work on mac
if [ $(uname) != "Darwin" ]; then
  SSHVARS="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"

  for var in ${SSHVARS} ; do
    echo "export $var=\"$(eval echo '$'$var)\""
  done 1>$HOME/.ssh/latestagent

  alias fixssh="source ~/.ssh/latestagent"
fi
