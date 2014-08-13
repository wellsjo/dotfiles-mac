#!/bin/bash

# saves ssh config so that it can be restored in a tmux session
function ssh-save()
{
    SSHVARS="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"

    for x in ${SSHVARS} ; do
        (eval echo $x=\$$x) | sed  's/=/="/
        s/$/"/
        s/^/export /'
    done 1>${HOME}/.fixssh
}

function ssh-restore()
{
    . ${HOME}/.fixssh
}
