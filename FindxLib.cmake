#--------------------------------------------------------------------------------------------------
# \file  FindxLib.cmake
# \brief Find xLib includes and library
#
# XLIB_FOUND     - true if system has library
# XLIB_INCLUDES  - include directories
# XLIB_LIBRARIES - libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(XLIB_INCLUDES
    NAMES
        "xLib.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "xLib")

find_library(XLIB_LIBRARIES
    NAMES
        "xLib_static"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "xLib")

if (NOT (XLIB_INCLUDES AND XLIB_LIBRARIES))
    set(XLIB_FOUND 0)
else()
    set(XLIB_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# TODO: libraries - gen from CMake
set(XLIB_LIBRARIES ${XLIB_LIBRARIES}
    ssl
    crypto
    mysqlclient
    ssh2
    curl
    xml2
    xcb
    X11-xcb
    dl
    pthread
    rt
    m
    z
    xLib_static)
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "XLIB_FOUND: ${XLIB_FOUND}")
message("   XLIB_INCLUDES:  ${XLIB_INCLUDES}")
message("   XLIB_LIBRARIES: ${XLIB_LIBRARIES}")

if (NOT XLIB_FOUND AND xLib_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
