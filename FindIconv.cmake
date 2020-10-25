#--------------------------------------------------------------------------------------------------
# \file  FindIconv.cmake
# \brief Find Iconv includes and library
#
# ICONV_FOUND     - true if system has library
# ICONV_INCLUDES  - include directories
# ICONV_LIBRARIES - libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(ICONV_INCLUDES
    NAMES
        "iconv.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "iconv"
    DOC
        "Convert between different character encodings")

find_library(ICONV_LIBRARIES
    NAMES
        "iconv"
    PATHS
        "/usr/local/lib"
        "/usr/local/lib64"
        "/usr/lib"
        "/usr/lib64"
        "/lib"
        "/lib64"
    PATH_SUFFIXES
        "iconv")

if (NOT (ICONV_INCLUDES))   # ICONV_LIBRARIES - unused
    set(ICONV_FOUND 0)
else()
    set(ICONV_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "ICONV_FOUND: ${ICONV_FOUND}")
message("   ICONV_INCLUDES:  ${ICONV_INCLUDES}")
message("   ICONV_LIBRARIES: ${ICONV_LIBRARIES}")

if (NOT ICONV_FOUND AND Iconv_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
