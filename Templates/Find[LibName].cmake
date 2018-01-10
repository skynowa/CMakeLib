### DELETE begin ###
[PackageName]       - package name
[LIB_NAME]          - lib name
[lib_names]         - lib names
[RealLibName]       - real lib name
[LIB_H]             - lib header file
[LIB_PATH_SUFFIXES] - lib path suffix
[Comments]           - comments
### DELETE end ###


#--------------------------------------------------------------------------------------------------
# \file  Find[PackageName].cmake
# \brief Find [RealLibName] includes and library
#
# [LIB_NAME]_FOUND     - true if system has library
# xHAVE_[LIB_NAME]     - true if found (source used)
# [LIB_NAME]_INCLUDES  - include directories
# [LIB_NAME]_LIBRARIES - libraries
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path([LIB_NAME]_INCLUDES
    NAMES
        "[LIB_H]"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "[LIB_PATH_SUFFIXES]"
    DOC
        "[Comments]")

find_library([LIB_NAME]_LIBRARIES
    NAMES
        [lib_names]
    PATHS
        "/lib"
        "/lib64"
        "/usr/lib"
        "/usr/lib64"
        "/usr/local/lib"
        "/usr/local/lib64"
    PATH_SUFFIXES
        "[LIB_PATH_SUFFIXES]")

if (NOT ([LIB_NAME]_INCLUDES AND [LIB_NAME]_LIBRARIES))
    set([LIB_NAME]_FOUND 0)
    set([LIB_NAME]_INCLUDES "")
    set([LIB_NAME]_LIBRARIES "")
else()
    set([LIB_NAME]_FOUND 1)
    set(xHAVE_[LIB_NAME] 1) # config.h.in add: #cmakedefine xHAVE_[LIB_NAME] 1
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT [LIB_NAME]_FOUND AND [PackageName]_FIND_REQUIRED)
    message("     [LIB_NAME]_INCLUDES: ${[LIB_NAME]_INCLUDES}")
    message("     [LIB_NAME]_LIBRARIES: ${[LIB_NAME]_LIBRARIES}")

    message(FATAL_ERROR "[LIB_NAME]_FOUND: ${[LIB_NAME]_FOUND}")
else()
    message(STATUS "[LIB_NAME]_FOUND: ${[LIB_NAME]_FOUND}")
endif()
#--------------------------------------------------------------------------------------------------
