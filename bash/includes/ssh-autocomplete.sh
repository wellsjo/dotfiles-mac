#!/bin/bash

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
function _ssh_reload_autocomplete() {

if [ -f ~/.ssh/config ];
then
  complete -o default -o nospace -W "$(grep -i -e '^host ' ~/.ssh/config | awk '{print substr($0, index($0,$2))}' ORS=' ')" ssh scp sftp
fi
}

_ssh_reload_autocomplete
