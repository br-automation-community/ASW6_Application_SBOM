
{REDUND_CONTEXT} FUNCTION redAvailable			: BOOL (*Verify that the project is configured as redundant and a redundancy interface is present.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION redGetRIFModeSwitch		: BYTE (*Determine whether the CPU is the primary CPU or the secondary CPU.*)
	VAR_INPUT
		cpu		:BYTE;						(*redCPU_THIS for the local CPU, redCPU_PARTNER for the partner CPU*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} FUNCTION redGetCPUProcessCtrlState			: BYTE (*Determine whether the CPU is the active CPU or the standby CPU.*)
	VAR_INPUT
		cpu		:BYTE;						(*redCPU_THIS for the local CPU, redCPU_PARTNER for the partner CPU*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} FUNCTION redGetSwitchoverLevel	: BYTE (*Determine the effects of a switchover, based on the differences between the CPUs.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION redGetRRADMapping		: BYTE (*Determine whether the RRAD mapping is configured the same on both CPUs.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION redGetRRADState		: BYTE (*Determine the current state of the RRAD replication.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION redIsRIFLinkActive		: BOOL (*Determine the rLink state.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION redSwitchover			: BOOL (*Start a switchover - the standby CPU will become the active CPU.*)
	VAR_INPUT
		force		:BOOL;					(*Force a switchover.*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} FUNCTION redPrjUpdate		: BOOL (*Start an update of the standby CPU - the project will be transferred from the active CPU.*)
END_FUNCTION
