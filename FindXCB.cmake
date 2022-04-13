#--------------------------------------------------------------------------------------------------
# \file  FindXCB.cmake
# \brief Find libXCB
#
# cmXCB_FOUND             - true if XCB is available
# cmXCB_INCLUDE_DIR       - include directories to use XCB
# cmXLIB_XCB_INCLUDE_PATH - include directories to use XLIB/XCB
# cmXCB_LIBRARIES         - link against these to use XCB
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
if (UNIX)
    find_path(cmXCB_INCLUDE_DIR
        NAMES
            "xcb/xcb.h"
        PATHS
            "/usr/local/include"
            "/usr/include"
        PATH_SUFFIXES
            ""
        DOC
            "The directory where xcb/xcb.h resides")

    find_path(cmXLIB_XCB_INCLUDE_PATH
        NAMES
            "X11/Xlib-xcb.h"
        PATHS
            "/usr/local/include"
            "/usr/include"
        PATH_SUFFIXES
            ""
        DOC
            "The directory where X11/Xlib-xcb.h resides")

    find_library(cmXCB_LIBRARY
        NAMES
            "xcb"
        PATHS
            "/usr/local/lib64"
            "/usr/local/lib"
            "/usr/lib/x86_64-linux-gnu/"
            "/usr/lib64"
            "/usr/lib"
            "/lib64"
            "/lib"
        PATH_SUFFIXES
            ""
        DOC
            "The xcb library")

    # find_library(cmXCB_XLIB_LIBRARY
    #     NAMES
    #         "xcb-xlib"
    #     PATHS
    #         "/usr/lib"
    #     DOC
    #         "The xcb-xlib library")

    find_library(cmXLIB_XCB_LIBRARY
        NAMES
            "X11-xcb"
        PATHS
            "/usr/local/lib64"
            "/usr/local/lib"
            "/usr/lib/x86_64-linux-gnu/"
            "/usr/lib64"
            "/usr/lib"
            "/lib64"
            "/lib"
        PATH_SUFFIXES
            ""
        DOC
            "The X11-xcb library")

    set(cmXCB_LIBRARIES ${cmXCB_LIBRARY} ${cmXLIB_XCB_LIBRARY}) # ${cmXCB_XLIB_LIBRARY}
endif()

if (NOT cmXCB_INCLUDE_DIR AND cmXCB_LIBRARIES)
    set(cmXCB_FOUND 0)
else()
    set(cmXCB_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmXCB_FOUND: ${cmXCB_FOUND}")
message("   cmXCB_INCLUDE_DIR:       ${cmXCB_INCLUDE_DIR}")
message("   cmXLIB_XCB_INCLUDE_PATH: ${cmXLIB_XCB_INCLUDE_PATH}")
message("   cmXCB_LIBRARIES:         ${cmXCB_LIBRARIES}")

if (NOT cmXCB_FOUND AND XCB_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
