#--------------------------------------------------------------------------------------------------
# \file  InstallDirPlatform.cmake
# \brief Platform install dir
#
# CL_INSTALL_DIR_PLATFORM
#
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
set(CL_INSTALL_DIR_PLATFORM
    "${CMAKE_HOST_SYSTEM_NAME}_${CMAKE_HOST_SYSTEM_PROCESSOR}_Qt${Qt5Core_VERSION_STRING}_${CMAKE_BUILD_TYPE}")
#--------------------------------------------------------------------------------------------------
message("CL_INSTALL_DIR_PLATFORM - ${CL_INSTALL_DIR_PLATFORM}")
#--------------------------------------------------------------------------------------------------
