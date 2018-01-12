#--------------------------------------------------------------------------------------------------
# \file  CppCheck.cmake
# \brief Function to register a target_dir for cppcheck
#
# https://www.viva64.com/ru/pvs-studio/
#--------------------------------------------------------------------------------------------------


function(target_pvs_studio JOBS_NUM)
    set(TARGET_NAME           "pvs-studio")

    set(COMPILE_COMMANDS_FILE "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json")
    set(CFG_FILE              "$ENV{HOME}/.config/PVS-Studio/PVS-Studio.cfg")
    set(LOG_DIR_HTML          "$ENV{HOME}/.config/PVS-Studio/PVS-Studio_html")
    set(LOG_FILE              "$ENV{HOME}/.config/PVS-Studio/PVS-Studio.log")

    # if (NOT EXISTS "${COMPILE_COMMANDS_FILE}")
    #    message(FATAL_ERROR "COMPILE_COMMANDS_FILE: ${COMPILE_COMMANDS_FILE} - not exists")
    # endif()

    if(EXISTS "${LOG_DIR_HTML}")
        file(REMOVE_RECURSE ${LOG_DIR_HTML})
    endif()

    add_custom_target(${TARGET_NAME})

    add_custom_command(
        TARGET
            ${TARGET_NAME}
        COMMAND
            ${PVS_STUDIO_ANALYZER_FILE_PATH}
                analyze
                --cfg ${CFG_FILE}
                -j${JOBS_NUM} || exit 0
        WORKING_DIRECTORY
            ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT
            "PVS-Studio analyze...")

    add_custom_command(
        TARGET
            ${TARGET_NAME}
        COMMAND
            ${PVS_STUDIO_PLOG_FILE_PATH}
                --analyzer GA:1,2
                --excludedCodes V009,V583
                --renderTypes fullhtml
                --output ${LOG_DIR_HTML} ${LOG_FILE}
        WORKING_DIRECTORY
            ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT
            "PVS-Studio process log...")
endfunction()
