#!/bin/bash

reload_cms() {
# cms
console doctrine:database:drop --connection=cms --force
console doctrine:database:create --connection=cms
console doctrine:schema:create --em=cms
console doctrine:fixtures:load --em=cms --fixtures=Symfony/src/Spotify/LegalCmsBundle/DataFixtures/ORM --no-interaction
console doctrine:fixtures:load --em=cms --fixtures=Symfony/src/Spotify/BrandsCmsBundle/DataFixtures/ORM --no-interaction

# translations_cms
console doctrine:database:drop --connection=translations_cms --force
console doctrine:database:create --connection=translations_cms
console doctrine:schema:create --em=translations_cms
console doctrine:fixtures:load --em=translations_cms --fixtures=Symfony/src/Spotify/TranslationsBundle/DataFixtures/ORM --no-interaction
}
