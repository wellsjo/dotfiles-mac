#!/bin/bash

# TODO turn this into a generic clean function
# find /tmp -name '*.swp' -exec rm {} \;

# function cleanup( )
# {
#   # echo "$1"
#   # find $PWD -name "*.$1" - exec rm {} \;
# }

function up( )
{
  LIMIT=$1
  P=$PWD
  for ((i=1; i <= LIMIT; i++))
  do
    P=$P/..
  done
  cd $P
  export MPWD=$P
}

function back( )
{
  LIMIT=$1
  P=$MPWD
  for ((i=1; i <= LIMIT; i++))
  do
    P=${P%/..}
  done
  cd $P
  export MPWD=$P
}
