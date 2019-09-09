#!/bin/sh
#
# \file  uninstall.sh
# \brief build project
#


DIR_BUILD="../CMakeLib_build"

# install
echo "Uninstall ..."

cd $DIR_BUILD

sudo cmake --build . --target uninstall
