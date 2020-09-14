#--------------------------------------------------------------------------------------------------
# \file  FindCgicc.cmake
# \brief Find Cgicc includes and library
#
# CGICC_FOUND     - true if system has library
# CGICC_INCLUDES  - include directories
# CGICC_LIBRARIES - libraries
# xHAVE_CGICC     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(CGICC_INCLUDES
    NAMES
        "Cgicc.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "cgicc")

find_library(CGICC_LIBRARIES
    NAMES
        "cgicc"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "cgicc")

if (NOT (CGICC_INCLUDES AND CGICC_LIBRARIES))
    set(CGICC_FOUND 0)
    set(CGICC_INCLUDES "")
    set(CGICC_LIBRARIES "")
else()
    set(CGICC_FOUND 1)
    set(xHAVE_CGICC 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(FATAL_ERROR "CGICC_FOUND: ${CGICC_FOUND}")
message("   CGICC_INCLUDES:  ${CGICC_INCLUDES}")
message("   CGICC_LIBRARIES: ${CGICC_LIBRARIES}")
message("   xHAVE_CGICC: ${xHAVE_CGICC}")

if (NOT CGICC_FOUND AND Cgicc_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
