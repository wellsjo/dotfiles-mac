#!/bin/bash

# Scripts related to Spotify development (not included in repo)
# @author Wells Johnston <w@wellsjohnston.com>

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
