#!/usr/bin/env bash
set -Eeuo pipefail

main() {
    if (( $# != 4 )); then
        printf 'Usage: %s BUILD_DIR CONFIG QMAKE VERSION\n' "$0" >&2
        return 2
    fi
    local build_dir config qmake version linuxdeploy staging output qt_libs
    build_dir="$(realpath -- "$1")"
    config="$2"
    qmake="$3"
    version="$4"
    linuxdeploy="${LINUXDEPLOY:-linuxdeploy}"
    if ! linuxdeploy="$(command -v -- "${linuxdeploy}")"; then
        printf 'AppImage packaging requires linuxdeploy and its Qt plugin; set LINUXDEPLOY to its executable.\n' >&2
        return 1
    fi
    linuxdeploy="$(realpath -- "${linuxdeploy}")"
    if [[ ! -x "${qmake}" ]]; then
        printf 'Qt qmake is not executable: %s\n' "${qmake}" >&2
        return 1
    fi
    qt_libs="$("${qmake}" -query QT_INSTALL_LIBS)"
    output="${build_dir}/appimage"
    mkdir -p -- "${output}"
    staging="$(mktemp -d "${output}/staging.XXXXXXXX")"
    # Only this freshly allocated directory is removed, including on deployment failure.
    # Capture the local path now, before main returns; %q preserves shell metacharacters.
    # shellcheck disable=SC2064
    trap "rm -rf -- $(printf '%q' "${staging}")" EXIT
    DESTDIR="${staging}/AppDir" cmake --install "${build_dir}" --prefix /usr --config "${config}"
    cd -- "${staging}"
    LD_LIBRARY_PATH="${qt_libs}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" \
        QMAKE="${qmake}" VERSION="${version}" APPIMAGE_EXTRACT_AND_RUN=1 \
        "${linuxdeploy}" --appdir "${staging}/AppDir" --plugin qt --output appimage
    local packages=("${staging}"/*.AppImage)
    if [[ ! -f "${packages[0]}" ]]; then
        printf 'linuxdeploy did not produce an AppImage.\n' >&2
        return 1
    fi
    mv -- "${packages[@]}" "${output}/"
    printf 'AppImage package saved in %s\n' "${output}"
}

main "$@"
