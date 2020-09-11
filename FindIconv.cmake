#--------------------------------------------------------------------------------------------------
# \file  FindIconv.cmake
# \brief Find Iconv includes and library
#
# ICONV_FOUND     - true if system has library
# ICONV_INCLUDES  - include directories
# ICONV_LIBRARIES - libraries
# xHAVE_ICONV     - true if found (source used)
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
    set(ICONV_INCLUDES "")
    set(ICONV_LIBRARIES "")
else()
    set(ICONV_FOUND 1)
    set(xHAVE_ICONV 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT ICONV_FOUND AND Iconv_FIND_REQUIRED)
    message(FATAL_ERROR "ICONV_FOUND: ${ICONV_FOUND}")
else()
    message(STATUS "ICONV_FOUND: ${ICONV_FOUND}")
endif()

message("     ICONV_INCLUDES: ${ICONV_INCLUDES}")
message("     ICONV_LIBRARIES: ${ICONV_LIBRARIES}")
#--------------------------------------------------------------------------------------------------
