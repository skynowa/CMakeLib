#--------------------------------------------------------------------------------------------------
# \file  Configure.cmake
# \brief configure xLib sources
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# includes
include(CheckFunctionExists)
include(CheckIncludeFile)
include(CheckIncludeFileCXX)
include(CheckIncludeFiles)
include(CheckLibraryExists)
include(CheckSymbolExists)
include(CheckTypeSize)
include(CheckCSourceCompiles)
include(CheckCXXSourceCompiles)
#--------------------------------------------------------------------------------------------------
# find packages
find_package(OS REQUIRED)
find_package(Qt5Validate REQUIRED)
find_package(Qt5 REQUIRED)

# find_package(LibXml2 REQUIRED)
# find_package(LibXslt REQUIRED)
# find_package(Exslt REQUIRED)
# find_package(CURL REQUIRED)
# find_package(MigSQL REQUIRED)
# find_package(Cgicc REQUIRED)
# find_package(FastCGI REQUIRED)
# find_package(FtpLib REQUIRED)
# find_package(OpenSSL REQUIRED)
# find_package(MemCached REQUIRED)
# find_package(SphinxClient REQUIRED)
# find_package(SphinxClientPP REQUIRED)
# find_package(Hiredis REQUIRED)
# find_package(Iconv REQUIRED)
# find_package(ExecInfo REQUIRED)
# find_package(ClangTidy REQUIRED)
#--------------------------------------------------------------------------------------------------
