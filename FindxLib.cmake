#--------------------------------------------------------------------------------------------------
# \file  FindxLib.cmake
# \brief Find xLib includes and library
#
# cmXLIB_FOUND     - true if system has library
# cmXLIB_INCLUDES  - include directories
# cmXLIB_LIBRARIES - libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(cmXLIB_INCLUDES
    NAMES
        "xLib.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "xLib")

find_library(cmXLIB_LIBRARIES
    NAMES
        "xLib_static"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "xLib")

if (NOT cmXLIB_INCLUDES AND cmXLIB_LIBRARIES)
    set(cmXLIB_FOUND 0)
else()
    set(cmXLIB_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# TODO: libraries - gen from CMake
set(cmXLIB_LIBRARIES ${cmXLIB_LIBRARIES}
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
message(STATUS "cmXLIB_FOUND: ${cmXLIB_FOUND}")
message("   cmXLIB_INCLUDES:  ${cmXLIB_INCLUDES}")
message("   cmXLIB_LIBRARIES: ${cmXLIB_LIBRARIES}")

if (NOT cmXLIB_FOUND AND xLib_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
