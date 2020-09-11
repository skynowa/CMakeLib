#--------------------------------------------------------------------------------------------------
# \file  FindAddr2Line.cmake
# \brief Find addr2Line
#
# cmADDR2LINE_FOUND     - true if found
# cmADDR2LINE_FILE_PATH - where to find includes
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_file(cmADDR2LINE_FILE_PATH "addr2line")

if (cmADDR2LINE_FILE_PATH STREQUAL "cmADDR2LINE_FILE_PATH-NOTFOUND")
    set(cmADDR2LINE_FOUND 0)
    set(cmADDR2LINE_FILE_PATH "")
else()
    set(cmADDR2LINE_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT cmADDR2LINE_FOUND AND Addr2Line_FIND_REQUIRED)
    message(FATAL_ERROR "cmADDR2LINE_FOUND: ${cmADDR2LINE_FOUND}")
else()
    message(STATUS "cmADDR2LINE_FOUND: ${cmADDR2LINE_FOUND}")
endif()

message("     cmADDR2LINE_FILE_PATH: ${cmADDR2LINE_FILE_PATH}")
#--------------------------------------------------------------------------------------------------
