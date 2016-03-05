#--------------------------------------------------------------------------------------------------
# \file  FindMySQL.cmake
# \brief Find the native MySQL includes and library
#
# MYSQL_FOUND     - true if MySQL found
# MYSQL_INCLUDES  - where to find mysql.h, etc
# MYSQL_LIBRARIES - list of libraries when using MySQL
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(MYSQL_INCLUDES
    NAMES "mysql.h"
    PATH_SUFFIXES "mysql")

find_library(MYSQL_LIBRARIES
    NAMES
        mysqlclient mysqlclient_r
    PATHS
        "/lib"   "/usr/lib"   "/usr/local/lib"
        "/lib64" "/usr/lib64" "/usr/local/lib64"
    PATH_SUFFIXES
        "mysql")

if (NOT (MYSQL_INCLUDES AND MYSQL_LIBRARIES))
    set(MYSQL_FOUND 0)
    set(MYSQL_INCLUDES "")
    set(MYSQL_LIBRARIES "")
else()
    set(MYSQL_FOUND 1)
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
