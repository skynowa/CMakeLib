#--------------------------------------------------------------------------------------------------
# \file  FindxLib.cmake
# \brief Find xLib includes and library
#
# cmXLIB_FOUND           - true if system has library
# cmXLIB_INCLUDES        - include directories
# cmXLIB_LIBRARIES       - libraries
# cmXLIB_SYS_LIBRARIES   - system libraries
# cmXLIB_EXTRA_LIBRARIES - extra libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# Win:
# -- Installing: C:/Program Files/xLib/ -> include/xLib
# -- Installing: C:/Program Files/xLib/ -> lib/xLib.lib

find_path(cmXLIB_INCLUDES
    NAMES
        "xLib/xLib.h"
    PATHS
        # Win
        "C:/Program Files/xLib/include"

        # Unix
        "/usr/local/include"
        "/usr/include"
    DOC
        "xLib - include dir")

find_library(cmXLIB_LIBRARIES
    NAMES
        "xLib"
    PATHS
        # Win
        "C:/Program Files/xLib/lib"

        # Unix
        "/usr/local/lib"
        "/usr/lib"
    DOC
        "xLib - libraries")

if (NOT cmXLIB_INCLUDES AND cmXLIB_LIBRARIES)
    set(cmXLIB_FOUND 0)
else()
    set(cmXLIB_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# cmXLIB_SYS_LIBRARIES
set(cmXLIB_SYS_LIBRARIES
    ${CMAKE_THREAD_LIBS_INIT}
    ${CMAKE_THREAD_LIBS}
    ${CMAKE_DL_LIBS})

if     (WIN32)
    set(cmXLIB_SYS_LIBRARIES
        ${cmXLIB_SYS_LIBRARIES}
        advapi32
        ws2_32
        netapi32
        psapi
        uuid
        ole32
        mpr
        dbghelp
        crypt32)
elseif (UNIX)
    set(cmXLIB_SYS_LIBRARIES
        ${cmXLIB_SYS_LIBRARIES}
        pthread
        rt
        m
        z)
else()
    message(ERROR "Get OS env - failed")
endif()

# TODO: cmXLIB_EXTRA_LIBRARIES - gen from CMake + use it
set(cmXLIB_EXTRA_LIBRARIES
    ssl
    crypto
    mysqlclient
    ssh2
    curl
    xml2
    xcb
    X11-xcb)
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmXLIB_FOUND: ${cmXLIB_FOUND}")
message("   cmXLIB_INCLUDES:        ${cmXLIB_INCLUDES}")
message("   cmXLIB_LIBRARIES:       ${cmXLIB_LIBRARIES}")
message("   cmXLIB_SYS_LIBRARIES:   ${cmXLIB_SYS_LIBRARIES}")
message("   cmXLIB_EXTRA_LIBRARIES: ${cmXLIB_EXTRA_LIBRARIES}")

if (NOT cmXLIB_FOUND AND xLib_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
