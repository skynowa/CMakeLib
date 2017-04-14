#--------------------------------------------------------------------------------------------------
# \file  FindExecInfo.cmake
# \brief Find ExecInfo includes and library
#
# EXECINFO_FOUND     - true if system has library
# EXECINFO_INCLUDES  - include directories
# EXECINFO_LIBRARIES - libraries
# xHAVE_EXECINFO     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(EXECINFO_INCLUDES
    NAMES
        "execinfo.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "execinfo")

find_library(EXECINFO_LIBRARIES
    NAMES
        "execinfo"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "execinfo")

if (NOT (EXECINFO_INCLUDES AND EXECINFO_LIBRARIES))
    set(EXECINFO_FOUND 0)
    set(EXECINFO_INCLUDES "")
    set(EXECINFO_LIBRARIES "")
else()
    set(EXECINFO_FOUND 1)
    set(xHAVE_EXECINFO 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT EXECINFO_FOUND AND ExecInfo_FIND_REQUIRED)
    message(FATAL_ERROR "EXECINFO_FOUND: ${EXECINFO_FOUND}")
else()
    message(STATUS "EXECINFO_FOUND: ${EXECINFO_FOUND}")
    # message("     EXECINFO_INCLUDES: ${EXECINFO_INCLUDES}")
    # message("     EXECINFO_LIBRARIES: ${EXECINFO_LIBRARIES}")
endif()
#--------------------------------------------------------------------------------------------------
