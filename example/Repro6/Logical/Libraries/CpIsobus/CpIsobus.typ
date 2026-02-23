
TYPE
	CpIsobusLogLevelEnum : 
		( (*Defines logging level.*)
		cpISOBUS_LOG_LEVEL_INFO, (*Log all messages except debug ones.*)
		cpISOBUS_LOG_LEVEL_SUCCESS, (*Log errors, warnings, and success messages.*)
		cpISOBUS_LOG_LEVEL_WARNING, (*Log errors and warnings.*)
		cpISOBUS_LOG_LEVEL_ERROR, (*Log error only.*)
		cpISOBUS_LOG_LEVEL_DEBUG (*Log all messages including debug ones.*)
		);
	CpIsobusErrorEnum : 
		( (*Status numbers*)
		cpISOBUS_NO_ERROR := 0, (*No error*)
		cpISOBUS_ERR_ASSERT := -1070582396, (*TEST_ASSERT failed*)
		cpISOBUS_WRN_TERMINATED := -2144324220, (*ISOBUS terminated*)
		cpISOBUS_WRN_SAFETY_NOTIFICATION := -2144324219, (*Safety notification*)
		cpISOBUS_SUC_STARTED := 3159428, (*ISOBUS started*)
		cpISOBUS_INF_GENERIC := 1076901252, (*Generic information*)
		cpISOBUS_INF_DEBUG := 1076901253 (*DEBUG_INFO message*)
		);
	CpIsobusStateEnum : 
		( (*Defines the state of the stack.*)
		cpISOBUS_STATE_CLOSED, (*The stack has been closed or is still in the initial state.*)
		cpISOBUS_STATE_INITIALIZING, (*The stack is initializing.*)
		cpISOBUS_STATE_RUNNING, (*The stack is running. The CpIsobusRun() function must be triggered in each cycle.*)
		cpISOBUS_STATE_CLOSING (*The stack is being terminated.*)
		);
END_TYPE
