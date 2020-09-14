#--------------------------------------------------------------------------------------------------
# \file  FindCppCheck.cmake
# \brief Find cppcheck
#
# CPP_CHECK_FOUND                 - true if found
# CPP_CHECK_FILE_PATH             - cppcheck path
# CPP_CHECK_HTML_REPORT_FILE_PATH - cppcheck-htmlreport path
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program(CPP_CHECK_FILE_PATH
    NAMES
        "cppcheck"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
        "/opt"
        "/snap/cppcheck/current/usr/bin"
    DOC
        "A tool for static C/C++ code analysis")

find_program(CPP_CHECK_HTML_REPORT_FILE_PATH
    NAMES
        "cppcheck-htmlreport"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
        "/opt"
        "/snap/cppcheck/current/usr/bin"
    DOC
        "Log converter")

if (CPP_CHECK_FILE_PATH             STREQUAL "CPP_CHECK_FILE_PATH-NOTFOUND" OR
    CPP_CHECK_HTML_REPORT_FILE_PATH STREQUAL "CPP_CHECK_HTML_REPORT_FILE_PATH-NOTFOUND"
)
    set(CPP_CHECK_FOUND 0)
else()
    set(CPP_CHECK_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "CPP_CHECK_FOUND: ${CPP_CHECK_FOUND}")
message("   CPP_CHECK_FILE_PATH:             ${CPP_CHECK_FILE_PATH}")
message("   CPP_CHECK_HTML_REPORT_FILE_PATH: ${CPP_CHECK_HTML_REPORT_FILE_PATH}")

if (NOT CPP_CHECK_FOUND AND CppCheck_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
