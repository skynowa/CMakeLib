#--------------------------------------------------------------------------------------------------
# \file  FindGitRevision.cmake
# \brief Git revision information
#
# cmGIT_REVISION_FOUND    - true when revision metadata is available
# cmGIT_REVISION_BRANCH   - current branch, empty for detached HEAD
# cmGIT_REVISION_HASH     - abbreviated revision hash
# cmGIT_REVISION_DETACHED - true when HEAD is detached
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
set(cmGIT_REVISION_FOUND    FALSE)
set(cmGIT_REVISION_BRANCH   "")
set(cmGIT_REVISION_HASH     "")
set(cmGIT_REVISION_DETACHED FALSE)

find_package(Git QUIET)

if ((Git_FOUND OR GIT_FOUND) AND GIT_EXECUTABLE AND IS_DIRECTORY "${CMAKE_SOURCE_DIR}")
    execute_process(
        COMMAND
            "${GIT_EXECUTABLE}" rev-parse --is-inside-work-tree
        WORKING_DIRECTORY
            "${CMAKE_SOURCE_DIR}"
        RESULT_VARIABLE
            _CMAKE_LIB_GIT_WORKTREE_RESULT
        OUTPUT_VARIABLE
            _CMAKE_LIB_GIT_IS_WORKTREE
        ERROR_QUIET
        OUTPUT_STRIP_TRAILING_WHITESPACE)

    if (_CMAKE_LIB_GIT_WORKTREE_RESULT EQUAL 0 AND _CMAKE_LIB_GIT_IS_WORKTREE STREQUAL "true")
        execute_process(
            COMMAND
                "${GIT_EXECUTABLE}" rev-parse --short HEAD
            WORKING_DIRECTORY
                "${CMAKE_SOURCE_DIR}"
            RESULT_VARIABLE
                _CMAKE_LIB_GIT_HASH_RESULT
            OUTPUT_VARIABLE
                cmGIT_REVISION_HASH
            ERROR_QUIET
            OUTPUT_STRIP_TRAILING_WHITESPACE)

        if (_CMAKE_LIB_GIT_HASH_RESULT EQUAL 0 AND NOT cmGIT_REVISION_HASH STREQUAL "")
            set(cmGIT_REVISION_FOUND TRUE)

            execute_process(
                COMMAND
                    "${GIT_EXECUTABLE}" symbolic-ref --quiet --short HEAD
                WORKING_DIRECTORY
                    "${CMAKE_SOURCE_DIR}"
                RESULT_VARIABLE
                    _CMAKE_LIB_GIT_BRANCH_RESULT
                OUTPUT_VARIABLE
                    cmGIT_REVISION_BRANCH
                ERROR_QUIET
                OUTPUT_STRIP_TRAILING_WHITESPACE)

            if (NOT _CMAKE_LIB_GIT_BRANCH_RESULT EQUAL 0)
                set(cmGIT_REVISION_BRANCH   "")
                set(cmGIT_REVISION_DETACHED TRUE)
            endif()
        else()
            set(cmGIT_REVISION_HASH "")
        endif()
    endif()
endif()

unset(_CMAKE_LIB_GIT_BRANCH_RESULT)
unset(_CMAKE_LIB_GIT_HASH_RESULT)
unset(_CMAKE_LIB_GIT_IS_WORKTREE)
unset(_CMAKE_LIB_GIT_WORKTREE_RESULT)
#--------------------------------------------------------------------------------------------------
# trace
if (NOT GitRevision_FIND_QUIETLY)
    message(STATUS "cmGIT_REVISION_FOUND: ${cmGIT_REVISION_FOUND}")
    message(STATUS "cmGIT_REVISION_BRANCH: ${cmGIT_REVISION_BRANCH}")
    message(STATUS "cmGIT_REVISION_HASH: ${cmGIT_REVISION_HASH}")
    message(STATUS "cmGIT_REVISION_DETACHED: ${cmGIT_REVISION_DETACHED}")
endif()
#--------------------------------------------------------------------------------------------------
