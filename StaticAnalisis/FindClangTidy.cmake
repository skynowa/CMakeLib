#--------------------------------------------------------------------------------------------------
# \file  FindClangTidy.cmake
# \brief Find clang-tidy
#
# CLANG_TIDY_FOUND     - true if found
# CLANG_TIDY_FILE_PATH - clang-tidy path
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program(CLANG_TIDY_FILE_PATH
    NAMES
        "clang-tidy"
        "clang-tidy-10.0"
        "clang-tidy-9.0"
        "clang-tidy-8.0"
        "clang-tidy-7.0"
        "clang-tidy-6.0"
        "clang-tidy-5.0"
        "clang-tidy-4.0"
        "clang-tidy39"
        "clang-tidy38"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
        "/opt"
    DOC
        "clang-based C++ “linter” tool")

if (CLANG_TIDY_FILE_PATH STREQUAL "CLANG_TIDY_FILE_PATH-NOTFOUND")
    set(CLANG_TIDY_FOUND 0)
else()
    set(CLANG_TIDY_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT CLANG_TIDY_FOUND AND ClangTidy_FIND_REQUIRED)
    message(FATAL_ERROR "CLANG_TIDY_FOUND: ${CLANG_TIDY_FOUND}")
else()
    message(STATUS "CLANG_TIDY_FOUND: ${CLANG_TIDY_FOUND}")
endif()

message("     CLANG_TIDY_FILE_PATH: ${CLANG_TIDY_FILE_PATH}")
#--------------------------------------------------------------------------------------------------
