#--------------------------------------------------------------------------------------------------
# \file  CMakeLists.txt
# \brief CMakeLib - install as modules
#
# In project use CMake:
#
# find_package(CMakeLib REQUIRED)
#--------------------------------------------------------------------------------------------------


cmake_minimum_required(VERSION 3.15)
#--------------------------------------------------------------------------------------------------
project("CMakeLib")
#--------------------------------------------------------------------------------------------------
# install
message(STATUS "CMAKE_ROOT: ${CMAKE_ROOT}")

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
        PATTERN "FindCMakeLib.cmake" EXCLUDE
        PATTERN "Templates"          EXCLUDE
        PATTERN "install.sh"         EXCLUDE
        PATTERN "uninstall.sh"       EXCLUDE)

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
