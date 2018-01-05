#--------------------------------------------------------------------------------------------------
# \file  FindCppCheck.cmake
# \brief Find cppcheck
#
# CPP_CHECK_FOUND     - true if found
# CPP_CHECK_FILE_PATH - where to find includes
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program(CPP_CHECK_FILE_PATH
    NAMES
        "cppcheck"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
    DOC
        "A tool for static C/C++ code analysis")

if (CPP_CHECK_FILE_PATH STREQUAL "CPP_CHECK_FILE_PATH-NOTFOUND")
    set(CPP_CHECK_FOUND 0)
    set(CPP_CHECK_FILE_PATH "")
else()
    set(CPP_CHECK_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT CPP_CHECK_FOUND AND CPP_CHECK_FIND_REQUIRED)
    message(FATAL_ERROR "CPP_CHECK_FOUND: ${CPP_CHECK_FOUND}")
else()
    message(STATUS "CPP_CHECK_FOUND: ${CPP_CHECK_FOUND}")
    # message("     CPP_CHECK_FILE_PATH: ${CPP_CHECK_FILE_PATH}")
endif()
#--------------------------------------------------------------------------------------------------
