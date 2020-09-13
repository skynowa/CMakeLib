#--------------------------------------------------------------------------------------------------
# \file  FindCMakeLib.cmake
# \brief Find CMakeLib include path
#
# CMAKE_LIB_FOUND    - true if system has library
# CMAKE_LIB_INCLUDES - include directories
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(CMAKE_LIB_INCLUDES
    NAMES
        "CMakeLib"
    PATHS
		"${CMAKE_ROOT}/Modules"
    PATH_SUFFIXES
        ""
    DOC
        "CMake library")

if (NOT CMAKE_LIB_INCLUDES)
    set(CMAKE_LIB_FOUND 0)
    set(CMAKE_LIB_INCLUDES "")
else()
    set(CMAKE_LIB_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT CMAKE_LIB_FOUND AND CMakeLib_FIND_REQUIRED)
	message("     CMAKE_LIB_INCLUDES: ${CMAKE_LIB_INCLUDES}")

    message(FATAL_ERROR "CMAKE_LIB_FOUND: ${CMAKE_LIB_FOUND}")
else()
    message(STATUS "CMAKE_LIB_FOUND: ${CMAKE_LIB_FOUND}")
endif()
#--------------------------------------------------------------------------------------------------
