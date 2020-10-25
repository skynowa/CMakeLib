#--------------------------------------------------------------------------------------------------
# \file  FindSsh2.cmake
# \brief Find the native SSH2 includes and library
#
# cmSSH2_FOUND     - true if system has the libssh2 library
# cmSSH2_INCLUDES  - the libssh2 include directory
# cmSSH2_LIBRARIES - the libssh2 library name
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(cmSSH2_INCLUDES
    NAMES
        "libssh2.h"
    PATHS
        "/usr/include"
        "/usr/local/include"
    PATH_SUFFIXES
        "")

find_library(cmSSH2_LIBRARIES
    NAMES
        "ssh2"
    PATHS
        "/lib"
        "/lib64"
        "/usr/lib"
        "/usr/lib64"
        "/usr/lib/x86_64-linux-gnu"
        "/usr/local/lib"
        "/usr/local/lib64"
    PATH_SUFFIXES
        "")

if (NOT cmSSH2_INCLUDES AND cmSSH2_LIBRARIES)
    set(cmSSH2_FOUND 0)
else()
    set(cmSSH2_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmSSH2_FOUND: ${cmSSH2_FOUND}")
message("   cmSSH2_INCLUDES:  ${cmSSH2_INCLUDES}")
message("   cmSSH2_LIBRARIES: ${cmSSH2_LIBRARIES}")

if (NOT cmSSH2_FOUND AND Ssh2_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
