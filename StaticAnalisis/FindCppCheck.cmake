#--------------------------------------------------------------------------------------------------
# \file  FindCppCheck.cmake
# \brief Find cppcheck
#
# cmCPP_CHECK_FOUND                 - true if found
# cmCPP_CHECK_FILE_PATH             - cppcheck path
# cmCPP_CHECK_HTML_REPORT_FILE_PATH - cppcheck-htmlreport path
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program(cmCPP_CHECK_FILE_PATH
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

find_program(cmCPP_CHECK_HTML_REPORT_FILE_PATH
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

if (cmCPP_CHECK_FILE_PATH             STREQUAL "cmCPP_CHECK_FILE_PATH-NOTFOUND" OR
    cmCPP_CHECK_HTML_REPORT_FILE_PATH STREQUAL "cmCPP_CHECK_HTML_REPORT_FILE_PATH-NOTFOUND"
)
    set(cmCPP_CHECK_FOUND 0)
else()
    set(cmCPP_CHECK_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmCPP_CHECK_FOUND: ${cmCPP_CHECK_FOUND}")
message("   cmCPP_CHECK_FILE_PATH:             ${cmCPP_CHECK_FILE_PATH}")
message("   cmCPP_CHECK_HTML_REPORT_FILE_PATH: ${cmCPP_CHECK_HTML_REPORT_FILE_PATH}")

if (NOT cmCPP_CHECK_FOUND AND CppCheck_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
