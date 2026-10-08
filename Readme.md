# CMakeLib - CMake library

![GitHub Watchers](https://img.shields.io/github/watchers/skynowa/CMakeLib)

## Install

Use CMakeLists.txt or `install.sh`

## Uninstall

`uninstall.sh`

## Use in projects

```cmake
# package
find_package(CMakeLib  REQUIRED) # at 1-st

# functions, targets
include(Functions/JobsNum)
include(StaticAnalisis/ClangTidy)
include(StaticAnalisis/CppCheck)
include(StaticAnalisis/PvsStudio)
```

## Detect compliers

```cmake
if     (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")

elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")

elseif (CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")

elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    if (ENV_WIN)

    else()

    endif()
else()
    message("CMakeLib: ${CMAKE_CXX_COMPILER_ID} - unknown compiler")
endif()
```

## Qt AppImage packaging (Linux)

Requires CMake 3.17+, Qt 6, Bash, linuxdeploy and linuxdeploy-plugin-qt.
Include `QtAppImage.cmake` after defining the executable and finding Qt:

```cmake
include(QtAppImage)
cmakelib_add_appimage(
    TARGET MyApp
    DESKTOP_FILE resources/MyApp.desktop
    ICON_FILE resources/MyApp.png
    ICON_SIZE 256x256
    VERSION "${PROJECT_VERSION}"
)
```

The desktop entry must reference the installed executable and icon name.
`ICON_NAME` defaults to the executable target name; the icon extension is preserved.
`ICON_SIZE` defaults to `256x256`; `VERSION` defaults to `PROJECT_VERSION`.
`PACKAGE_TARGET` defaults to `appimage` and can be changed for multiple applications.
The function adds Linux install rules and the packaging target; other platforms are skipped.
The companion `Functions/QtAppImage.sh` must remain next to the module directory.

```bash
LINUXDEPLOY=/path/to/linuxdeploy-x86_64.AppImage cmake --build build --target appimage
```

Place the executable Qt plugin next to linuxdeploy. No tools are downloaded automatically.
Packages are saved under the caller's build directory in `appimage/`.
The helper stages the install tree, uses the configured Qt SDK's qmake and libraries,
runs packaging tools without FUSE, and removes temporary staging files on failure or success.
Build on the oldest supported Linux distribution and package each architecture separately.
