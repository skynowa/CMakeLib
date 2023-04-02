#--------------------------------------------------------------------------------------------------
# \file  ExtraWarningFlags.cmake
# \brief
#
# WARNING_FLAGS_ALL - all warnings
#
# \faq
# https://git.gnome.org/browse/gnome-common/tree/macros2/gnome-compiler-flags.m4
# https://embeddedartistry.com/blog/2017/06/07/warnings-weverything-and-the-kitchen-sink/
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
if     (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(WARNING_FLAGS_ALL "/W3")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(WARNING_FLAGS_ALL "-Weverything")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
    set(WARNING_FLAGS_ALL "-Weverything")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(WARNING_FLAGS_ALL "-Wall -Wextra -Wpedantic -Werror")
else()
    message("CMakeLib: ${CMAKE_CXX_COMPILER_ID} - unknown compiler")
endif()
#--------------------------------------------------------------------------------------------------
