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
    set(xHAVE_XLib 1)
endif()
#--------------------------------------------------------------------------------------------------
# libraries
set(XLIB_LIBRARIES ${XLIB_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT} ${CMAKE_DL_LIBS})

if     (MSVC)
    set(XLIB_LIBRARIES ${XLIB_LIBRARIES} advapi32 ws2_32 netapi32 psapi uuid ole32 mpr dbghelp)
elseif (MINGW)
    set(XLIB_LIBRARIES ${XLIB_LIBRARIES} advapi32 ws2_32 netapi32 psapi uuid ole32 mpr dbghelp)
elseif (CMAKE_COMPILER_IS_CLANGXX)
    add_compile_options(-stdlib=libc++ -lc++abi)

    set(XLIB_LIBRARIES ${XLIB_LIBRARIES} pthread rt m z)
elseif (CMAKE_COMPILER_IS_GNUCXX)
    set(XLIB_LIBRARIES ${XLIB_LIBRARIES} pthread rt m z)
else()
    message(FATAL_ERROR "xLib: unknown compiler")
endif()

if (OS_ANDROID)
    unset(XLIB_DEFINITIONS      CACHE)
    unset(cmXLIB_COMPILER_FLAGS CACHE)
    unset(XLIB_LIBRARIES        CACHE)

    set(XLIB_LIBRARIES ${XLIB_LIBRARIES} gnustl_static m z log)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "XLIB_FOUND: ${XLIB_FOUND}")
message("   XLIB_INCLUDES:  ${XLIB_INCLUDES}")
message("   XLIB_LIBRARIES: ${XLIB_LIBRARIES}")

if (NOT XLIB_FOUND AND xLib_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
