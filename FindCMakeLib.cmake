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
message(STATUS "CMAKE_LIB_FOUND: ${CMAKE_LIB_FOUND}")
message("   CMAKE_LIB_INCLUDES: ${CMAKE_LIB_INCLUDES}")

if (NOT CMAKE_LIB_FOUND AND CMakeLib_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
# CMAKE_MODULE_PATH - set
list(APPEND CMAKE_MODULE_PATH "${CMAKE_LIB_INCLUDES}/CMakeLib")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_LIB_INCLUDES}/CMakeLib/Functions")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_LIB_INCLUDES}/CMakeLib/StaticAnalisis")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_LIB_INCLUDES}/CMakeLib/Qt5")

message("   CMAKE_MODULE_PATH:  ${CMAKE_MODULE_PATH}")
#--------------------------------------------------------------------------------------------------
