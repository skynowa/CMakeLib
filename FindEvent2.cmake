#--------------------------------------------------------------------------------------------------
# \file  FindEvent2.cmake
# \brief Find libevent includes and library
#
# cmEVENT2_FOUND     - true if system has library
# cmEVENT2_INCLUDES  - include directories
# cmEVENT2_LIBRARIES - libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(cmEVENT2_INCLUDES
    NAMES
        "event.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "event2"
    DOC
        "Find libevent v2")

find_library(cmEVENT2_LIBRARIES
    NAMES
        event
        event_core
        libevent_core
    PATHS
        "/usr/local/lib"
        "/usr/local/lib64"
        "/usr/lib"
        "/usr/lib64"
        "/lib"
        "/lib64"
    PATH_SUFFIXES
        "event2")

if (NOT cmEVENT2_INCLUDES AND cmEVENT2_LIBRARIES)
    set(cmEVENT2_FOUND 0)
else()
    set(cmEVENT2_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmEVENT2_FOUND: ${cmEVENT2_FOUND}")
message("   cmEVENT2_INCLUDES:  ${cmEVENT2_INCLUDES}")
message("   cmEVENT2_LIBRARIES: ${cmEVENT2_LIBRARIES}")

if (NOT cmEVENT2_FOUND AND Event_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
