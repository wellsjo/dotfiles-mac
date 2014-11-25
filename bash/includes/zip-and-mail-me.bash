#!/bin/bash

mail-me-file() {
    if [[ "h" -eq $1 ]]; then
        echo "mail-me-file [path to file] [recipient address]"
        return 1
    fi
    zip -r wells-file.zip $1
    uuencode wells-file.zip | mail -v -s "file sent from myself" -F $2
    rm wells-file.zip
}
