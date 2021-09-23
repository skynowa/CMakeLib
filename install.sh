#!/usr/bin/env bash
#
# \file  install.sh
# \brief build project
#


# vars
PROJECT_NAME="CMakeLib"
DIR_PROJECT="$PWD"
DIR_BUILD='../${PROJECT_NAME}_build'

# Build
echo "Build/Install ..."

mkdir -p $DIR_BUILD
cd $DIR_BUILD

# sudo
cmake $DIR_PROJECT
cmake --build . --target install
