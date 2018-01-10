#--------------------------------------------------------------------------------------------------
# \file  FindExslt.cmake
# \brief Find Exslt includes and library
#
# EXSLT_FOUND     - true if system has library
# EXSLT_INCLUDES  - include directories
# EXSLT_LIBRARIES - libraries
# xHAVE_EXSLT     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(EXSLT_INCLUDES
    NAMES
        "exslt.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "libexslt")

find_library(EXSLT_LIBRARIES
    NAMES
        "exslt"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "libexslt")

if (NOT (EXSLT_INCLUDES AND EXSLT_LIBRARIES))
    set(EXSLT_FOUND 0)
    set(EXSLT_INCLUDES "")
    set(EXSLT_LIBRARIES "")
else()
    set(EXSLT_FOUND 1)
    set(xHAVE_EXSLT 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT EXSLT_FOUND AND Exslt_FIND_REQUIRED)
    message("     EXSLT_INCLUDES: ${EXSLT_INCLUDES}")
    message("     EXSLT_LIBRARIES: ${EXSLT_LIBRARIES}")

    message(FATAL_ERROR "EXSLT_FOUND: ${EXSLT_FOUND}")
else()
    message(STATUS "EXSLT_FOUND: ${EXSLT_FOUND}")
endif()
#--------------------------------------------------------------------------------------------------
