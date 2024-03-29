#--------------------------------------------------------------------------------------------------
# \file  ClangTidy.cmake
# \brief
#
# http://clang.llvm.org/extra/clang-tidy/
# Disable warning in C++ code - use commet: // NOLINT
#--------------------------------------------------------------------------------------------------


# Build suppresion string from file
function(clang_tidy_suppressions SUPPRESSIONS_FILE SUPPRESSIONS_STR)
    set(FILE_CONTENT "")

    file(READ "${SUPPRESSIONS_FILE}" FILE_CONTENT)
    string(REGEX REPLACE "\n" "," FILE_CONTENT "${FILE_CONTENT}")

    set(FILE_CONTENT "${FILE_CONTENT}-") # fix last comma

    set(${SUPPRESSIONS_STR} "${FILE_CONTENT}" PARENT_SCOPE)
endfunction()

function(target_clang_tidy JOBS_NUM INCLUDES SOURCES)
    set(TARGET_NAME          "clang-tidy")

    set(COMPILE_COMMANDS_DIR "${CMAKE_CURRENT_BINARY_DIR}")
    set(SUPPRESSIONS_FILE    "$ENV{HOME}/.config/StaticAnalisis/ClangTidy/suppressions.txt")
    # set(LOG_DIR_HTML      "$ENV{HOME}/.config/StaticAnalisis/ClangTidy/ClangTidy_html")
    set(LOG_FILE             "$ENV{HOME}/.config/StaticAnalisis/ClangTidy/ClangTidy.yaml")

    if(EXISTS "${LOG_DIR_HTML}")
        file(REMOVE_RECURSE ${LOG_DIR_HTML})
    endif()

    # suppresiions
    # clang-tidy -checks='*' --list-checks
    set(SUPPRESSIONS_STR "")
    clang_tidy_suppressions(${SUPPRESSIONS_FILE} SUPPRESSIONS_STR)
    # message(STATUS "SUPPRESSIONS_STR: ${SUPPRESSIONS_STR}")

    add_custom_target(${TARGET_NAME})

    add_custom_command(
        TARGET
            ${TARGET_NAME}
        COMMAND
            ${CLANG_TIDY_FILE_PATH}
                -config=''
                -export-fixes=${LOG_FILE}
                # -fix-errors
                -header-filter='.*'
                -checks='${SUPPRESSIONS_STR}'
                # -analyze-temporary-dtors ???
                -p=${COMPILE_COMMANDS_DIR}
                ${SOURCES}
                --
                -std=c++20
                -I${INCLUDES}
                # -j${JOBS_NUM}
        WORKING_DIRECTORY
            ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT
            "Clang-Tidy...")
endfunction()
