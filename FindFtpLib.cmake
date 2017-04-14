#--------------------------------------------------------------------------------------------------
# \file  FindFtpLib.cmake
# \brief Find FtpLib includes and library
#
# FTPLIB_FOUND     - true if system has library
# FTPLIB_INCLUDES  - include directories
# FTPLIB_LIBRARIES - libraries
# xHAVE_FTPLIB     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(FTPLIB_INCLUDES
    NAMES
        "ftplib.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "ftplib")

find_library(FTPLIB_LIBRARIES
    NAMES
        "ftp"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "ftplib")

if (NOT (FTPLIB_INCLUDES AND FTPLIB_LIBRARIES))
    set(FTPLIB_FOUND 0)
    set(FTPLIB_INCLUDES "")
    set(FTPLIB_LIBRARIES "")
else()
    set(FTPLIB_FOUND 1)
    set(xHAVE_FTPLIB 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT FTPLIB_FOUND AND FtpLib_FIND_REQUIRED)
    message(FATAL_ERROR "FTPLIB_FOUND: ${FTPLIB_FOUND}")
else()
    message(STATUS "FTPLIB_FOUND: ${FTPLIB_FOUND}")
    # message("     FTPLIB_INCLUDES: ${FTPLIB_INCLUDES}")
    # message("     FTPLIB_LIBRARIES: ${FTPLIB_LIBRARIES}")
endif()
#--------------------------------------------------------------------------------------------------
