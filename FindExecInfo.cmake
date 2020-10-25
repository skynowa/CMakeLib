#--------------------------------------------------------------------------------------------------
# \file  FindExecInfo.cmake
# \brief Find ExecInfo includes and library
#
# cmEXECINFO_FOUND     - true if system has library
# cmEXECINFO_INCLUDES  - include directories
# cmEXECINFO_LIBRARIES - libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(cmEXECINFO_INCLUDES
    NAMES
        "execinfo.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "execinfo")

find_library(cmEXECINFO_LIBRARIES
    NAMES
        "execinfo"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "execinfo")

# includes or libs - OK
if (NOT cmEXECINFO_INCLUDES OR cmEXECINFO_LIBRARIES)
    set(cmEXECINFO_FOUND 0)
else()
    set(cmEXECINFO_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmEXECINFO_FOUND: ${cmEXECINFO_FOUND}")
message("   cmEXECINFO_INCLUDES:  ${cmEXECINFO_INCLUDES}")
message("   cmEXECINFO_LIBRARIES: ${cmEXECINFO_LIBRARIES}")

if (NOT cmEXECINFO_FOUND AND ExecInfo_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
