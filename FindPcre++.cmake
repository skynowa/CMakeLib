#--------------------------------------------------------------------------------------------------
# \file  FindPcre++.cmake
# \brief Find Pcre++ includes and library
#
# PCRE_PP_FOUND     - true if system has library
# PCRE_PP_INCLUDES  - include directories
# PCRE_PP_LIBRARIES - libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(PCRE_PP_INCLUDES
    NAMES
        "pcre++.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        ""
    DOC
        "Find Pcre++ library")

find_library(PCRE_PP_LIBRARIES
    NAMES
		pcre++
    PATHS
        "/usr/local/lib"
        "/usr/local/lib64"
        "/usr/lib"
        "/usr/lib64"
        "/lib"
        "/lib64"
    PATH_SUFFIXES
        "")

if (NOT (PCRE_PP_INCLUDES AND PCRE_PP_LIBRARIES))
    set(PCRE_PP_FOUND 0)
else()
    set(PCRE_PP_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "PCRE_PP_FOUND: ${PCRE_PP_FOUND}")
message("   PCRE_PP_INCLUDES:  ${PCRE_PP_INCLUDES}")
message("   PCRE_PP_LIBRARIES: ${PCRE_PP_LIBRARIES}")

if (NOT PCRE_PP_FOUND AND Pcre++_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
