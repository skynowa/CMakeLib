#--------------------------------------------------------------------------------------------------
# \file  ClangTidy.cmake
# \brief Function to register a target_dir for cppcheck
#
# https://arcanis.me/ru/2015/10/17/cppcheck-and-clang-format
#
#--------------------------------------------------------------------------------------------------


function(target_clang_tidy JOBS_NUM INCLUDES HEADERS SOURCES)
    set(TARGET_NAME       "clang-tidy")

    set(COMPILE_COMMANDS_DIR  "${CMAKE_CURRENT_BINARY_DIR}")
    # set(SUPPRESSIONS_FILE "$ENV{HOME}/.config/ClangTidy/suppressions.txt")
    # set(LOG_DIR_HTML      "$ENV{HOME}/.config/ClangTidy/ClangTidy_html")
    set(LOG_FILE          "$ENV{HOME}/.config/ClangTidy/ClangTidy.yaml")

    # if(EXISTS "${LOG_DIR_HTML}")
    #     file(REMOVE_RECURSE ${LOG_DIR_HTML})
    # endif()

    message("COMPILE_COMMANDS_DIR: ${COMPILE_COMMANDS_DIR}")
    message("INCLUDES: ${INCLUDES}")
    # message("HEADERS:  ${HEADERS}")
    # message("SOURCES:  ${SOURCES}")


    add_custom_target(${TARGET_NAME})

    add_custom_command(
        TARGET
            ${TARGET_NAME}
        COMMAND
            ${CLANG_TIDY_FILE_PATH}
                -config=''
                -export-fixes=${LOG_FILE}
                --header-filter='.*'
                -checks='*'
                -analyze-temporary-dtors
                -p=${COMPILE_COMMANDS_DIR}
                ${SOURCES}
                --
                -std=c++11
                -I${INCLUDES}
                # -j${JOBS_NUM}
        WORKING_DIRECTORY
            ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT
            "Clang-Tidy...")
endfunction()
