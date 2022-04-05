#--------------------------------------------------------------------------------------------------
# \file  FindGitRevision.cmake
# \brief GIT revision informaytion
#
# cmGIT_REVISION_FOUND  - true if project under GIT
# cmGIT_REVISION_BRANCH - GIT current brunch
# cmGIT_REVISION_HASH   - GIT revision hash
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# cmGIT_REVISION_BRANCH
execute_process(
    COMMAND
        git rev-parse --abbrev-ref HEAD
    RESULT_VARIABLE
        STATUS
    WORKING_DIRECTORY
        ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE
        cmGIT_REVISION_BRANCH
    OUTPUT_STRIP_TRAILING_WHITESPACE)

if (STATUS AND NOT STATUS EQUAL 0)
    message(FATAL_ERROR "FAILED: ${STATUS}")
endif()

# cmGIT_REVISION_HASH
execute_process(
    COMMAND
        git log -1 --format=%h
    RESULT_VARIABLE
        STATUS
    WORKING_DIRECTORY
        ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE
        cmGIT_REVISION_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE)

if (STATUS AND NOT STATUS EQUAL 0)
    message(FATAL_ERROR "FAILED: ${STATUS}")
endif()

# cmGIT_REVISION_FOUND
if (NOT cmGIT_REVISION_BRANCH AND cmGIT_REVISION_HASH)
    set(cmGIT_REVISION_FOUND 0)
else()
    set(cmGIT_REVISION_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmGIT_REVISION_FOUND: ${cmGIT_REVISION_FOUND}")
message("   cmGIT_REVISION_BRANCH: ${cmGIT_REVISION_BRANCH}")
message("   cmGIT_REVISION_HASH:   ${cmGIT_REVISION_HASH}")

if (NOT cmGIT_REVISION_FOUND AND GitRevision_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
