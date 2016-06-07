#--------------------------------------------------------------------------------------------------
# \file  FindMySQL.cmake
# \brief Find the native MySQL includes and library
#
# MYSQL_FOUND     - true if MySQL found
# xHAVE_MYSQL     - true if MySQL found (source used)
# MYSQL_INCLUDES  - where to find mysql.h, etc
# MYSQL_LIBRARIES - list of libraries when using MySQL
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
if (WIN32)
    find_path(MYSQL_INCLUDES
        NAMES
            "mysql.h"
        PATHS
            "$ENV{PROGRAMFILES}/MySQL/*/include"
            "$ENV{PROGRAMFILES(x86)}/MySQL/*/include"
            "$ENV{SYSTEMDRIVE}/MySQL/*/include"
        PATH_SUFFIXES
            "mysql")

    find_library(MYSQL_LIBRARIES
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
    find_path(MYSQL_INCLUDES
        NAMES
            "mysql.h"
        PATHS
            "/usr/include"
            "/usr/local/include"
            "/usr/mysql/include"
        PATH_SUFFIXES
            "mysql")

    find_library(MYSQL_LIBRARIES
        NAMES
            "mysqlclient"
            "mysqlclient_r"
        PATHS
            "/lib/mysql"
            "/lib64/mysql"
            "/usr/lib/mysql"
            "/usr/lib64/mysql"
            "/usr/local/lib/mysql"
            "/usr/local/lib64/mysql"
            "/usr/mysql/lib/mysql"
            "/usr/mysql/lib64/mysql"
        PATH_SUFFIXES
            "mysql")
endif()

if (NOT (MYSQL_INCLUDES AND MYSQL_LIBRARIES))
    set(MYSQL_FOUND 0)
    set(MYSQL_INCLUDES "")
    set(MYSQL_LIBRARIES "")
else()
    set(MYSQL_FOUND 1)
    set(xHAVE_MYSQL 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
if (NOT MYSQL_FOUND AND MYSQL_FIND_REQUIRED)
    message(FATAL_ERROR "MYSQL_FOUND: ${MYSQL_FOUND}")
else()
    # message(STATUS "MYSQL_FOUND: ${MYSQL_FOUND}")
    # message("     MYSQL_INCLUDES: ${MYSQL_INCLUDES}")
    # message("     MYSQL_LIBRARIES: ${MYSQL_LIBRARIES}")
endif()
#--------------------------------------------------------------------------------------------------
