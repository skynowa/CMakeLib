#--------------------------------------------------------------------------------------------------
# \file  FindPvsStudio.cmake
# \brief Find pvs-studio-analyzer
#
# cmPVS_STUDIO_FOUND              - true if found
# cmPVS_STUDIO_FILE_PATH          - where to find program
# cmPVS_STUDIO_ANALYZER_FILE_PATH - where to find program
# cmPVS_STUDIO_LIC_FILE_PATH      - where to find license file
# cmPVS_STUDIO_CFG_FILE_PATH      - where to find configuration file
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program(cmPVS_STUDIO_FILE_PATH
    NAMES
        "pvs-studio"
        "pvs-studio-analyzer"
        "PVS-Studio.lic"
        "PVS-Studio.cfg"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
        "/opt"
    DOC
        "Static code analyzer for C, C++")

find_program(cmPVS_STUDIO_ANALYZER_FILE_PATH
    NAMES
        "pvs-studio-analyzer"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
    DOC
        "Static code analyzer for C, C++")

find_program(cmPVS_STUDIO_PLOG_FILE_PATH
    NAMES
        "plog-converter"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
    DOC
        "Log converter")

find_file(cmPVS_STUDIO_LIC_FILE_PATH
    NAMES
        "PVS-Studio.lic"
    PATHS
        "$ENV{HOME}/.config/StaticAnalisis/PVS-Studio"
    DOC
        "License file")

find_file(cmPVS_STUDIO_CFG_FILE_PATH
    NAMES
        "PVS-Studio.cfg"
    PATHS
        "$ENV{HOME}/.config/StaticAnalisis/PVS-Studio"
    DOC
        "Configuration file")


if (cmPVS_STUDIO_FILE_PATH          STREQUAL "cmPVS_STUDIO_FILE_PATH-NOTFOUND" OR
    cmPVS_STUDIO_ANALYZER_FILE_PATH STREQUAL "cmPVS_STUDIO_ANALYZER_FILE_PATH-NOTFOUND" OR
    cmPVS_STUDIO_PLOG_FILE_PATH     STREQUAL "cmPVS_STUDIO_PLOG_FILE_PATH-NOTFOUND" OR
    cmPVS_STUDIO_LIC_FILE_PATH      STREQUAL "cmPVS_STUDIO_LIC_FILE_PATH-NOTFOUND" OR
    cmPVS_STUDIO_CFG_FILE_PATH      STREQUAL "cmPVS_STUDIO_CFG_FILE_PATH-NOTFOUND"
)
    set(cmPVS_STUDIO_FOUND 0)
else()
    set(cmPVS_STUDIO_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmPVS_STUDIO_FOUND: ${cmPVS_STUDIO_FOUND}")
message("   cmPVS_STUDIO_FILE_PATH:          ${cmPVS_STUDIO_FILE_PATH}")
message("   cmPVS_STUDIO_ANALYZER_FILE_PATH: ${cmPVS_STUDIO_ANALYZER_FILE_PATH}")
message("   cmPVS_STUDIO_PLOG_FILE_PATH:     ${cmPVS_STUDIO_PLOG_FILE_PATH}")
message("   cmPVS_STUDIO_LIC_FILE_PATH:      ${cmPVS_STUDIO_LIC_FILE_PATH}")
message("   cmPVS_STUDIO_CFG_FILE_PATH:      ${cmPVS_STUDIO_CFG_FILE_PATH}")

if (NOT cmPVS_STUDIO_FOUND AND PvsStudio_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
