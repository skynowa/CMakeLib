#--------------------------------------------------------------------------------------------------
# \file  FindMySQL.cmake
# \brief Find the native MySQL includes and library
#
# cmMYSQL_FOUND     - true if MySQL found
# cmMYSQL_INCLUDES  - where to find mysql.h, etc
# cmMYSQL_LIBRARIES - list of libraries when using MySQL
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
if (WIN32)
    find_path(cmMYSQL_INCLUDES
        NAMES
            "mysql.h"
        PATHS
            "$ENV{PROGRAMFILES}/MySQL/*/include"
            "$ENV{PROGRAMFILES(x86)}/MySQL/*/include"
            "$ENV{SYSTEMDRIVE}/MySQL/*/include"
        PATH_SUFFIXES
            "mysql")

    find_library(cmMYSQL_LIBRARIES
        NAMES
            "mysqlclient"
            "mysqlclient_r"
        PATHS
            "$ENV{PROGRAMFILES}/MySQL/*/lib"
            "$ENV{PROGRAMFILES(x86)}/MySQL/*/lib"
            "$ENV{SYSTEMDRIVE}/MySQL/*/lib"
        PATH_SUFFIXES
            "mysql")

else()
    find_path(cmMYSQL_INCLUDES
        NAMES
            "mysql.h"
        PATHS
            "/usr/include"
            "/usr/local/include"
            "/usr/mysql/include"
        PATH_SUFFIXES
            "mysql")

    find_library(cmMYSQL_LIBRARIES
        NAMES
            "mysqlclient"
            "mysqlclient_r"
        PATHS
            "/lib/mysql"
            "/lib64/mysql"
            "/usr/lib/mysql"
            "/usr/lib64/mysql"
            "/usr/lib/x86_64-linux-gnu"
            "/usr/local/lib/mysql"
            "/usr/local/lib64/mysql"
            "/usr/mysql/lib/mysql"
            "/usr/mysql/lib64/mysql"
        PATH_SUFFIXES
            "mysql")
endif()

if (NOT cmMYSQL_INCLUDES AND cmMYSQL_LIBRARIES)
    set(cmMYSQL_FOUND 0)
else()
    set(cmMYSQL_FOUND 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "cmMYSQL_FOUND: ${cmMYSQL_FOUND}")
message("   cmMYSQL_INCLUDES:  ${cmMYSQL_INCLUDES}")
message("   cmMYSQL_LIBRARIES: ${cmMYSQL_LIBRARIES}")

if (NOT cmMYSQL_FOUND AND cmMySQL_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
