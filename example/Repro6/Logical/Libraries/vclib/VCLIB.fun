
FUNCTION VCEV_Count : UINT (*returns the number of events*)
	VAR_INPUT
		puiCount : UDINT; (*pointer to UDINT containing the available events*)
	END_VAR
END_FUNCTION

FUNCTION VCEV_Pop : UINT (*reads the oldest event from the buffer*)
	VAR_INPUT
		phEvent : UDINT; (*pointer to UDINT containing the event handle*)
	END_VAR
END_FUNCTION

FUNCTION VCEV_Free : UINT (*frees the memory of the event*)
	VAR_INPUT
		hEvent : UDINT; (*event handle*)
	END_VAR
END_FUNCTION

FUNCTION VCEV_DblGet : UINT (*returns data from the event in double format*)
	VAR_INPUT
		hEvent : UDINT; (*event handle*)
		pszParamName : UDINT; (*pointer to STRING containing the parameter name*)
		pdValue : UDINT; (*pointer to DINT containing the value*)
	END_VAR
END_FUNCTION

FUNCTION VCEV_FltGet : UINT (*returns data from the event in float format*)
	VAR_INPUT
		hEvent : UDINT;  (*event handle*)
		pszParamName : UDINT; (*pointer to STRING containing the parameter name*)
		pfValue :UDINT; (*pointer to REAL containing the value*)
	END_VAR
END_FUNCTION

FUNCTION VCEV_I32Get : UINT (*returns data from the event in 32bit integer format*)
	VAR_INPUT
		hEvent : UDINT; (*event handle*)
		pszParamName : UDINT; (*pointer to STRING containing the parameter name*)
		piValue : UDINT;
	END_VAR
END_FUNCTION

FUNCTION VCEV_Utf16Get : UINT (*returns a STRING from the event in UTF16 format*)
	VAR_INPUT
		hEvent : UDINT; (*event handle*)
		pszParamName : UDINT; (*pointer to STRING containing the parameter name*)
		pTextUtf16 : UDINT; (*pointer to UDINT array containing the value datapoint*)
		puiSize : UDINT; (*pointer to UDINT containing the maximum value that can be written to the STRING parameter*)
	END_VAR
END_FUNCTION

FUNCTION VCEV_Utf8Get : UINT (*returns a STRING from the event in UTF8 format*)
	VAR_INPUT
		hEvent : UDINT; (*event handle*)
		pszParamName : UDINT; (*pointer to STRING containing the parameter name*)
		pTextUtf8 : UDINT; (*pointer to STRING containing the value datapoint*)
		puiSize : UDINT; (*pointer to UDINT containing the maximum value that can be written to the STRING parameter*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_DPID2Index : UINT (*returns a index for the datapoint id*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiDPID : UDINT; (*datapoint id*)
		puiIndex : UDINT;(*index value in the datapoint table*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_GetDecimalPlaces : UINT (*returns the number of decimal places specified by the unit*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the datapoint table*)
		puiDecimalPlaces : UDINT; (*number of decimal places in the current unit*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_GetUGID : UINT (*returns the index of the unitgroup*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the datapoint table*)
		puiUGID : UDINT; (*pointer to UDINT containing the index of the unit group being used*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_GetUnits : UINT (*returns the index of the selected PLC and display unit*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the datapoint table*)
		puiPLCUnit : UDINT; (*pointer to UDINT containing the plc unit being used*)
		puiDisplayUnit : UDINT; (*pointer to UDINT containing the display unit being used*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_GetUTextId : UINT (*returns the text id of the unitgroup and the short and long text of the active unit*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the datapoint table*)
		uiUnitDisplayIndex : UDINT; (*plc index of the active unit*)
		puiTextGroupId : UDINT; (*pointer to UDINT containing the text group id for the unit group*)
		puiTextIndexShort : UDINT; (*pointer to UDINT containing the unit's short text*)
		puiTextIndexLong : UDINT; (*pointer to UDINT containing the unit's long text*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_Initialize : UINT (*initialize the datapoint functions*)
	VAR_INPUT
		phDP : UDINT; (*pointer to UDINT containing the datasource handle*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_UserID2Index : UINT (*returns the index out of the UserID*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiUserID : UDINT; (*datapoints UserID*)
		puiIndex : UDINT; (*pointer to UDINT containing the value in the datapoint table*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_GetActivePVIndex : UINT (*returns error if the array is to small for the PV table*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		puiIndex : UDINT; (*pointer to UDINT-array containing the PV table*)
		uiIndexSize : UINT; (*size of the puiIndex array in Byte*)
		ulFlags : UDINT; (*Flags for future*)
		puiCount : UDINT; (*pointer to UDINT containing the number of PV's written to the list*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_GetPVInfo : UINT (*returns error if the index out of PV table*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the PV table*)
		pInfo : UDINT; (*pointer to VCDPInfo struct*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_GetPVName : UINT (*returns error if the index out of PV table*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the PV table*)
		pTextUtf8 : UDINT; (*pointer to STRING containing the name*)
		uiSize : UDINT; (*UDINT containing the maximum value that can be written to the STRING parameter*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_Utf16Get : UINT (*returns the value of a datapoint in unicode format*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the datapoint table*)
		pTextUtf16 : UDINT; (*pointer to UINT array containing the value*)
		puiSize : UDINT; (*pointer to UDINT containing the maximum value that can be written to the STRING parameter*)
		Info : VCDPInfo; (*additional info for the function block*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_Utf16Set : UINT (*writes the value onto a datapoint in unicode format*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the datapoint table*)
		pTextUtf16 : UDINT; (*pointer to UINT array containg the value*)
		Info : VCDPInfo; (*additional info for the function block*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_Utf8Get : UINT (*returns the value of a datapoint in STRING format*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the datapoint table*)
		pTextUtf8 : UDINT; (*pointer to STRING containing the value*)
		puiSize : UDINT; (*pointer to UDINT containing the maximum value that can be written to the STRING parameter*)
		Info : VCDPInfo; (*additional info for the function block*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_Utf8Set : UINT (*writes the value onto a datapoint in STRING format*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the datapoint table*)
		pTextUtf8 : UDINT; (*pointer to string containing the value*)
		Info : VCDPInfo; (*additional info for the function block*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_GetLimits : UINT (*returns the limits of a datapoint*)
	VAR_INPUT
		hDP : UDINT; (*datasource handle*)
		uiIndex : UDINT; (*index value in the datapoint table*)
		pLimitMin : UDINT; (*pointer to LREAL receiving the limit minimum value*)
		pLimitMax : UDINT; (*pointer to LREAL receiving the limit minimum value*)
		pLimitMinText : UDINT; (*pointer to string containing the limit minimum value*)
		pLimitMinTextLen : UDINT; (*pointer to UDINT containing length of the limit minimum text*)
		pLimitMaxText : UDINT; (*pointer to string containing the limit maximum value*)
		pLimitMaxTextLen : UDINT; (*pointer to UDINT containing length of the limit maximum text*)
	END_VAR
END_FUNCTION

FUNCTION VCDP_GetUserIDbyName : UINT (*returns the user ID of a process variable using its name*)
	VAR_INPUT
		hVCDP : UDINT; (*datasource handle*)
		pszPVName : UDINT; (*pointer to STRING containing the name of process variable*)
		puiUserID : UDINT; (*pointer to UINT containing the userID*)
	END_VAR
END_FUNCTION

FUNCTION VCLIB_RegisterEVClient : UINT (*intern*)
END_FUNCTION

FUNCTION VCLIB_RegisterDPClient : UINT (*intern*)
END_FUNCTION
