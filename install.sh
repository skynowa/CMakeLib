#!/usr/bin/env bash
#
# \file  install.sh
# \brief Install CMakeLib as modules
#
# Sample:
#
# In project use CMake:
#	set(CMAKE_MODULE_PATH "/usr/share/cmake-3.12/Modules/CMakeLib/;${CMAKE_MODULE_PATH}")
#


CMAKE_VERSION_MAJOR=`cmake --version | head -n1 | awk '{print $3}' | awk -F "." '{print $1"."$2}'`
CMAKELIB_INSTALL_PATH="/usr/share/cmake-${CMAKE_VERSION_MAJOR}/Modules"

sudo ln -s ${PWD} ${CMAKELIB_INSTALL_PATH}

echo -e "CMakelib: Symlink ${CMAKELIB_INSTALL_PATH} installed."
