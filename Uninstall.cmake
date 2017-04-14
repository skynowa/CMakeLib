#--------------------------------------------------------------------------------------------------
# \file  Uninstall.cmake
# \brief Uninstall WTS
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
set(MANIFEST "${CMAKE_CURRENT_BINARY_DIR}/install_manifest.txt")

if (NOT EXISTS "${MANIFEST}")
	message(WARNING "Can't find install manifest: ${MANIFEST}")
else()
	file(READ "${MANIFEST}" files)
	string(REGEX REPLACE "\n" ";" files "${files}")

	foreach(file ${files})
		message(STATUS "Uninstalling $ENV{DESTDIR}${file}")

		if (IS_SYMLINK "$ENV{DESTDIR}${file}" OR EXISTS "$ENV{DESTDIR}${file}")
			exec_program(
				"${CMAKE_COMMAND}" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
				OUTPUT_VARIABLE rm_out
				RETURN_VALUE rm_retval)

			if (NOT "${rm_retval}" STREQUAL 0)
				message(FATAL_ERROR "Problem when removing $ENV{DESTDIR}${file}")
			endif()
		else()
			message(STATUS "File $ENV{DESTDIR}${file} does not exist.")
		endif()
	endforeach()
endif()
#--------------------------------------------------------------------------------------------------
message(STATUS "Uninstalling ${WTS_INSTALL_PATH}")

if (NOT EXISTS "${WTS_INSTALL_PATH}")
    message(STATUS "Directory ${WTS_INSTALL_PATH} does not exist.")
else()
    exec_program("${CMAKE_COMMAND}"
        ARGS "-E remove_directory \"${WTS_INSTALL_PATH}\""
        OUTPUT_VARIABLE rm_out RETURN_VALUE rm_retval)
    if (NOT "${rm_retval}" STREQUAL 0)
        message(FATAL_ERROR "Problem when removing ${WTS_INSTALL_PATH}")
    endif()
endif()
#--------------------------------------------------------------------------------------------------
