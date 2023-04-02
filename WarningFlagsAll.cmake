#--------------------------------------------------------------------------------------------------
# \file  WarningFlagsAll.cmake
# \brief Extra warning level
#
# MSVC  -
# Clang -
# AppleClang -
# MINGW -
# GCC   - http://gcc.gnu.org/onlinedocs/
#
# \see
# https://embeddedartistry.com/blog/2017/06/07/warnings-weverything-and-the-kitchen-sink/
# https://git.gnome.org/browse/gnome-common/tree/macros2/gnome-compiler-flags.m4
# TODO: https://github.com/ericniebler/meta/blob/master/CMakeLists.txt
#
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# CMake - https://discourse.cmake.org/t/how-to-set-warning-level-correctly-in-modern-cmake/1103
if     (MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /permissive- /W4 /WX /w14244")

    # Fix: cl : Command line warning D9025 : overriding '/W3' with '/W4'
    if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
        string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    else()
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
    endif()
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic -Werror -Wfatal-errors")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-variable -Wno-unused-parameter -Wno-unknown-pragmas")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated -Wconversion -Wsign-conversion -Wshadow")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-return-type-c-linkage")
endif()
#--------------------------------------------------------------------------------------------------
if     (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    # n/a
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Weverything")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Weverything")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    if (1)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fmax-errors=1")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat -Wformat-security")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector")
    else()
        include(CMake/WarningFlags_gcc_4.6.4.cmake)
    endif()
else()
    message("WarningFlagsAll: ${CMAKE_CXX_COMPILER_ID} - unknown compiler")
endif()

if (OS_ANDROID)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -frtti -fexceptions")
endif()
#--------------------------------------------------------------------------------------------------
