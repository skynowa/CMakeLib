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
