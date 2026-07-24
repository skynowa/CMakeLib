#--------------------------------------------------------------------------------------------------
# \file  FindOS.cmake
# \brief Test target-platform detection
#--------------------------------------------------------------------------------------------------


if (NOT DEFINED CMAKE_LIB_SOURCE_DIR)
    message(FATAL_ERROR "CMAKE_LIB_SOURCE_DIR is required")
endif()

function(assert_platform_variable VARIABLE EXPECTED)
    if (NOT "${${VARIABLE}}" STREQUAL "${EXPECTED}")
        message(FATAL_ERROR
            "${CMAKE_SYSTEM_NAME}: expected ${VARIABLE}=${EXPECTED}, got ${${VARIABLE}}")
    endif()
endfunction()

function(test_platform NAME SYSTEM_NAME WIN UNIX APPLE ANDROID)
    set(CMAKE_SYSTEM_NAME "${SYSTEM_NAME}")
    set(WIN32             "${WIN}")
    set(UNIX              "${UNIX}")
    set(APPLE             "${APPLE}")
    set(ANDROID           "${ANDROID}")

    include("${CMAKE_LIB_SOURCE_DIR}/FindOS.cmake")

    foreach(EXPECTATION IN LISTS ARGN)
        string(REPLACE "=" ";" EXPECTATION_PARTS "${EXPECTATION}")
        list(GET EXPECTATION_PARTS 0 VARIABLE)
        list(GET EXPECTATION_PARTS 1 EXPECTED)
        assert_platform_variable("${VARIABLE}" "${EXPECTED}")
    endforeach()

    message(STATUS "FindOS case passed: ${NAME}")
endfunction()

test_platform(
    "cross-windows"
    "Windows"
    FALSE FALSE FALSE FALSE
    "ENV_WIN=TRUE"
    "ENV_UNIX=FALSE"
    "OS_WIN=TRUE"
    "OS_LINUX=FALSE"
    "OS_ANDROID=FALSE")

test_platform(
    "linux-x86-64"
    "Linux"
    FALSE TRUE FALSE FALSE
    "ENV_UNIX=TRUE"
    "ENV_LINUX=TRUE"
    "OS_LINUX=TRUE"
    "OS_ANDROID=FALSE")

test_platform(
    "android-arm64"
    "Android"
    FALSE TRUE FALSE TRUE
    "ENV_UNIX=TRUE"
    "ENV_LINUX=TRUE"
    "OS_LINUX=FALSE"
    "OS_ANDROID=TRUE")

test_platform(
    "cross-android-x86-64"
    "Android"
    FALSE FALSE FALSE FALSE
    "ENV_LINUX=TRUE"
    "OS_LINUX=FALSE"
    "OS_ANDROID=TRUE")

test_platform(
    "macos"
    "Darwin"
    FALSE TRUE TRUE FALSE
    "ENV_APPLE=TRUE"
    "OS_APPLE=TRUE"
    "OS_MACOSX=TRUE")

test_platform(
    "ios"
    "iOS"
    FALSE TRUE TRUE FALSE
    "ENV_APPLE=TRUE"
    "OS_APPLE=TRUE"
    "OS_MACOSX=FALSE")

test_platform(
    "freebsd"
    "FreeBSD"
    FALSE TRUE FALSE FALSE
    "ENV_BSD=TRUE"
    "OS_BSD=TRUE"
    "OS_FREEBSD=TRUE"
    "OS_OPENBSD=FALSE")

test_platform(
    "openbsd"
    "OpenBSD"
    FALSE TRUE FALSE FALSE
    "ENV_BSD=TRUE"
    "OS_BSD=TRUE"
    "OS_FREEBSD=FALSE"
    "OS_OPENBSD=TRUE")

test_platform(
    "netbsd"
    "NetBSD"
    FALSE TRUE FALSE FALSE
    "ENV_BSD=TRUE"
    "OS_BSD=TRUE"
    "OS_NETBSD=TRUE")

test_platform(
    "dragonfly"
    "DragonFly"
    FALSE TRUE FALSE FALSE
    "ENV_BSD=TRUE"
    "OS_BSD=TRUE"
    "OS_DRAGONFLY=TRUE")
