#--------------------------------------------------------------------------------------------------
# \file  FindClangTidy.cmake
# \brief Find clang-tidy
#
# cmCLANG_TIDY_FOUND     - true if found
# cmCLANG_TIDY_FILE_PATH - clang-tidy path
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program(cmCLANG_TIDY_FILE_PATH
    NAMES
        "clang-tidy"
        "clang-tidy-11.0"
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

if (cmCLANG_TIDY_FILE_PATH STREQUAL "cmCLANG_TIDY_FILE_PATH-NOTFOUND")
    set(cmCLANG_TIDY_FOUND 0)
else()
    set(cmCLANG_TIDY_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmCLANG_TIDY_FOUND: ${cmCLANG_TIDY_FOUND}")
message("   cmCLANG_TIDY_FILE_PATH: ${cmCLANG_TIDY_FILE_PATH}")

if (NOT cmCLANG_TIDY_FOUND AND ClangTidy_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
