#--------------------------------------------------------------------------------------------------
# \file  FindSphinxClient.cmake
# \brief Find SphinxClient includes and library
#
# SPHINXCLIENT_FOUND     - true if system has library
# SPHINXCLIENT_INCLUDES  - include directories
# SPHINXCLIENT_LIBRARIES - libraries
# xHAVE_SPHINXCLIENT     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(SPHINXCLIENT_INCLUDES
    NAMES
        "sphinxclient.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "sphinxclient")

find_library(SPHINXCLIENT_LIBRARIES
    NAMES
        "sphinxclient"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "sphinxclient")

if (NOT (SPHINXCLIENT_INCLUDES AND SPHINXCLIENT_LIBRARIES))
    set(SPHINXCLIENT_FOUND 0)
    set(SPHINXCLIENT_INCLUDES "")
    set(SPHINXCLIENT_LIBRARIES "")
else()
    set(SPHINXCLIENT_FOUND 1)
    set(xHAVE_SPHINXCLIENT 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT SPHINXCLIENT_FOUND AND SphinxClient_FIND_REQUIRED)
    message(FATAL_ERROR "SPHINXCLIENT_FOUND: ${SPHINXCLIENT_FOUND}")
else()
    message(STATUS "SPHINXCLIENT_FOUND: ${SPHINXCLIENT_FOUND}")
    # message("     SPHINXCLIENT_INCLUDES: ${SPHINXCLIENT_INCLUDES}")
    # message("     SPHINXCLIENT_LIBRARIES: ${SPHINXCLIENT_LIBRARIES}")
endif()
#--------------------------------------------------------------------------------------------------
