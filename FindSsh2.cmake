#--------------------------------------------------------------------------------------------------
# \file  FindSsh2.cmake
# \brief Find the native SSH2 includes and library
#
# SSH2_FOUND     - true if system has the libssh2 library
# SSH2_INCLUDES  - the libssh2 include directory
# SSH2_LIBRARIES - the libssh2 library name
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(SSH2_INCLUDES
    NAMES "libssh2.h"
    PATH_SUFFIXES "")

find_library(SSH2_LIBRARIES
    NAMES
        ssh2
    PATHS
        "/lib"   "/usr/lib"   "/usr/local/lib"
        "/lib64" "/usr/lib64" "/usr/local/lib64"
    PATH_SUFFIXES
        "")

if (NOT (SSH2_INCLUDES AND SSH2_LIBRARIES))
    set(SSH2_FOUND 0)
    set(SSH2_INCLUDES "")
    set(SSH2_LIBRARIES "")
else()
    set(SSH2_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT SSH2_FOUND AND SSH2_FIND_REQUIRED)
    message(FATAL_ERROR "SSH2_FOUND: ${SSH2_FOUND}")
else()
    # message(STATUS "SSH2_FOUND: ${SSH2_FOUND}")
    # message("     SSH2_INCLUDES: ${SSH2_INCLUDES}")
    # message("     SSH2_LIBRARIES: ${SSH2_LIBRARIES}")
endif()
#--------------------------------------------------------------------------------------------------
