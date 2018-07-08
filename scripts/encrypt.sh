#!/usr/bin/env bash

# ./encrypt -e file
# ./encrypt -d file

#encrypt files
function encrypt() {
  if [ $1 == "-e" ];
  then
    if [ -f "$2" ];
    then
      openssl aes-256-cbc -e -salt -in "$2" -out "$2.aes"
    else
      echo "This file does not exist!" 
    fi
    #decrypt files
  elif [ $1 == "-d" ];
  then
    if [ -f "$2" ];
    then
      openssl aes-256-cbc -d -salt -in "$2" -out "$2.decrypt"
    else
      echo "This file does not exist!" 
    fi
    #show help
  elif [ $1 == "--help" ];
  then
    echo "This software uses openssl for encrypting files with the aes-256-cbc cipher"
    echo "Usage for encrypting: ./encrypt -e [file]"
    echo "Usage for decrypting: ./encrypt -d [file]"
  else
    echo "This action does not exist!"
    echo "Use ./encrypt --help to show help."
  fi
}
