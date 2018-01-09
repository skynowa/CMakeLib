#--------------------------------------------------------------------------------------------------
# \file  CppCheck.cmake
# \brief Function to register a target_dir for cppcheck
#
# https://arcanis.me/ru/2015/10/17/cppcheck-and-clang-format
#
#--------------------------------------------------------------------------------------------------


function(perform_cppcheck JOBS_NUM)
    set(TARGET_NAME "cppcheck")

    add_custom_target(${TARGET_NAME}
        COMMAND
            ${CPP_CHECK_FILE_PATH}
                --check-config
                --library=qt.cfg
                --enable=warning,performance,portability,information,missingInclude
                --suppress=missingIncludeSystem
                --template="[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)"
                --std=c++11
                --report-progress
                --verbose
                --quiet
                -j${JOBS_NUM}
                ${ARGN}
        WORKING_DIRECTORY
            ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT
            "Cppcheck analyze...")
endfunction()
