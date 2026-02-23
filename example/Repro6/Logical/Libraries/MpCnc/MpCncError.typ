
TYPE
	MpCncErrorEnum : 
		( (* Error numbers of library MpCnc *)
		mcCNC_NO_ERROR := 0, (* No error *)
		mcCNC_ERR_AXES_GROUP := -1067212544, (* Error in the axes group. (ErrorSource: {2:PLCopenFBName}, ErrorCause: {1:ErrorNumber}) [Error: 41216, 0xc063a100] *)
		mcCNC_WRN_OVR_OUT_OF_RANGE := -2140954367, (* Override value {2:Value} out of expected range -200..200% [Warning: 41217, 0x8063a101] *)
		mcCNC_INF_NOT_ENOUGH_AXES := 1080271106, (* Not enough axes components found, wait until all linked axes components output Active = TRUE [Informational: 41218, 0x4063a102] *)
		mcCNC_WRN_CMD_NOT_ALLOWED := -2140954365, (* {2:Command} not allowed when robot is {3:Condition} [Warning: 41219, 0x8063a103] *)
		mcCNC_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
		mcCNC_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
		mcCNC_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
		mcCNC_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
		mcCNC_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
		mcCNC_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
		mcCNC_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xc0910007] *)
		mcCNC_ERR_POWERED_OFF := -1067212540 (* Axes group was powered off [Error: 41220, 0xc063a104] *)
		);
END_TYPE
