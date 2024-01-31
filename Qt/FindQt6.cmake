#--------------------------------------------------------------------------------------------------
# \file  FindQt6.cmake
# \brief FindQt6 environment
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------.
set(_QT6_MODULES
    Core
    Gui
    Widgets
    Sql
    Network
    Xml
    PrintSupport
    Concurrent
    Core5Compat # Install - Qt 5 Compatibility Module
    Multimedia
    MultimediaWidgets
)

if (OS_ANDROID)
    set(_QT6_MODULES ${_QT6_MODULES} Qml Quick)
endif()

foreach(COMPONENT ${_QT6_MODULES})
   find_package(Qt6${COMPONENT} QUIET REQUIRED)

   if ("${COMPONENT}" STREQUAL "Widgets")
       message("Qt6Widgets version: ${Qt6Widgets_VERSION_STRING}")
   endif()

   include_directories(${Qt6${COMPONENT}_INCLUDE_DIRS})
   add_definitions(${Qt6${COMPONENT}_DEFINITIONS})
   link_libraries(${Qt6${COMPONENT}_LIBRARIES})
endforeach()
#--------------------------------------------------------------------------------------------------
