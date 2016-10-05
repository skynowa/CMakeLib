#--------------------------------------------------------------------------------------------------
# \file  Validate.cmake
# \brief Validate environment
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------.
# Check if Qtversion is >=QT_OFFICIAL_VERSION.
# If so, we are good. Otherwise we will post a warning of versions (<QT_OFFICIAL_VERSION)
string(REGEX MATCH "^5\\.[3]\\.[0-1]+" QT_VERSION_MATCH "${Qt5Core_VERSION_STRING}")
    if (QT_VERSION_MATCH)
      message(WARNING "Warning: You are using Qt ${Qt5Core_VERSION_STRING}. "
                      "Officially supported version is Qt ${QT_OFFICIAL_VERSION}")
endif()

if (${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    message(FATAL_ERROR
        "In-source builds not allowed. "
        "Please make a new directory (called a build directory) and run CMake from there. "
        "You may need to remove CMakeCache.txt.")
endif()
#--------------------------------------------------------------------------------------------------
