# Repository Guidelines

## Project Structure & Module Organization

CMakeLib is a collection of reusable CMake modules. Root-level `Find*.cmake` files discover
packages or platform features. General helpers live in `Functions/`, static-analysis integrations
in `StaticAnalisis/`, starter files in `Templates/`, and CTest scripts in `Tests/`.
`CMakeLists.txt` registers tests and installation rules. Track planned work in `TODO.md` using its
immutable `CMLIB-NNN` identifiers.

## Build, Test, and Development Commands

Use an out-of-source build:

```bash
cmake -S . -B build -DBUILD_TESTING=ON
cmake --build build
ctest --test-dir build --output-on-failure
```

Run an individual test with `ctest --test-dir build -R FindGitRevision -V`. Before submitting,
run `git diff --check`. Installation currently targets CMake's module directory, so verify it
without modifying the host:

```bash
stage_dir="$(mktemp -d)"
DESTDIR="$stage_dir" cmake --install build
```

Do not run `install.sh` or `uninstall.sh` with elevated privileges during routine development.

## Coding Style & Naming Conventions

Require CMake 3.15-compatible syntax. Indent command bodies with four spaces, quote filesystem
paths, use lowercase built-in command names, and avoid shell-specific custom commands. Prefer
target-based CMake and built-in find modules. Keep established public variables such as
`cmGIT_REVISION_HASH`; prefix private temporaries with `_CMAKE_LIB_`. Name tests
`CMakeLib.<Module>.<case>`.

## Testing Guidelines

Add focused CMake script tests under `Tests/` for each behavioral change. Cover both successful
and unavailable/error cases, especially native versus cross-platform detection. Tests must create
temporary state in the build tree, remain independent of the source working directory, and avoid
changing global Git configuration. A change is complete only after clean configure, build, CTest,
and diff checks pass.

## Commit & Pull Request Guidelines

Use English commit messages in the form `Module: concise summary`; repository hooks may prepend
file and task statistics. Use branches such as `CMLIB-004-FindGitRevision-detached-head`. Pull
requests should describe behavior, identify the relevant `CMLIB-NNN` task, list verification
commands, and call out compatibility or platform effects. Screenshots are unnecessary for
CMake-only changes.

## Automation Notes

Before editing, read the global rule index at
`/home/skynowa/.codex/.agents/rules/README.md` and applicable rules. Preserve unrelated working-tree
changes, never renumber TODO IDs, and do not commit unless explicitly requested.
