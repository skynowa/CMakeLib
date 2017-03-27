#--------------------------------------------------------------------------------------------------
# \file  FindQt5.cmake
# \brief FindQt5 environment
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------.
set(_QT5_MODULES Core Gui Widgets Sql Network Xml Concurrent)

if (OS_ANDROID)
    set(_QT5_MODULES ${_QT5_MODULES} Qml Quick)
endif()

foreach(COMPONENT ${_QT5_MODULES})
   find_package(Qt5${COMPONENT} QUIET REQUIRED)

   include_directories(${Qt5${COMPONENT}_INCLUDE_DIRS})
   add_definitions(${Qt5${COMPONENT}_DEFINITIONS})
   link_libraries(${Qt5${COMPONENT}_LIBRARIES})
endforeach()
#--------------------------------------------------------------------------------------------------
