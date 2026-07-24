#--------------------------------------------------------------------------------------------------
# \file  FindOS.cmake
# \brief find OS
#
# OS environment:
#   ENV_WIN
#   ENV_UNIX
#   ENV_LINUX
#   ENV_BSD
#   ENV_APPLE
#
# Environment flags describe platform families, so Android has both ENV_UNIX and ENV_LINUX.
# OS_LINUX identifies desktop/server Linux and remains false for Android.
#
# OS:
#   OS_WIN
#   OS_LINUX
#   OS_ANDROID
#   OS_BSD
#   OS_FREEBSD
#   OS_OPENBSD
#   OS_NETBSD
#   OS_DRAGONFLY
#   OS_APPLE
#   OS_MACOSX
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# initialize results
set(_CMAKE_LIB_OS_VARIABLES
    ENV_WIN
    ENV_UNIX
    ENV_LINUX
    ENV_BSD
    ENV_APPLE
    OS_WIN
    OS_LINUX
    OS_ANDROID
    OS_BSD
    OS_FREEBSD
    OS_OPENBSD
    OS_NETBSD
    OS_DRAGONFLY
    OS_APPLE
    OS_MACOSX)

foreach(_CMAKE_LIB_OS_VARIABLE IN LISTS _CMAKE_LIB_OS_VARIABLES)
    unset(${_CMAKE_LIB_OS_VARIABLE} CACHE)
    set(${_CMAKE_LIB_OS_VARIABLE} FALSE)
endforeach()
#--------------------------------------------------------------------------------------------------
# classify the target platform
if (ANDROID OR CMAKE_SYSTEM_NAME STREQUAL "Android")
    set(ENV_UNIX   TRUE)
    set(ENV_LINUX  TRUE)
    set(OS_ANDROID TRUE)
elseif (WIN32 OR CMAKE_SYSTEM_NAME MATCHES "^(Windows|WindowsStore|WindowsPhone|CYGWIN|MSYS)$")
    set(ENV_WIN TRUE)
    set(OS_WIN  TRUE)
elseif (APPLE OR CMAKE_SYSTEM_NAME MATCHES "^(Darwin|iOS|tvOS|watchOS|visionOS)$")
    set(ENV_UNIX  TRUE)
    set(ENV_APPLE TRUE)
    set(OS_APPLE  TRUE)

    if (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
        set(OS_MACOSX TRUE)
    endif()
elseif (CMAKE_SYSTEM_NAME MATCHES "^(FreeBSD|OpenBSD|NetBSD|DragonFly)$")
    set(ENV_UNIX TRUE)
    set(ENV_BSD  TRUE)
    set(OS_BSD   TRUE)

    if (CMAKE_SYSTEM_NAME STREQUAL "FreeBSD")
        set(OS_FREEBSD TRUE)
    elseif (CMAKE_SYSTEM_NAME STREQUAL "OpenBSD")
        set(OS_OPENBSD TRUE)
    elseif (CMAKE_SYSTEM_NAME STREQUAL "NetBSD")
        set(OS_NETBSD TRUE)
    elseif (CMAKE_SYSTEM_NAME STREQUAL "DragonFly")
        set(OS_DRAGONFLY TRUE)
    endif()
elseif (CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(ENV_UNIX  TRUE)
    set(ENV_LINUX TRUE)
    set(OS_LINUX  TRUE)
elseif (UNIX)
    set(ENV_UNIX TRUE)
endif()

unset(_CMAKE_LIB_OS_VARIABLE)
unset(_CMAKE_LIB_OS_VARIABLES)
#--------------------------------------------------------------------------------------------------
# trace
# message("")
# message("************ FindOS.cmake Variables **************")

# message("* OS environment:")
# message("*   ENV_WIN:    " ${ENV_WIN})
# message("*   ENV_UNIX:   " ${ENV_UNIX})
# message("*   ENV_LINUX:  " ${ENV_LINUX})
# message("*   ENV_BSD:    " ${ENV_BSD})
# message("*   ENV_APPLE:  " ${ENV_APPLE})

# message("* OS:")
# message("*   OS_WIN:     " ${OS_WIN})
# message("*   OS_LINUX:   " ${OS_LINUX})
# message("*   OS_ANDROID: " ${OS_ANDROID})
# message("*   OS_BSD:     " ${OS_BSD})
# message("*   OS_FREEBSD: " ${OS_FREEBSD})
# message("*   OS_OPENBSD: " ${OS_OPENBSD})
# message("*   OS_NETBSD:  " ${OS_NETBSD})
# message("*   OS_DRAGONFLY: " ${OS_DRAGONFLY})
# message("*   OS_APPLE:   " ${OS_APPLE})
# message("*   OS_MACOSX:  " ${OS_MACOSX})

# message("**************************************************")
# message("")
#--------------------------------------------------------------------------------------------------
