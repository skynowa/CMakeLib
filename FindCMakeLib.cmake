#--------------------------------------------------------------------------------------------------
# \file  FindCMakeLib.cmake
# \brief Find globaL variables
#
# CMAKE_DATA_DIR_DEFAULT - moduls default directory
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_package(GlobalVariables)

set(CMAKE_MODULE_PATH "${CMAKE_DATA_DIR_DEFAULT}/CMakeLib;${CMAKE_MODULE_PATH}")
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "CMakeLib:")
message(STATUS "CMAKE_MODULE_PATH: ${CMAKE_DATA_DIR_DEFAULT};${CMAKE_MODULE_PATH}")
message("")
#--------------------------------------------------------------------------------------------------
