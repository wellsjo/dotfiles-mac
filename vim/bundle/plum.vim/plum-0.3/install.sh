#!/usr/bin/env bash

set -e

cd ./src
make -s
mkdir ../bin
mv plum_ambient_light ../bin
