#--------------------------------------------------------------------------------------------------
# \file  FindPvsStudio.cmake
# \brief Find pvs-studio-analyzer
#
# PVS_STUDIO_FOUND              - true if found
# PVS_STUDIO_FILE_PATH          - where to find program
# PVS_STUDIO_ANALYZER_FILE_PATH - where to find program
# PVS_STUDIO_LIC_FILE_PATH      - where to find license file
# PVS_STUDIO_CFG_FILE_PATH      - where to find configuration file
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program(PVS_STUDIO_FILE_PATH
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

find_program(PVS_STUDIO_ANALYZER_FILE_PATH
    NAMES
        "pvs-studio-analyzer"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
    DOC
        "Static code analyzer for C, C++")

find_program(PVS_STUDIO_PLOG_FILE_PATH
    NAMES
        "plog-converter"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
    DOC
        "Log converter")

find_file(PVS_STUDIO_LIC_FILE_PATH
    NAMES
        "PVS-Studio.lic"
    PATHS
        "$ENV{HOME}/.config/StaticAnalisis/PVS-Studio"
    DOC
        "License file")

find_file(PVS_STUDIO_CFG_FILE_PATH
    NAMES
        "PVS-Studio.cfg"
    PATHS
        "$ENV{HOME}/.config/StaticAnalisis/PVS-Studio"
    DOC
        "Configuration file")


if (PVS_STUDIO_FILE_PATH          STREQUAL "PVS_STUDIO_FILE_PATH-NOTFOUND" OR
    PVS_STUDIO_ANALYZER_FILE_PATH STREQUAL "PVS_STUDIO_ANALYZER_FILE_PATH-NOTFOUND" OR
    PVS_STUDIO_PLOG_FILE_PATH     STREQUAL "PVS_STUDIO_PLOG_FILE_PATH-NOTFOUND" OR
    PVS_STUDIO_LIC_FILE_PATH      STREQUAL "PVS_STUDIO_LIC_FILE_PATH-NOTFOUND" OR
    PVS_STUDIO_CFG_FILE_PATH      STREQUAL "PVS_STUDIO_CFG_FILE_PATH-NOTFOUND"
)
    set(PVS_STUDIO_FOUND 0)
else()
    set(PVS_STUDIO_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT PVS_STUDIO_FOUND AND PvsStudio_FIND_REQUIRED)
    message("     PVS_STUDIO_FILE_PATH:          ${PVS_STUDIO_FILE_PATH}")
    message("     PVS_STUDIO_ANALYZER_FILE_PATH: ${PVS_STUDIO_ANALYZER_FILE_PATH}")
    message("     PVS_STUDIO_PLOG_FILE_PATH:     ${PVS_STUDIO_PLOG_FILE_PATH}")
    message("     PVS_STUDIO_LIC_FILE_PATH:      ${PVS_STUDIO_LIC_FILE_PATH}")
    message("     PVS_STUDIO_CFG_FILE_PATH:      ${PVS_STUDIO_CFG_FILE_PATH}")

    message(FATAL_ERROR "PVS_STUDIO_FOUND: ${PVS_STUDIO_FOUND}")
else()
    message(STATUS "PVS_STUDIO_FOUND: ${PVS_STUDIO_FOUND}")
endif()
#--------------------------------------------------------------------------------------------------
