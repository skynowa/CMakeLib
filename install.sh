#!/usr/bin/env bash
#
# \file  install.sh
# \brief build project
#


# vars
DIR_PROJECT="$PWD"
DIR_BUILD="../CMakeLib_build"


# build
mkdir -p $DIR_BUILD
cd $DIR_BUILD

cmake $DIR_PROJECT
sudo cmake --build . --target install
