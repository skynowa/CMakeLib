#--------------------------------------------------------------------------------------------------
# \file  FindIconv.cmake
# \brief Find Iconv includes and library
#
# cmICONV_FOUND     - true if system has library
# cmICONV_INCLUDES  - include directories
# cmICONV_LIBRARIES - libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(cmICONV_INCLUDES
    NAMES
        "iconv.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "iconv"
    DOC
        "Convert between different character encodings")

find_library(cmICONV_LIBRARIES
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

if (NOT cmICONV_INCLUDES)   # cmICONV_LIBRARIES - unused
    set(cmICONV_FOUND 0)
else()
    set(cmICONV_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmICONV_FOUND: ${cmICONV_FOUND}")
message("   cmICONV_INCLUDES:  ${cmICONV_INCLUDES}")
message("   cmICONV_LIBRARIES: ${cmICONV_LIBRARIES}")

if (NOT cmICONV_FOUND AND Iconv_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
