#--------------------------------------------------------------------------------------------------
# \file  CMakeLists.txt
# \brief Install CMakeLib as modules
#
# In project use CMake:
#
# find_package(CMakeLib  REQUIRED)
#--------------------------------------------------------------------------------------------------


project("CMakeLib")
cmake_minimum_required(VERSION 3.5.0)

#--------------------------------------------------------------------------------------------------
# install

# dirs
install(
    DIRECTORY
        ${CMAKE_SOURCE_DIR}
    DESTINATION
        ${CMAKE_ROOT}/Modules
    FILES_MATCHING
        PATTERN "*"
        PATTERN ".git"               EXCLUDE
        PATTERN ".gitignore"         EXCLUDE
        PATTERN "CMakeLists.txt"     EXCLUDE
        PATTERN "Templates"          EXCLUDE
        PATTERN "install.sh"         EXCLUDE
        PATTERN "uninstall.sh"       EXCLUDE
        PATTERN "FindCMakeLib.cmake" EXCLUDE
        PATTERN "Uninstall.cmake"    EXCLUDE
        PATTERN "Uninstall.cmake"    EXCLUDE
        PATTERN "Readme.md"          EXCLUDE)

# files
install(
    FILES
        FindCMakeLib.cmake
    DESTINATION
        ${CMAKE_ROOT}/Modules)

#--------------------------------------------------------------------------------------------------
# uninstall
set(TARGET_DIR ${CMAKE_ROOT}/Modules/CMakeLib)
message(STATUS "TARGET_DIR: ${TARGET_DIR}")

add_custom_target(uninstall
	COMMAND
		${CMAKE_COMMAND}
		-DPROJECT_INSTALL_PATH=${TARGET_DIR}
		-P ${CMAKE_SOURCE_DIR}/Uninstall.cmake)
#--------------------------------------------------------------------------------------------------
