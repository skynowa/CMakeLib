#--------------------------------------------------------------------------------------------------
# \file  FindMigSQL.cmake
# \brief Find MigSQL includes and library
#
# MIGSQL_FOUND     - true if system has library
# MIGSQL_INCLUDES  - include directories
# MIGSQL_LIBRARIES - libraries
# xHAVE_MIGSQL     - true if found (source used)
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
find_path(MIGSQL_INCLUDES
    NAMES
        "migsql.h"
    PATHS
        "/usr/local/include"
        "/usr/include"
    PATH_SUFFIXES
        "migsql")

find_library(MIGSQL_LIBRARIES
    NAMES
        "migsql"
    PATHS
        "/usr/local/lib"
        "/usr/lib"
    PATH_SUFFIXES
        "migsql")

if (NOT (MIGSQL_INCLUDES AND MIGSQL_LIBRARIES))
    set(MIGSQL_FOUND 0)
else()
    set(MIGSQL_FOUND 1)
    set(xHAVE_MIGSQL 1)
endif()
#--------------------------------------------------------------------------------------------------
# trace
message(STATUS "MIGSQL_FOUND: ${MIGSQL_FOUND}")
message("   MIGSQL_INCLUDES:  ${MIGSQL_INCLUDES}")
message("   MIGSQL_LIBRARIES: ${MIGSQL_LIBRARIES}")
message("   xHAVE_MIGSQL:     ${xHAVE_MIGSQL}")

if (NOT MIGSQL_FOUND AND MigSQL_FIND_REQUIRED)
    message(FATAL_ERROR "Not found")
endif()
#--------------------------------------------------------------------------------------------------
