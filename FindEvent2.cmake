#--------------------------------------------------------------------------------------------------
# \file  FindEvent2.cmake
# \brief Find libevent includes and library
#
# EVENT2_FOUND     - true if system has library
# EVENT2_INCLUDES  - include directories
# EVENT2_LIBRARIES - libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(EVENT2_INCLUDES
    NAMES
        "event.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "event2"
    DOC
        "Find libevent v2")

find_library(EVENT2_LIBRARIES
    NAMES
        event
    PATHS
        "/usr/local/lib"
        "/usr/local/lib64"
        "/usr/lib"
        "/usr/lib64"
        "/lib"
        "/lib64"
    PATH_SUFFIXES
        "event2")

if (NOT (EVENT2_INCLUDES AND EVENT2_LIBRARIES))
    set(EVENT2_FOUND 0)
else()
    set(EVENT2_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "EVENT2_FOUND: ${EVENT2_FOUND}")
message("     EVENT2_INCLUDES:  ${EVENT2_INCLUDES}")
message("     EVENT2_LIBRARIES: ${EVENT2_LIBRARIES}")

if (NOT EVENT2_FOUND AND Event_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
