#--------------------------------------------------------------------------------------------------
# \file  WarningFlags.cmake
# \brief Extra warning level
#
# MSVC  -
# Clang -
# MINGW -
# GCC   - http://gcc.gnu.org/onlinedocs/
#
# TODO: https://github.com/ericniebler/meta/blob/master/CMakeLists.txt
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
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic -Werror -Wfatal-errors")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-variable -Wno-unused-parameter -Wno-unknown-pragmas")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated -Wconversion -Wsign-conversion -Wshadow")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-return-type-c-linkage")
endif()
#--------------------------------------------------------------------------------------------------
if     (MSVC)
    # n/a
elseif (MINGW)
    # n/a
elseif (CMAKE_COMPILER_IS_CLANGXX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fcolor-diagnostics -Qunused-arguments")
elseif (CMAKE_COMPILER_IS_GNUCXX)
    if (1)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fmax-errors=1")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat -Wformat-security")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector")
    else()
        include(CMake/WarningFlags_gcc_4.6.4.cmake)
    endif()
else()
    message("Unknown compiler")
endif()

if (OS_ANDROID)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -frtti -fexceptions")
endif()
#--------------------------------------------------------------------------------------------------
