#!/usr/bin/env bash
#
# \file  uninstall.sh
# \brief build project
#


# vars
DIR_BUILD="../CMakeLib_build"


# Uninstall
echo "Uninstall ..."

cd $DIR_BUILD

sudo cmake --build . --target uninstall
