#!/bin/bash

# a countdown timer (seconds) for the terminal

countdown() {
  secs=$1
  while [ $secs -gt 0 ]; do
    echo -ne "$secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
}
