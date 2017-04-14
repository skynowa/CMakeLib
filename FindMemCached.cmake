#--------------------------------------------------------------------------------------------------
# \file  FindMemCached.cmake
# \brief Find MemCached includes and library
#
# MEMCACHED_FOUND     - true if system has library
# MEMCACHED_INCLUDES  - include directories
# MEMCACHED_LIBRARIES - libraries
# xHAVE_MEMCACHED     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(MEMCACHED_INCLUDES
    NAMES
        "memcached.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "libmemcached")

find_library(MEMCACHED_LIBRARIES
    NAMES
        "memcached"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "memcached")

if (NOT (MEMCACHED_INCLUDES AND MEMCACHED_LIBRARIES))
    set(MEMCACHED_FOUND 0)
    set(MEMCACHED_INCLUDES "")
    set(MEMCACHED_LIBRARIES "")
else()
    set(MEMCACHED_FOUND 1)
    set(xHAVE_MEMCACHED 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT MEMCACHED_FOUND AND MemCached_FIND_REQUIRED)
    message(FATAL_ERROR "MEMCACHED_FOUND: ${MEMCACHED_FOUND}")
else()
    message(STATUS "MEMCACHED_FOUND: ${MEMCACHED_FOUND}")
    # message("     MEMCACHED_INCLUDES: ${MEMCACHED_INCLUDES}")
    # message("     MEMCACHED_LIBRARIES: ${MEMCACHED_LIBRARIES}")
endif()
#--------------------------------------------------------------------------------------------------
