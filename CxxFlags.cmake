#--------------------------------------------------------------------------------------------------
# \file  CxxFlags.cmake
# \brief More CMAKE_CXX_FLAGS
#
# MSVC  -
# Clang -
# MINGW -
# GCC   - http://gcc.gnu.org/onlinedocs/
#
# TODO: https://github.com/ericniebler/meta/blob/master/CMakeLists.txt
#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
if     (MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /permissive- /W4 /WX")
elseif (MINGW)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pipe -Wall -Wno-deprecated -Wextra -Wconversion")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wshadow -Wno-unknown-pragmas -Wno-unused-parameter")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-variable -Wno-return-type-c-linkage")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wfatal-errors")
        # -pedantic
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ")
elseif (CMAKE_COMPILER_IS_CLANGXX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pipe -Wall -Wno-deprecated -Wextra -Wconversion")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wshadow -Wno-unused-parameter -Wno-unused-variable")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unknown-pragmas -Wno-return-type-c-linkage")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wfatal-errors -fcolor-diagnostics -Qunused-arguments")
        # -pedantic
elseif (CMAKE_COMPILER_IS_GNUCXX)
    if (1)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w -Wall -Wextra -pedantic")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wfatal-errors -fmax-errors=1")
        # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pipe -Wall -Wno-deprecated -Wextra -Wconversion")
        # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wshadow -Wno-unknown-pragmas -Wno-unused-parameter")
        # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-variable -Wno-return-type-c-linkage")
        # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector -Wformat -Wformat-security")
    else()
        include(CMake/CxxFlags_gcc_4.6.4.cmake)
    endif()
else()
    message("Unknown compiler")
endif()

if (OS_ANDROID)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pipe -Wall -Wno-deprecated -Wextra -Wconversion")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wshadow -Wno-unused-parameter -Wno-unused-variable")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unknown-pragmas -frtti -fexceptions")
endif()
#--------------------------------------------------------------------------------------------------
