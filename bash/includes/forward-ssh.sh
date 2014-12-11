#!/bin/sh

# this is to save my ssh credentials that have been fowarded, so they can be picked up by a tmux session
# basic strategy is to take ssh creds and save them as variables in "latestagent".  Then when a tmux session starts,
# export those variables into the session by typing executing "fixssh"

SSHVARS="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"

for var in ${SSHVARS} ; do
  echo "export $var=\"$(eval echo '$'$var)\""
done 1>$HOME/.ssh/latestagent

alias fixssh="source ~/.ssh/latestagent"
