#!/bin/bash

# @author Wells Johnston <w@wellsjohnston.com>

website_sync() {

    if [[ $1 = "up" ]];
    then
        local path="/Users/wells/src/web-site +www.bananajams.cloud.spotify.net:/home/wells/src"
    elif [[ $1 = "down" ]];
    then
        local path="+www.bananajams.cloud.spotify.net:/home/wells/src /Users/wells/src/web-site"
    fi

    local file_excludes=( '*.png' '*.jpg' '*.jpeg' '*.mp4' '*/cache' '*.swp' '*.gif' '*/vendor' '*/.git' '*.zip' '*.pdf' '*.svg' '*.psd' '*.ttf' '*.woff' '*.pptx' '*.flv' '*/node_modules' '*.vimhook*' )
    local exclude_string=""
    for i in "${file_excludes[@]}"
    do
        exclude_string="$exclude_string --exclude=$i"
    done

    rsync --delete $exclude_string -avrz -e ssh $path
}
alias wsync="website_sync"
