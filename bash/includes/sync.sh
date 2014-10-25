#!/bin/bash

# @author Wells Johnston <w@wellsjohnston.com>

website_sync() {

    if [[ $1 = "--help" || $1 = '-h' || $1 = '' ]];
    then
        echo
        echo "sync <location> <destination>"
        echo
    fi

    local file_excludes=( '*.png' '*.jpg' '*.jpeg' '*.mp4' '*/cache' '*.swp' '*.gif' '*/vendor' '*/.git' '*.zip' '*.pdf' '*.svg' '*.psd' '*.ttf' '*.woff' '*.pptx' '*.flv' '*/node_modules' )
    local exclude_string=""
    for i in "${file_excludes[@]}"
    do
        exclude_string="$exclude_string --exclude=$i"
    done

    rsync --delete $exclude_string -avrz -e ssh $1 $2
}
alias wsync="website_sync"
