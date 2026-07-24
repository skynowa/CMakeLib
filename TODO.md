# TODO

Task IDs use the immutable `CMLIB-NNN` format, are never reused, and are unique within this
repository.

Next ID: CMLIB-013

## Package discovery and compatibility

- [ ] CMLIB-001 Make every `Find*.cmake` module report `FOUND` only when all required artifacts
  exist and honor the package's standard `REQUIRED` and `QUIET` arguments.
- [ ] CMLIB-002 Provide namespaced imported targets from library find modules while retaining
  their existing result variables as a compatibility layer.
- [ ] CMLIB-003 Find `addr2line`, `atos`, and static-analysis executables as programs from `PATH`
  and validate each tool's actual required files independently.
- [ ] CMLIB-004 Make Git revision discovery return an accurate non-fatal result outside a Git
  worktree and support detached HEAD, missing Git, and source archives.

## Consumer configuration

- [ ] CMLIB-005 Replace processor-name heuristics in OS detection with CMake platform variables
  that distinguish Windows, Linux, Android, Apple, and BSD during native and cross builds.
- [ ] CMLIB-006 Expose warning settings through an opt-in target or function, keep
  warnings-as-errors configurable, and never disable all GNU warnings.
- [ ] CMLIB-007 Let consumers request only the Qt 6 components they use and link the corresponding
  `Qt6::*` targets without directory-wide includes, definitions, or libraries.
- [ ] CMLIB-008 Add reusable feature-check helpers that isolate `CMAKE_REQUIRED_*` state and can
  run compile, symbol, and function checks with the dependency targets needed by consumers such
  as xLib.
- [ ] CMLIB-009 Add a helper for generating configuration headers in the build tree and publishing
  them through target include directories without modifying a consumer's source tree.

## Installation and tooling

- [ ] CMLIB-010 Provide a relocatable CMake package installed below the selected
  `CMAKE_INSTALL_PREFIX` instead of modifying CMake's own `${CMAKE_ROOT}/Modules` directory.
- [ ] CMLIB-011 Make static-analysis targets accept project-specific config and output paths, use
  portable CMake commands, and propagate analyzer failures to the build.
- [ ] CMLIB-012 Add CTest fixture projects that verify module success and failure cases, consumer
  target linkage, cross-platform configuration, and use from both build and install trees.

[ ] https://github.com/lefticus/cpp_starter_project/tree/master/cmake
