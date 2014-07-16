#!/bin/bash

function wells_help() {
    # spit out the README while stripping ugly tags
    cat .wells_dotfiles/README.md | sed -r 's/<\/?pre>//'
}

alias wsettings="wells_help"
alias whelp="wells_help"
