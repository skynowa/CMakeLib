#--------------------------------------------------------------------------------------------------
# \file  FindxLib.cmake
# \brief Find xLib includes and library
#
# XLIB_FOUND     - true if system has library
# XLIB_INCLUDES  - include directories
# XLIB_LIBRARIES - libraries
# xHAVE_XLIB     - true if found (source used)
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
    set(xHAVE_XLIB 1)
endif()
#--------------------------------------------------------------------------------------------------
# libraries
set(XLIB_LIBRARIES ${XLIB_LIBRARIES}
    /usr/lib/x86_64-linux-gnu/libssl.so
    /usr/lib/x86_64-linux-gnu/libcrypto.so
    /usr/lib/x86_64-linux-gnu/libmysqlclient.so
    /usr/lib/x86_64-linux-gnu/libssh2.so
    /usr/lib/x86_64-linux-gnu/libcurl.so
    /usr/lib/x86_64-linux-gnu/libxml2.so
    /usr/lib/x86_64-linux-gnu/libxcb.so
    /usr/lib/x86_64-linux-gnu/libX11-xcb.so
    -lpthread
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
message("   xHAVE_XLIB:     ${xHAVE_XLIB}")

if (NOT XLIB_FOUND AND xLib_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
