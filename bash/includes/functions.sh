#!/bin/bash

# TODO turn this into a generic clean function
# find /tmp -name '*.swp' -exec rm {} \;

function cleanup( )
{
  find . -name "*.$1" -exec rm {} \;
}

function up( )
{
  LIMIT=$1
  P=$PWD
  for ((i=1; i <= LIMIT; i++))
  do
    P=$P/..
  done
  cd $P
  export MPWD=$P
}

function back( )
{
  LIMIT=$1
  P=$MPWD
  for ((i=1; i <= LIMIT; i++))
  do
    P=${P%/..}
  done
  cd $P
  export MPWD=$P
}

# Simple wrapper for ssh which makes wells_update() available in the remote session
# regardless of whether .dotfiles is present remotely or not
sshw() {
  local func=$(typeset -f wells_install)
  local func2=$(typeset -f symlink)
  ssh -A -t "$@" \
    "${func2} ;
  ${func} ;
  [ -r /etc/motd ] && cat /etc/motd ;
  [ -r \"\$HOME/.profile\" ] && . \"\$HOME/.profile\" ;
  type wellssh >/dev/null 2>&1 ||  wells_update;
  exec env -i SSH_AUTH_SOCK=\"\$SSH_AUTH_SOCK\" \
    SSH_CONNECTION=\"\$SSH_CONNECTION\" \
    SSH_CLIENT=\"\$SSH_CLIENT\" SSH_TTY=\"\$SSH_TTY\" \
    HOME=\"\$HOME\" TERM=\"\$TERM\" \
    PATH=\"\$PATH\" SHELL=\"\$SHELL\" \
    USER=\"\$USER\" \$SHELL -i"
}

