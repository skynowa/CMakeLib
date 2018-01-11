#--------------------------------------------------------------------------------------------------
# \file  CppCheck.cmake
# \brief Function to register a target_dir for cppcheck
#
# http://cppcheck.sourceforge.net/
#--------------------------------------------------------------------------------------------------


function(target_cpp_check JOBS_NUM SOURCE_DIR)
    set(TARGET_NAME       "cpp-check")

    set(SUPPRESSIONS_FILE "$ENV{HOME}/.config/Cppcheck/suppressions.txt")
    set(LOG_DIR_HTML      "$ENV{HOME}/.config/Cppcheck/CppCheck_html")
    set(LOG_FILE          "$ENV{HOME}/.config/Cppcheck/CppCheck.xml")

    if(EXISTS "${LOG_DIR_HTML}")
        file(REMOVE_RECURSE ${LOG_DIR_HTML})
    endif()

    add_custom_target(${TARGET_NAME})

    add_custom_command(
        TARGET
            ${TARGET_NAME}
        COMMAND
            ${CPP_CHECK_FILE_PATH}
                ## --check-config
                --library=std.cfg --library=posix.cfg --library=windows.cfg
                --enable=warning,performance,portability,information,missingInclude
                --suppress=missingIncludeSystem
                --suppressions-list=${SUPPRESSIONS_FILE}
                --inconclusive # ???
                --template="[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)"
                --std=c++11 --std=posix
                --platform=native
                --force
                --quiet
                --xml --xml-version=2
                -j${JOBS_NUM}
                ${SOURCE_DIR}
                2> ${LOG_FILE}
        WORKING_DIRECTORY
            ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT
            "Cppcheck analyze...")

    add_custom_command(
        TARGET
            ${TARGET_NAME}
        COMMAND
            ${CPP_CHECK_HTML_REPORT_FILE_PATH}
                --report-dir=${LOG_DIR_HTML}
                --source-dir=${SOURCE_DIR}
                --file=${LOG_FILE}
                --title=xLib
                --source-encoding=UTF-8
        WORKING_DIRECTORY
            ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT
            "Cppcheck process log...")
endfunction()
