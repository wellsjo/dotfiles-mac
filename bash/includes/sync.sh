#!/bin/bash

# @author Wells Johnston <w@wellsjohnston.com>

# sync (--down|--up) location destionation

wells_sync() {
    if [[ $1 = "--help" || $1 = '-h' || $1 = '' ]];
    then
        echo
        echo "sync (--down|--up) <location> <destination>"
        echo
    fi
    if [[ $1 = "--down" ]];
    then
        rsync --delete -avrz -e ssh -f"- .git/" -f"- .settings" -f"- .buildpath" -f"- .project" -f"- .DS_Store" -f"+ *" +$2 $3
    elif [[ $1 = "--up" ]];
    then
        rsync --delete --exclude Symfony/app/cache --exclude Symfony/build -avrz -e ssh -f"- .git/" -f"- .settings" -f"- .build path" -f"- .project" -f"- .DS_Store" -f"+ *" $3 $2
    fi
}
alias wsync="wells_sync"
