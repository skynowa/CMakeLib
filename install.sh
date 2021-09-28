#!/usr/bin/env bash
#
# \file  install.sh
# \brief build project
#

set -ex

SUDO="sudo"

echo "OSTYPE: ${OSTYPE}"

# TODO: MSVC - check
if   [[ "${OSTYPE}" == "msys" ]]; then
	SUDO=""
elif [[ "${OSTYPE}" == "win"* ]]; then
	SUDO=""
fi

# vars
PROJECT_NAME="CMakeLib"
DIR_PROJECT="$PWD"
DIR_BUILD="../${PROJECT_NAME}_build"

# Build
echo "Build/Install ..."

mkdir -p $DIR_BUILD
cd $DIR_BUILD

# sudo
cmake $DIR_PROJECT
${SUDO} cmake --build . --target install
