### DELETE begin ###
[ProgramName]      - binary name
[RealProgramName]  - real binary name
[PROGRAM_NAME]     - binary name
[CM_PREFIX]        - "cm" or "<empty>"
[Comments]         - comments
### DELETE end ###


#--------------------------------------------------------------------------------------------------
# \file  Find[ProgramName].cmake
# \brief Find [RealProgramName]
#
# [CM_PREFIX][PROGRAM_NAME]_FOUND     - true if found
# [CM_PREFIX][PROGRAM_NAME]_FILE_PATH - where to find program
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_program([CM_PREFIX][PROGRAM_NAME]_FILE_PATH
    NAMES
        "[RealProgramName]"
    PATHS
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
        "/opt"
    DOC
        "[Comments]")

if ([CM_PREFIX][PROGRAM_NAME]_FILE_PATH STREQUAL "[CM_PREFIX][PROGRAM_NAME]_FILE_PATH-NOTFOUND")
    set([CM_PREFIX][PROGRAM_NAME]_FOUND 0)
else()
    set([CM_PREFIX][PROGRAM_NAME]_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT [CM_PREFIX][PROGRAM_NAME]_FOUND AND [ProgramName]_FIND_REQUIRED)
    message("     [CM_PREFIX][PROGRAM_NAME]: ${[CM_PREFIX][PROGRAM_NAME]}")

    message(FATAL_ERROR "[CM_PREFIX][PROGRAM_NAME]_FOUND: ${[CM_PREFIX][PROGRAM_NAME]_FOUND}")
else()
    message(STATUS "[CM_PREFIX][PROGRAM_NAME]_FOUND: ${[CM_PREFIX][PROGRAM_NAME]_FOUND}")
endif()
#--------------------------------------------------------------------------------------------------
