# CMakeLib - CMake library

![GitHub Watchers](https://img.shields.io/github/watchers/skynowa/xLib)

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
