#--------------------------------------------------------------------------------------------------
# \file  FindFastCGI.cmake
# \brief Find FastCGI includes and library
#
# FASTCGI_FOUND     - true if system has library
# FASTCGI_INCLUDES  - include directories
# FASTCGI_LIBRARIES - libraries
# xHAVE_FASTCGI     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(FASTCGI_INCLUDES
    NAMES
        "fastcgi.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "fcgi")

find_library(FASTCGI_LIBRARIES
    NAMES
        "fcgi"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "fcgi")

find_library(FASTCGIPP_LIBRARIES
    NAMES
        "fcgi++"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "fcgi++")

if (NOT (FASTCGI_INCLUDES AND FASTCGI_LIBRARIES AND FASTCGIPP_LIBRARIES))
    set(FASTCGI_FOUND 0)
    set(FASTCGI_INCLUDES "")
    set(FASTCGI_LIBRARIES "")
else()
    set(FASTCGI_LIBRARIES ${FASTCGI_LIBRARIES} ${FASTCGIPP_LIBRARIES})

    set(FASTCGI_FOUND 1)
    set(xHAVE_FASTCGI 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT FASTCGI_FOUND AND FastCGI_FIND_REQUIRED)
    message(FATAL_ERROR "FASTCGI_FOUND: ${FASTCGI_FOUND}")
else()
    message(STATUS "FASTCGI_FOUND: ${FASTCGI_FOUND}")
    # message("     FASTCGI_INCLUDES: ${FASTCGI_INCLUDES}")
    # message("     FASTCGI_LIBRARIES: ${FASTCGI_LIBRARIES}")
endif()
#--------------------------------------------------------------------------------------------------
