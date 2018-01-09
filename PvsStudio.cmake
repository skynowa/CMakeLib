#--------------------------------------------------------------------------------------------------
# \file  CppCheck.cmake
# \brief Function to register a target_dir for cppcheck
#
# https://arcanis.me/ru/2015/10/17/cppcheck-and-clang-format
#
#--------------------------------------------------------------------------------------------------


include(ProcessorCount)

function(perform_pvs_studio)
    set(TARGET_NAME           "pvs-studio")

    set(COMPILE_COMMANDS_FILE "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json")
    set(CFG_FILE              "$ENV{HOME}/.config/PVS-Studio/PVS-Studio.cfg")
    set(LOG_DIR_HTML          "$ENV{HOME}/.config/PVS-Studio/PVS-Studio_html")
    set(LOG_FILE              "$ENV{HOME}/.config/PVS-Studio/PVS-Studio.log")
    set(CPU_NUMBER            0)

    # if (NOT EXISTS "${COMPILE_COMMANDS_FILE}")
    #    message(FATAL_ERROR "COMPILE_COMMANDS_FILE: ${COMPILE_COMMANDS_FILE} - not exists")
    # endif()

    # CPU_NUMBER
    ProcessorCount(CPU_NUMBER)
    math(EXPR CPU_NUMBER "${CPU_NUMBER}*2")

    if(EXISTS "${LOG_DIR_HTML}")
        file(REMOVE_RECURSE ${LOG_DIR_HTML})
    endif()

    add_custom_target(pvs-studio)

    add_custom_command(
        TARGET
            ${TARGET_NAME}
        COMMAND
            ${PVS_STUDIO_ANALYZER_FILE_PATH}
                analyze
                --cfg ${CFG_FILE}
                -j${CPU_NUMBER} || exit 0
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
