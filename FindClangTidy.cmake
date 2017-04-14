#--------------------------------------------------------------------------------------------------
# \file  FindClangTidy.cmake
# \brief Find addr2Line
#
# cmCLANG_TIDY_FOUND     - true if found
# cmCLANG_TIDY_FILE_PATH - where to find includes
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program(cmCLANG_TIDY_FILE_PATH "clang-tidy")

if (cmCLANG_TIDY_FILE_PATH STREQUAL "cmCLANG_TIDY_FILE_PATH-NOTFOUND")
    set(cmCLANG_TIDY_FOUND 0)
    set(cmCLANG_TIDY_FILE_PATH "")
else()
    set(cmCLANG_TIDY_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT cmCLANG_TIDY_FOUND AND CLANG_TIDY_FIND_REQUIRED)
    message(FATAL_ERROR "cmCLANG_TIDY_FOUND: ${cmCLANG_TIDY_FOUND}")
else()
    # message(STATUS "cmCLANG_TIDY_FOUND: ${cmCLANG_TIDY_FOUND}")
    # message("     cmCLANG_TIDY_FILE_PATH: ${cmCLANG_TIDY_FILE_PATH}")
endif()
#--------------------------------------------------------------------------------------------------
