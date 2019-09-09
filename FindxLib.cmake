#--------------------------------------------------------------------------------------------------
# \file  FindxLib.cmake
# \brief Find xLib includes and library
#
# XLib_FOUND     - true if system has library
# XLib_INCLUDES  - include directories
# XLib_LIBRARIES - libraries
# xHAVE_XLIB     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(XLib_INCLUDES
    NAMES
        "xLib.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "xLib")

find_library(XLib_LIBRARIES
    NAMES
        "xLib"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "xLib")

if (NOT (XLib_INCLUDES AND XLib_LIBRARIES))
    set(XLib_FOUND 0)
    set(XLib_INCLUDES "")
    set(XLib_LIBRARIES "")
else()
    set(XLib_FOUND 1)
    set(xHAVE_XLib 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT XLib_FOUND AND xLib_FIND_REQUIRED)
    message("     XLib_INCLUDES: ${XLib_INCLUDES}")
    message("     XLib_LIBRARIES: ${XLib_LIBRARIES}")

    message(FATAL_ERROR "XLib_FOUND: ${XLib_FOUND}")
else()
    message(STATUS "XLib_FOUND: ${XLib_FOUND}")
endif()
#--------------------------------------------------------------------------------------------------
