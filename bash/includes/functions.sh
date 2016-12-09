#!/bin/bash

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
