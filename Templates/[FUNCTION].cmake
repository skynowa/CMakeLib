### DELETE begin ###
[FUNCTION_NAME] - function name
[Comments]      - comments
[PARAM_NAME]    = param
### DELETE end ###


#--------------------------------------------------------------------------------------------------
# \file  [FUNCTION_NAME].cmake
# \brief [Comments]
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
function([FUNCTION_NAME] [PARAM_NAME])
	set(VARNAME 0)



	set(${PARAM_NAME} "${VARNAME}" PARENT_SCOPE)
endfunction()
#--------------------------------------------------------------------------------------------------
