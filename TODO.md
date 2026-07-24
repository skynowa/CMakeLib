# TODO

Task IDs use the immutable `CMLIB-NNN` format, are never reused, and are unique within this
repository.

Next ID: CMLIB-013

## Package discovery and compatibility

- [ ] CMLIB-001 Make every `Find*.cmake` module report `FOUND` only when all required artifacts
  exist and honor the package's standard `REQUIRED` and `QUIET` arguments.
  - Modules: `FindCMakeLib.cmake`, `FindExecInfo.cmake`, `FindMySQL.cmake`,
    `FindEvent2.cmake`, `FindSsh2.cmake`, `FindxLib.cmake`, `FindPcre++.cmake`,
    `FindAddr2Line.cmake`, `FindAtos.cmake`, `StaticAnalisis/FindClangTidy.cmake`,
    `StaticAnalisis/FindCppCheck.cmake`, and `StaticAnalisis/FindPvsStudio.cmake`.
- [ ] CMLIB-002 Provide namespaced imported targets from library find modules while retaining
  their existing result variables as a compatibility layer.
  - Modules: `FindExecInfo.cmake`, `FindMySQL.cmake`, `FindEvent2.cmake`,
    `FindSsh2.cmake`, `FindxLib.cmake`, and `FindPcre++.cmake`.
- [ ] CMLIB-003 Find `addr2line`, `atos`, and static-analysis executables as programs from `PATH`
  and validate each tool's actual required files independently.
  - Modules: `FindAddr2Line.cmake`, `FindAtos.cmake`,
    `StaticAnalisis/FindClangTidy.cmake`, `StaticAnalisis/FindCppCheck.cmake`, and
    `StaticAnalisis/FindPvsStudio.cmake`.
- [ ] CMLIB-004 Make Git revision discovery return an accurate non-fatal result outside a Git
  worktree and support detached HEAD, missing Git, and source archives.
  - Module: `FindGitRevision.cmake`.

## Consumer configuration

- [ ] CMLIB-005 Replace processor-name heuristics in OS detection with CMake platform variables
  that distinguish Windows, Linux, Android, Apple, and BSD during native and cross builds.
  - Module: `FindOS.cmake`.
- [ ] CMLIB-006 Expose warning settings through an opt-in target or function, keep
  warnings-as-errors configurable, and never disable all GNU warnings.
  - Modules: `WarningFlagsAll.cmake` and `WarningFlags_gcc_4.6.4.cmake`.
- [ ] CMLIB-007 Let consumers request only the Qt 6 components they use and link the corresponding
  `Qt6::*` targets without directory-wide includes, definitions, or libraries.
  - Module: `FindQt6.cmake`.
- [ ] CMLIB-008 Add reusable feature-check helpers that isolate `CMAKE_REQUIRED_*` state and can
  run compile, symbol, and function checks with the dependency targets needed by consumers such
  as xLib.
  - New module: `Functions/FeatureChecks.cmake`.
  - Consumer integration: `/home/skynowa/Projects/xLib/CMake/Configure.cmake`.
- [ ] CMLIB-009 Add a helper for generating configuration headers in the build tree and publishing
  them through target include directories without modifying a consumer's source tree.
  - New module: `Functions/ConfigureHeader.cmake`.
  - Consumer integration: `/home/skynowa/Projects/xLib/CMake/Configure.cmake`.

## Installation and tooling

- [ ] CMLIB-010 Provide a relocatable CMake package installed below the selected
  `CMAKE_INSTALL_PREFIX` instead of modifying CMake's own `${CMAKE_ROOT}/Modules` directory.
  - Modules: `FindCMakeLib.cmake` and `Uninstall.cmake`; installation rules:
    `CMakeLists.txt`.
- [ ] CMLIB-011 Make static-analysis targets accept project-specific config and output paths, use
  portable CMake commands, and propagate analyzer failures to the build.
  - Modules: `StaticAnalisis/ClangTidy.cmake`, `StaticAnalisis/CppCheck.cmake`,
    `StaticAnalisis/PvsStudio.cmake`, `StaticAnalisis/FindClangTidy.cmake`,
    `StaticAnalisis/FindCppCheck.cmake`, and `StaticAnalisis/FindPvsStudio.cmake`.
- [ ] CMLIB-012 Add CTest fixture projects that verify module success and failure cases, consumer
  target linkage, cross-platform configuration, and use from both build and install trees.
  - Modules under test: all modules listed by `CMLIB-001` through `CMLIB-011`;
    test registration: `CMakeLists.txt`.

[ ] https://github.com/lefticus/cpp_starter_project/tree/master/cmake
