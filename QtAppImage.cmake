# Linux Qt AppImage packaging using externally supplied linuxdeploy and its Qt plugin.
# cmakelib_add_appimage(TARGET app DESKTOP_FILE path ICON_FILE path [ICON_NAME name]
#     [ICON_SIZE 256x256] [VERSION version] [PACKAGE_TARGET appimage])
# Requires CMake 3.17+ and the Qt6::qmake imported target.
include_guard(GLOBAL)

function(cmakelib_add_appimage)
    cmake_parse_arguments(PARSE_ARGV 0 app ""
        "TARGET;DESKTOP_FILE;ICON_FILE;ICON_NAME;ICON_SIZE;VERSION;PACKAGE_TARGET" "")
    if(app_UNPARSED_ARGUMENTS OR app_KEYWORDS_MISSING_VALUES)
        message(FATAL_ERROR "cmakelib_add_appimage: unknown arguments or missing values")
    endif()
    foreach(required IN ITEMS TARGET DESKTOP_FILE ICON_FILE)
        if(NOT app_${required})
            message(FATAL_ERROR "cmakelib_add_appimage: ${required} is required")
        endif()
    endforeach()
    if(NOT CMAKE_SYSTEM_NAME STREQUAL "Linux")
        return()
    endif()
    if(NOT TARGET "${app_TARGET}" OR NOT TARGET Qt6::qmake)
        message(FATAL_ERROR "cmakelib_add_appimage: application target and Qt6::qmake must exist")
    endif()
    foreach(resource IN ITEMS DESKTOP_FILE ICON_FILE)
        get_filename_component(app_${resource} "${app_${resource}}" ABSOLUTE
            BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
        if(NOT EXISTS "${app_${resource}}")
            message(FATAL_ERROR "cmakelib_add_appimage: missing ${app_${resource}}")
        endif()
    endforeach()
    if(NOT app_ICON_NAME)
        set(app_ICON_NAME "${app_TARGET}")
    endif()
    if(NOT app_ICON_SIZE)
        set(app_ICON_SIZE "256x256")
    endif()
    if(NOT app_VERSION)
        set(app_VERSION "${PROJECT_VERSION}")
    endif()
    if(NOT app_PACKAGE_TARGET)
        set(app_PACKAGE_TARGET appimage)
    endif()
    if(TARGET "${app_PACKAGE_TARGET}")
        message(FATAL_ERROR "cmakelib_add_appimage: target ${app_PACKAGE_TARGET} already exists")
    endif()

    include(GNUInstallDirs)
    get_filename_component(icon_extension "${app_ICON_FILE}" LAST_EXT)
    install(TARGETS ${app_TARGET} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
    install(FILES "${app_DESKTOP_FILE}" DESTINATION ${CMAKE_INSTALL_DATADIR}/applications)
    install(FILES "${app_ICON_FILE}"
        DESTINATION "${CMAKE_INSTALL_DATADIR}/icons/hicolor/${app_ICON_SIZE}/apps"
        RENAME "${app_ICON_NAME}${icon_extension}"
    )
    add_custom_target(${app_PACKAGE_TARGET}
        COMMAND bash "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Functions/QtAppImage.sh"
            "${CMAKE_CURRENT_BINARY_DIR}" "$<CONFIG>" "$<TARGET_FILE:Qt6::qmake>" "${app_VERSION}"
        DEPENDS ${app_TARGET}
        USES_TERMINAL
        VERBATIM
    )
endfunction()
