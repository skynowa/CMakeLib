#--------------------------------------------------------------------------------------------------
# \file  FindClangTidy.cmake
# \brief Find clang-tidy
#
# CLANG_TIDY_FOUND     - true if found
# CLANG_TIDY_FILE_PATH - where to find includes
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program(CLANG_TIDY_FILE_PATH
    NAMES
        "clang-tidy"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
        "/opt"
    DOC
        "clang-based C++ “linter” tool")

if (CLANG_TIDY_FILE_PATH STREQUAL "CLANG_TIDY_FILE_PATH-NOTFOUND")
    set(CLANG_TIDY_FOUND 0)
    set(CLANG_TIDY_FILE_PATH "")
else()
    set(CLANG_TIDY_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT CLANG_TIDY_FOUND AND ClangTidy_FIND_REQUIRED)
    message(FATAL_ERROR "CLANG_TIDY_FOUND: ${CLANG_TIDY_FOUND}")
else()
    message(STATUS "CLANG_TIDY_FOUND: ${CLANG_TIDY_FOUND}")
    # message("     CLANG_TIDY_FILE_PATH: ${CLANG_TIDY_FILE_PATH}")
endif()
#--------------------------------------------------------------------------------------------------
