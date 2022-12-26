#--------------------------------------------------------------------------------------------------
# \file  FindAtos.cmake
# \brief Find atos (Apple)
#
# cmATOS_FOUND     - true if found
# cmATOS_FILE_PATH - where to find includes
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_file(cmATOS_FILE_PATH "atos")

if (cmATOS_FILE_PATH STREQUAL "cmATOS_FILE_PATH-NOTFOUND")
    set(cmATOS_FOUND 0)
else()
    set(cmATOS_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmATOS_FOUND: ${cmATOS_FOUND}")
message("   cmATOS_FILE_PATH: ${cmATOS_FILE_PATH}")

if (NOT cmATOS_FOUND AND FindAtos_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
