#--------------------------------------------------------------------------------------------------
# \file  CMakeLists.txt
# \brief CMakeLib - install as modules
#
# In project use CMake:
#
# find_package(CMakeLib REQUIRED)
#--------------------------------------------------------------------------------------------------


cmake_minimum_required(VERSION 3.15)
#--------------------------------------------------------------------------------------------------
project("CMakeLib")
#--------------------------------------------------------------------------------------------------
# tests
include(CTest)

if (BUILD_TESTING)
    add_test(
        NAME
            CMakeLib.FindOS
        COMMAND
            ${CMAKE_COMMAND}
            "-DCMAKE_LIB_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}"
            -P "${CMAKE_CURRENT_SOURCE_DIR}/Tests/FindOS.cmake")

    find_package(Git QUIET)

    if (GIT_FOUND)
        foreach(GIT_REVISION_TEST_MODE worktree detached)
            add_test(
                NAME
                    "CMakeLib.FindGitRevision.${GIT_REVISION_TEST_MODE}"
                COMMAND
                    ${CMAKE_COMMAND}
                    "-DCMAKE_LIB_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}"
                    "-DCMAKE_LIB_TEST_BINARY_DIR=${CMAKE_CURRENT_BINARY_DIR}/Tests"
                    "-DCMAKE_LIB_TEST_GIT_EXECUTABLE=${GIT_EXECUTABLE}"
                    "-DCMAKE_LIB_TEST_MODE=${GIT_REVISION_TEST_MODE}"
                    -P "${CMAKE_CURRENT_SOURCE_DIR}/Tests/FindGitRevision.cmake")
        endforeach()
    endif()

    foreach(GIT_REVISION_TEST_MODE source-archive git-missing)
        add_test(
            NAME
                "CMakeLib.FindGitRevision.${GIT_REVISION_TEST_MODE}"
            COMMAND
                ${CMAKE_COMMAND}
                "-DCMAKE_LIB_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}"
                "-DCMAKE_LIB_TEST_BINARY_DIR=${CMAKE_CURRENT_BINARY_DIR}/Tests"
                "-DCMAKE_LIB_TEST_MODE=${GIT_REVISION_TEST_MODE}"
                -P "${CMAKE_CURRENT_SOURCE_DIR}/Tests/FindGitRevision.cmake")
    endforeach()
endif()
#--------------------------------------------------------------------------------------------------
# install
message(STATUS "CMAKE_ROOT: ${CMAKE_ROOT}")

# dirs
install(
    DIRECTORY
        ${CMAKE_SOURCE_DIR}
    DESTINATION
        ${CMAKE_ROOT}/Modules
    FILES_MATCHING
        PATTERN "*"
        PATTERN ".git"               EXCLUDE
        PATTERN ".gitignore"         EXCLUDE
        PATTERN "CMakeLists.txt"     EXCLUDE
        PATTERN "FindCMakeLib.cmake" EXCLUDE
        PATTERN "Templates"          EXCLUDE
        PATTERN "Tests"              EXCLUDE
        PATTERN "install.sh"         EXCLUDE
        PATTERN "uninstall.sh"       EXCLUDE)

# files
install(
    FILES
        FindCMakeLib.cmake
    DESTINATION
        ${CMAKE_ROOT}/Modules)
#--------------------------------------------------------------------------------------------------
# uninstall
set(TARGET_DIR ${CMAKE_ROOT}/Modules/CMakeLib)
message(STATUS "TARGET_DIR: ${TARGET_DIR}")

add_custom_target(uninstall
	COMMAND
		${CMAKE_COMMAND}
		-DPROJECT_INSTALL_PATH=${TARGET_DIR}
		-P ${CMAKE_SOURCE_DIR}/Uninstall.cmake)
#--------------------------------------------------------------------------------------------------
