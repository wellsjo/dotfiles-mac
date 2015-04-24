#!/bin/bash

# Scripts related to Spotify development (not included in repo)
# @author Wells Johnston <w@wellsjohnston.com>

# Bash aliases
alias d="~/src/website/devify.sh --skip-language --auto"
alias vm="ssh -tA wells@www.captain-planet.cloud.spotify.net"
alias vm2="ssh -A trusty.flappy-bird.cloud.spotify.net"
alias jump="ssh -A wells@jump1.lon.spotify.net"

alias charts="ssh -A ghe-analytics.koolaid.cloud.spotify.net"

alias stage="ssh -A lon3-wwwstaging-a1"

alias prod1="ssh -A wells@lon2-www-a1.lon2.spotify.net"
alias prod2="ssh -A wells@lon2-www-a2.lon2.spotify.net"
alias prod3="ssh -A wells@lon2-www-a3.lon2.spotify.net"
alias prod4="ssh -A wells@lon2-www-a4.lon2.spotify.net"
alias prod5="ssh -A wells@lon2-www-a5.lon2.spotify.net"

# Development shortcuts
alias enablepuppet="sudo sppuppet enable-cron"
alias disablepuppet="sudo sppuppet disable-cron"
alias startpuppet="sudo sppuppet agent -vt"

sync_website_down() {
    rsync --delete --progress -a -f'- .git*' -f'- *.vimhook.sh' -f'- *.swp' -f'- **/cache' -f'- **/vendor' -f'- **/node_modules' +www.captain-planet.cloud.spotify.net:/home/wells/src/website /Users/wells/src
}

sync_website_up() {
    rsync --delete --progress -a -f'- .git*' -f'- *.vimhook.sh' -f'- *.swp' -f'- **/cache' -f'- **/vendor' -f'- **/node_modules' /Users/wells/src/website +www.captain-planet.cloud.spotify.net:/home
}

reload_cms() {
    cd ~/src/website/

    # cms
    console doctrine:database:drop --connection=cms --force
    console doctrine:database:create --connection=cms
    console doctrine:schema:create --em=cms
    console doctrine:fixtures:load --em=cms --fixtures=Symfony/src/Spotify/LegalCmsBundle/DataFixtures/ORM --no-interaction --append
    console doctrine:fixtures:load --em=cms --fixtures=Symfony/src/Spotify/BrandsCmsBundle/DataFixtures/ORM --no-interaction --append

    # translations_cms
    console doctrine:database:drop --connection=translations_cms --force
    console doctrine:database:create --connection=translations_cms
    console doctrine:schema:create --em=translations_cms
    console doctrine:fixtures:load --em=translations_cms --fixtures=Symfony/src/Spotify/TranslationsBundle/DataFixtures/ORM --no-interaction
}
