#!/usr/bin/env bash
#
# \file  uninstall.sh
# \brief build project
#


SUDO="sudo"

if [[ "${OSTYPE}" == "win"* || "${OSTYPE}" == "msys"* ]]; then
	SUDO=""
fi

# vars
DIR_BUILD="../CMakeLib_build"

# Uninstall
echo "Uninstall ..."

cd $DIR_BUILD

${SUDO} cmake --build . --target uninstall
