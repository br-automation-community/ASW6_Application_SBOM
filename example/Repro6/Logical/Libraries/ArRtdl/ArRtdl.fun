
{REDUND_ERROR} FUNCTION ArAddPvToRtdl : ArRtdlPvIdentType (*Add the PV to the Real Time Data Layer. Syntax: [<appmodul_name>::][<task_name>:]<variable_name>. Must be called in Init-UP.*)
	VAR_INPUT
		PvName	: STRING[512]; (*PV name.*)
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION ArReadFromRtdl : BOOL (*Read the content of a PV from the Real Time Data Layer.*)
	VAR_INPUT
		PvID	: ArRtdlPvIdentType; (*PV ID.*)
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION ArWriteToRtdl : BOOL (*Write the content of a PV to the Real Time Data Layer.*)
	VAR_INPUT
		PvID	: ArRtdlPvIdentType; (*PV ID.*)
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION ArRemoveFromRtdl : BOOL (*Remove a PV from the Real Time Data Layer. Must be called in Exit-UP.*)
	VAR_INPUT
		PvID	: ArRtdlPvIdentType; (*PV ID.*)
	END_VAR
END_FUNCTION
