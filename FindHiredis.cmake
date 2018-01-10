#--------------------------------------------------------------------------------------------------
# \file  FindHiredis.cmake
# \brief Find Hiredis includes and library
#
# HIREDIS_FOUND     - true if system has library
# HIREDIS_INCLUDES  - include directories
# HIREDIS_LIBRARIES - libraries
# xHAVE_HIREDIS     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(HIREDIS_INCLUDES
    NAMES
        "hiredis.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "hiredis")

find_library(HIREDIS_LIBRARIES
    NAMES
        "hiredis"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "hiredis")

if (NOT (HIREDIS_INCLUDES AND HIREDIS_LIBRARIES))
    set(HIREDIS_FOUND 0)
    set(HIREDIS_INCLUDES "")
    set(HIREDIS_LIBRARIES "")
else()
    set(HIREDIS_FOUND 1)
    set(xHAVE_HIREDIS 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT HIREDIS_FOUND AND Hiredis_FIND_REQUIRED)
    message("     HIREDIS_INCLUDES: ${HIREDIS_INCLUDES}")
    message("     HIREDIS_LIBRARIES: ${HIREDIS_LIBRARIES}")

    message(FATAL_ERROR "HIREDIS_FOUND: ${HIREDIS_FOUND}")
else()
    message(STATUS "HIREDIS_FOUND: ${HIREDIS_FOUND}")
endif()
#--------------------------------------------------------------------------------------------------
