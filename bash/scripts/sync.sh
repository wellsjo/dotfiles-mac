#!/bin/bash

# @author Wells Johnston <w@wellsjohnston.com>

# ./sync (--down|--up) location destionation

if [[ $1 -eq "--down" ]];
then
    rsync --delete -avrz -e ssh -f"- .git/" -f"- .settings" -f"- .buildpath" -f"- .project" -f"- .DS_Store" -f"+ *" +$2 $3
else if [[ $1 -eq "--up" ]]
then
    rsync --delete --exclude Symfony/app/cache --exclude Symfony/build -avrz -e ssh -f"- .git/" -f"- .settings" -f"- .build path" -f"- .project" -f"- .DS_Store" -f"+ *" $3 $2
fi
