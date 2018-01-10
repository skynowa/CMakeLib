#--------------------------------------------------------------------------------------------------
# \file  FindSphinxClientPP.cmake
# \brief Find SphinxClientPP includes and library
#
# SPHINXCLIENTPP_FOUND     - true if system has library
# SPHINXCLIENTPP_INCLUDES  - include directories
# SPHINXCLIENTPP_LIBRARIES - libraries
# xHAVE_SPHINXCLIENTPP     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(SPHINXCLIENTPP_INCLUDES
    NAMES
        "sphinxclientpp.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "sphinxclientpp")

find_library(SPHINXCLIENTPP_LIBRARIES
    NAMES
        "sphinxclientpp"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "sphinxclientpp")

if (NOT (SPHINXCLIENTPP_INCLUDES AND SPHINXCLIENTPP_LIBRARIES))
    set(SPHINXCLIENTPP_FOUND 0)
    set(SPHINXCLIENTPP_INCLUDES "")
    set(SPHINXCLIENTPP_LIBRARIES "")
else()
    set(SPHINXCLIENTPP_FOUND 1)
    set(xHAVE_SPHINXCLIENTPP 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT SPHINXCLIENTPP_FOUND AND SphinxClientPP_FIND_REQUIRED)
    message("     SPHINXCLIENTPP_INCLUDES: ${SPHINXCLIENTPP_INCLUDES}")
    message("     SPHINXCLIENTPP_LIBRARIES: ${SPHINXCLIENTPP_LIBRARIES}")

    message(FATAL_ERROR "SPHINXCLIENTPP_FOUND: ${SPHINXCLIENTPP_FOUND}")
else()
    message(STATUS "SPHINXCLIENTPP_FOUND: ${SPHINXCLIENTPP_FOUND}")
endif()
#--------------------------------------------------------------------------------------------------
