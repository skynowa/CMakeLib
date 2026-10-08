#--------------------------------------------------------------------------------------------------
# \file  FindGitRevision.cmake
# \brief Test Git revision discovery
#--------------------------------------------------------------------------------------------------


foreach(REQUIRED_VARIABLE
    CMAKE_LIB_SOURCE_DIR
    CMAKE_LIB_TEST_BINARY_DIR
    CMAKE_LIB_TEST_MODE)
    if (NOT DEFINED ${REQUIRED_VARIABLE})
        message(FATAL_ERROR "${REQUIRED_VARIABLE} is required")
    endif()
endforeach()

set(TEST_DIRECTORY "${CMAKE_LIB_TEST_BINARY_DIR}/GitRevision-${CMAKE_LIB_TEST_MODE}")
file(REMOVE_RECURSE "${TEST_DIRECTORY}")
file(MAKE_DIRECTORY "${TEST_DIRECTORY}")

function(assert_revision_variable VARIABLE EXPECTED)
    if (NOT "${${VARIABLE}}" STREQUAL "${EXPECTED}")
        message(FATAL_ERROR
            "${CMAKE_LIB_TEST_MODE}: expected ${VARIABLE}=${EXPECTED}, got ${${VARIABLE}}")
    endif()
endfunction()

function(run_test_git)
    execute_process(
        COMMAND
            "${CMAKE_LIB_TEST_GIT_EXECUTABLE}" ${ARGN}
        WORKING_DIRECTORY
            "${TEST_DIRECTORY}"
        RESULT_VARIABLE
            RESULT
        ERROR_VARIABLE
            ERROR_OUTPUT
        OUTPUT_QUIET)

    if (NOT RESULT EQUAL 0)
        message(FATAL_ERROR "Git command failed (${RESULT}): ${ERROR_OUTPUT}")
    endif()
endfunction()

if (CMAKE_LIB_TEST_MODE STREQUAL "worktree" OR
    CMAKE_LIB_TEST_MODE STREQUAL "detached")
    if (NOT DEFINED CMAKE_LIB_TEST_GIT_EXECUTABLE)
        message(FATAL_ERROR "CMAKE_LIB_TEST_GIT_EXECUTABLE is required")
    endif()

    run_test_git(init --quiet)
    run_test_git(
        -c user.name=CMakeLib
        -c user.email=cmakelib@example.invalid
        commit --quiet --allow-empty -m initial)

    if (CMAKE_LIB_TEST_MODE STREQUAL "detached")
        run_test_git(checkout --quiet --detach HEAD)
    endif()

    execute_process(
        COMMAND
            "${CMAKE_LIB_TEST_GIT_EXECUTABLE}" rev-parse --short HEAD
        WORKING_DIRECTORY
            "${TEST_DIRECTORY}"
        RESULT_VARIABLE
            EXPECTED_HASH_RESULT
        OUTPUT_VARIABLE
            EXPECTED_HASH
        ERROR_QUIET
        OUTPUT_STRIP_TRAILING_WHITESPACE)

    if (NOT EXPECTED_HASH_RESULT EQUAL 0)
        message(FATAL_ERROR "Unable to read the test repository hash")
    endif()

    if (CMAKE_LIB_TEST_MODE STREQUAL "worktree")
        execute_process(
            COMMAND
                "${CMAKE_LIB_TEST_GIT_EXECUTABLE}" symbolic-ref --quiet --short HEAD
            WORKING_DIRECTORY
                "${TEST_DIRECTORY}"
            RESULT_VARIABLE
                EXPECTED_BRANCH_RESULT
            OUTPUT_VARIABLE
                EXPECTED_BRANCH
            ERROR_QUIET
            OUTPUT_STRIP_TRAILING_WHITESPACE)

        if (NOT EXPECTED_BRANCH_RESULT EQUAL 0)
            message(FATAL_ERROR "Unable to read the test repository branch")
        endif()
    endif()
elseif (CMAKE_LIB_TEST_MODE STREQUAL "git-missing")
    set(CMAKE_DISABLE_FIND_PACKAGE_Git TRUE)
    unset(GIT_EXECUTABLE)
    unset(GIT_EXECUTABLE CACHE)
    unset(GIT_FOUND)
    unset(Git_FOUND)
elseif (NOT CMAKE_LIB_TEST_MODE STREQUAL "source-archive")
    message(FATAL_ERROR "Unknown CMAKE_LIB_TEST_MODE: ${CMAKE_LIB_TEST_MODE}")
endif()

set(CMAKE_SOURCE_DIR "${TEST_DIRECTORY}")
list(PREPEND CMAKE_MODULE_PATH "${CMAKE_LIB_SOURCE_DIR}")

find_package(GitRevision QUIET REQUIRED)

if (CMAKE_LIB_TEST_MODE STREQUAL "worktree")
    assert_revision_variable(cmGIT_REVISION_FOUND TRUE)
    assert_revision_variable(cmGIT_REVISION_BRANCH "${EXPECTED_BRANCH}")
    assert_revision_variable(cmGIT_REVISION_HASH "${EXPECTED_HASH}")
    assert_revision_variable(cmGIT_REVISION_DETACHED FALSE)
elseif (CMAKE_LIB_TEST_MODE STREQUAL "detached")
    assert_revision_variable(cmGIT_REVISION_FOUND TRUE)
    assert_revision_variable(cmGIT_REVISION_BRANCH "")
    assert_revision_variable(cmGIT_REVISION_HASH "${EXPECTED_HASH}")
    assert_revision_variable(cmGIT_REVISION_DETACHED TRUE)
else()
    assert_revision_variable(cmGIT_REVISION_FOUND FALSE)
    assert_revision_variable(cmGIT_REVISION_BRANCH "")
    assert_revision_variable(cmGIT_REVISION_HASH "")
    assert_revision_variable(cmGIT_REVISION_DETACHED FALSE)
endif()

message(STATUS "FindGitRevision case passed: ${CMAKE_LIB_TEST_MODE}")
