#!/bin/bash
#
# this script is used with the ~/Library/LaunchAgents/sync.web-site-up to sync
# the ~/src/web-site directory to a VM

# which vm are you using?
vm="bananajams"

# Where do we want to sync?
website="/Users/wells/src/web-site +www.wells.cloud.spotify.net:/home/wells/src"
vim="/Users/wells/.vim +www.bananajams.cloud.spotify.net:/home/wells/"

src=$vim

rsync --delete --exclude Symfony/app/cache --exclude Symfony/build -avrz -e ssh -f"- .git/" -f"- .settings" -f"- .build path" -f"- .project" -f"- .DS_Store" -f"+ *" $src
