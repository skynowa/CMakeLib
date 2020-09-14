#--------------------------------------------------------------------------------------------------
# \file  FindSsh2.cmake
# \brief Find the native SSH2 includes and library
#
# cmSSH2_FOUND   - true if system has the libssh2 library
# SSH2_INCLUDES  - the libssh2 include directory
# SSH2_LIBRARIES - the libssh2 library name
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(SSH2_INCLUDES
    NAMES
        "libssh2.h"
    PATHS
        "/usr/include"
        "/usr/local/include"
    PATH_SUFFIXES
        "")

find_library(SSH2_LIBRARIES
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

if (NOT (SSH2_INCLUDES AND SSH2_LIBRARIES))
    set(cmSSH2_FOUND 0)
    set(SSH2_INCLUDES "")
    set(SSH2_LIBRARIES "")
else()
    set(cmSSH2_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmSSH2_FOUND: ${cmSSH2_FOUND}")
message("   SSH2_INCLUDES: ${SSH2_INCLUDES}")
message("   SSH2_LIBRARIES: ${SSH2_LIBRARIES}")

if (NOT cmSSH2_FOUND AND Ssh2_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
