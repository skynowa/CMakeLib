#--------------------------------------------------------------------------------------------------
# \file  CMakeLists.txt
# \brief Install CMakeLib as modules
#
# In project use CMake:
#
# # CMakeLib - CMAKE_MODULE_PATH
# set(CMAKE_MAJOR_MINOR_VERSION "${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}")
# set(CMAKE_DATA_DIR_DEFAULT    "/usr/share/cmake-${CMAKE_MAJOR_MINOR_VERSION}/Modules")
# set(CMAKE_MODULE_PATH         "${CMAKE_DATA_DIR_DEFAULT}/CMakeLib;${CMAKE_MODULE_PATH}")
#--------------------------------------------------------------------------------------------------


project("CMakeLib")
cmake_minimum_required(VERSION 2.6)

#--------------------------------------------------------------------------------------------------
include(FindGlobalVariables.cmake)
#--------------------------------------------------------------------------------------------------
# install
install(
    DIRECTORY
        ${CMAKE_SOURCE_DIR}
    DESTINATION
        ${CMAKE_DATA_DIR_DEFAULT}
    FILES_MATCHING
        PATTERN "*"
		PATTERN ".git"           EXCLUDE
		PATTERN ".gitignore"     EXCLUDE
		PATTERN "CMakeLists.txt" EXCLUDE
        PATTERN "Templates"      EXCLUDE
        PATTERN "install.sh"     EXCLUDE)
#--------------------------------------------------------------------------------------------------