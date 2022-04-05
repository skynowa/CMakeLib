#--------------------------------------------------------------------------------------------------
# \file  FindGitRevision.cmake
# \brief GIT revision informaytion
#
# cmGIT_REVISION_FOUND  - true if project under GIT
# cmGIT_REVISION_BRANCH - GIT current brunch
# cmGIT_REVISION_HASH   - GIT revision hash
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
if (NOT EXISTS "${CMAKE_SOURCE_DIR}/.git" AND NOT EXISTS "${CMAKE_SOURCE_DIR}/Tests/.git")
    set(cmGIT_REVISION_FOUND  0)
    set(cmGIT_REVISION_BRANCH "")
    set(cmGIT_REVISION_HASH   "")
else()
    execute_process(
        COMMAND git rev-parse --abbrev-ref HEAD
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE cmGIT_REVISION_BRANCH
        OUTPUT_STRIP_TRAILING_WHITESPACE)

    execute_process(
        COMMAND git log -1 --format=%h
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE cmGIT_REVISION_HASH
        OUTPUT_STRIP_TRAILING_WHITESPACE)

    if (NOT cmGIT_REVISION_BRANCH AND cmGIT_REVISION_HASH)
        set(cmGIT_REVISION_FOUND 0)
    else()
        set(cmGIT_REVISION_FOUND 1)
    endif()
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
