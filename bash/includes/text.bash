#!/bin/bash

NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

function t.underline()
{
    printf "${UNDERLINE}$1${NORMAL}"

}
