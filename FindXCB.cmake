#--------------------------------------------------------------------------------------------------
# \file  FindXCB.cmake
# \brief Find libXCB
#
# cmXCB_FOUND           - true if XCB is available
# XCB_INCLUDE_DIR       - include directories to use XCB
# XLIB_XCB_INCLUDE_PATH - include directories to use XLIB/XCB
# XCB_LIBRARIES         - link against these to use XCB
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
if (UNIX)
    find_path(XCB_INCLUDE_DIR
        NAMES
            "xcb/xcb.h"
        PATHS
            "/usr/include"
            "/usr/local/include"
        PATH_SUFFIXES
            ""
        DOC
            "The directory where xcb/xcb.h resides")

    find_path(XLIB_XCB_INCLUDE_PATH
        NAMES
            "X11/Xlib-xcb.h"
        PATHS
            "/usr/include"
            "/usr/local/include"
        PATH_SUFFIXES
            ""
        DOC
            "The directory where X11/Xlib-xcb.h resides")

    find_library(XCB_LIBRARY
        NAMES
            "xcb"
        PATHS
            "/lib"
            "/lib64"
            "/usr/lib"
            "/usr/lib64"
            "/usr/local/lib"
            "/usr/local/lib64"
        PATH_SUFFIXES
            ""
        DOC
            "The xcb library")

    # find_library(XCB_XLIB_LIBRARY
    #     NAMES
    #         "xcb-xlib"
    #     PATHS
    #         "/usr/lib"
    #     DOC
    #         "The xcb-xlib library")

    find_library(XLIB_XCB_LIBRARY
        NAMES
            "X11-xcb"
        PATHS
            "/lib"
            "/lib64"
            "/usr/lib"
            "/usr/lib64"
            "/usr/local/lib"
            "/usr/local/lib64"
        PATH_SUFFIXES
            ""
        DOC
            "The X11-xcb library")

    set(XCB_LIBRARIES ${XCB_LIBRARY} ${XLIB_XCB_LIBRARY}) # ${XCB_XLIB_LIBRARY}
endif()

if (NOT (XCB_INCLUDE_DIR AND XCB_LIBRARIES))
    set(cmXCB_FOUND 0)
    set(XCB_INCLUDE_DIR "")
    set(XLIB_XCB_INCLUDE_PATH "")
    set(XCB_LIBRARIES "")
else()
    set(cmXCB_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT cmXCB_FOUND AND XCB_FIND_REQUIRED)
    message(FATAL_ERROR "cmXCB_FOUND: ${cmXCB_FOUND}")
else()
    # message(STATUS "cmXCB_FOUND: ${cmXCB_FOUND}")
    # message("     XCB_INCLUDE_DIR: ${XCB_INCLUDE_DIR}")
    # message("     XLIB_XCB_INCLUDE_PATH: ${XLIB_XCB_INCLUDE_PATH}")
    # message("     XCB_LIBRARIES: ${XCB_LIBRARIES}")
endif()
#--------------------------------------------------------------------------------------------------
