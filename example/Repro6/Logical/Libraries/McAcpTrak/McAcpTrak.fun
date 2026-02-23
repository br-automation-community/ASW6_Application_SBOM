FUNCTION LLMInit : UINT
	VAR_INPUT
		sysInitPhase : DINT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK MC_BR_AsmCamPrepare_AcpTrak (*Prepares a cam to be used by other function blocks (especially coupling function blocks) for the specified assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		CouplingObjectName: STRING[32]; (*Name of the associated coupling object (for additional information see Function description).*)
		CamID : UINT; (*ID of the cam for further use.*)
		Cam : McCamDefineType; (*Information about the cam.*)
		Execute : BOOL;  (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmCommandError_AcpTrak (*Specifically generates an error on the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Command : McErrorCmdEnum; (*Defines the command that should be triggered by the drive.*)
		AdvancedParameters : McAcpTrakAdvAsmCmdErrParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_AsmCopySegmentData_AcpTrak (*Copies a snapshot of the last stored information about a specific or all segments of the assembly to a provided structure.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL;  (*Execution of the function block is started on a rising edge of the input.*)
		Abort : BOOL; (*Abort execution of the function block*)
		Command : McAcpTrakCopySegDataModeEnum; (*Define which segments' data should be copied. *)
		AdvancedParameters : McAcpTrakAdvCopySegDataType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Info :  McAcpTrakCopySegDataInfoType; (*Information about segment data*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_AsmCopyShuttleData_AcpTrak (*Copies data of a specific or all (possibly deleted) shuttles on the assembly to a provided structure.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL;  (*Execution of the function block is started on a rising edge of the input.*)
		Abort : BOOL; (*The function block is aborted by the user.*)
		Command : McAcpTrakCopyShDataModeEnum; (*Determines for which shuttles the data should be copied.*)
		AdvancedParameters : McAcpTrakAdvCopyShDataType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Info :  McAcpTrakCopyShDataInfoType;  (*Information about the shuttle data.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmDeleteShuttle_AcpTrak (*Deletes a specified selection of shuttles and removes them from the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL;  (*Execution of the function block is started on a rising edge of the input.*)
		Command : McAcpTrakAsmDeleteShCmdEnum; (*Selects the command.*)
		Axis : REFERENCE TO McAxisType; (*Axis reference of the shuttle to be deleted.*)
		AdvancedParameters : McAcpTrakAdvAsmDeleteShParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		DeletedCount : UINT; (*Number of deleted shuttles.*)
	END_VAR
	VAR
		Internal : McInternalTwoRefType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmDisable_AcpTrak (*Performs a state transition to AssemblyDisabled.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL;  (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmEnable_AcpTrak (*Performs a state transition from AssemblyDisabled to AssemblyReady.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL;  (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmGetDualTrack_AcpTrak (*Returns all dual-track areas of the specified assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Enable : BOOL; (*A list of dual track areas is stored after the function block is enabled. This list is retained until "Enable" is reset or all information is output via input "Next".*)
		Next : BOOL; (*Show information about the next dual track.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		TotalCount : UINT; (*Total amount of sectors to loop through.*)
		RemainingCount : UINT; (*Remaining sectors to loop through.*)
		DualTrackInfo : McAcpTrakDualTrackInfoType;
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_AsmGetInfo_AcpTrak (*Outputs information about the specified assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		AssemblyInfo : McAcpTrakAsmGetInfoType;  (*Information of the assembly.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_AsmGetMinShDist_AcpTrak (*Outputs the minimum distance two shuttles can have on the specified assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL;  (*Execution of the function block is started on a rising edge of the input.*)
		Mode :   McAcpTrakShRelativeAlignmentEnum; (*Orientation of the two shuttles to each other.*)
		AdvancedParameters :  McAcpTrakAdvGetMinShDistParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Distance : McAcpTrakAsmGetMinShDistType; (*Calculates the minimum distance between two shuttles.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmGetSector_AcpTrak (*Returns the references of all sectors of the assembly, corresponding to the chosen selection mode.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Enable : BOOL;  (*A list of sectors is stored after the function block has been enabled. This list is retained until "Enable" is reset or all sector information has been output via input "Next".*)
		Next : BOOL; (*Show information about the next sector.*)
		AdvancedParameters : McAcpTrakAdvAsmGetSecParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		TotalCount : UINT; (*Number of all segments that meet the selection criteria.*)
		RemainingCount : UINT; (*Number of segment references not yet output.*)
		Sector : McSectorType; (*The determined sector reference.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmGetSegment_AcpTrak (*Returns the references of all segments of the assembly or a segment group, corresponding to the chosen selection mode.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Enable : BOOL;  (*A list of segments is stored after the function block has been enabled. This list is retained until "Enable" is reset or all segment information is output via input "Next".*)
		Next : BOOL; (*Show information about the next segment.*)
		AdvancedParameters : McAcpTrakAdvAsmGetSegParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		TotalCount : UINT; (*Number of all segments meeting the selection criteria.*)
		RemainingCount : UINT; (*Number of segments whose references have not yet been output.*)
		Segment : McSegmentType; (*The determined segment reference.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmGetShuttle_AcpTrak (*Returns the axis references of all shuttles on the assembly or a segment group, corresponding to the chosen selection mode.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Enable : BOOL;  (*A list of shuttles is stored after the function block is enabled. This list is retained until "Enable" is reset or all shuttle information is output via input "Next".*)
		Next : BOOL; (*Show information about the next shuttle.*)
		AdvancedParameters : McAcpTrakAdvAsmGetShParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		TotalCount : UINT; (*Total number of shuttles detected in the assembly when the function block is enabled.*)
		RemainingCount : UINT; (*Number of shuttles for which information has not yet been read.*)
		Axis : McAxisType; (*The determined axis reference.*)
		AdditionalInfo :  McAcpTrakAsmGetShAddInfoType; (*Additional information.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmPowerOff_AcpTrak (*Switches off the controllers for all segments of the specified assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		AdvancedParameters : McAcpTrakAdvAsmPowerOffParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmPowerOn_AcpTrak (*Switches on the controllers for all segments of the specified assembly and identifies all shuttles.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		AdvancedParameters : McAcpTrakAdvAsmPowerOnParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_AsmReadErrorInfo_AcpTrak (*Returns information about an error response of the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Enable : BOOL;  (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		ErrorInfo :  McAcpTrakAsmErrorInfoType;  (*Information about the error response of the assembly.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_AsmReadInfo_AcpTrak (*Reads current information about the specified assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
		AdvancedParameters : McAcpTrakAdvAsmReadInfoParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		AssemblyInfo :  McAcpTrakAsmInfoType;  (*Information about the assembly.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmReadStatus_AcpTrak (*Provides the current state of the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		AssemblyDisabled : BOOL; (*The assembly is switched off.*)
		AssemblyReady : BOOL; (*The assembly is switched on and ready.*)
		AssemblyHoming : BOOL; (*The assembly is homing. Shuttle identification is active.*)
		AssemblyStopping : BOOL; (*The assembly is being stopped. Shuttle movements are being stopped.*)
		AssemblyErrorStop : BOOL; (*The assembly is in an error state. Shuttle movements are being stopped.*)
		AssemblyStartup : BOOL; (*The initialization of the assembly is being performed.*)
		AssemblyInvalidConfig : BOOL; (*The configuration of the assembly is not valid.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmReset_AcpTrak (*Acknowledges all errors on the assembly and performs a state transition from AssemblyErrorStop to AssemblyDisabled.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmSetOverride_AcpTrak (*Sets the value of the override parameters (multiplication factors) for velocity and acceleration/deceleration.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
		Type : McAcpTrakOverrideEnum; (*Defines the type of the override.*)
		AdvancedParameters : McAcpTrakAdvAsmOverrideParType; (*Structure for using advanced functions.*)
		Factor : REAL; (*Override factor.*)
	END_VAR
	VAR_OUTPUT
		Enabled : BOOL; (*The override factor is applied.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmStop_AcpTrak (*Stops all shuttles on the assembly and performs a state transition to AssemblyStopping, until the function block is reset.*)
	VAR_INPUT
		Assembly : REFERENCE TO McAssemblyType; (*The assembly reference provides the link between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		AdvancedParameters : McAcpTrakAdvAsmStopParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_BarrierCommand_AcpTrak (*Opens or closes user-defined barriers or enables the ticket system for it.*)
	VAR_INPUT
		ProcessPoint : REFERENCE TO McProcessPointType; (*The ProcessPoint reference provides the link between the function block and the process point.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Command : McAcpTrakBarrierCmdEnum; (*Selector for the specific command.*)
		AdvancedParameters : McAcpTrakAdvBarrierParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_BarrierGetShuttle_AcpTrak (*Returns the axis references of all shuttles waiting in front of the barrier.*)
	VAR_INPUT
		ProcessPoint : REFERENCE TO McProcessPointType; (*The ProcessPoint reference provides the link between the function block and the process point.*)
		Enable : BOOL;  (*A list of shuttles is stored after the function block is enabled. This list is retained until "Enable" is reset or all shuttle information is output via input "Next".*)
		Next : BOOL; (*Show information about the next shuttle.*)
		AdvancedParameters : McAcpTrakAdvBarrierGetShParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		TotalCount : UINT; (*Number of all shuttles waiting in front of the barrier when the function block was enabled, meeting the selection criterion.*)
		RemainingCount : UINT; (*Number of shuttle information items not yet read.*)
		Axis : McAxisType; (*The determined axis reference.*)
		AdditionalInfo : McAcpTrakBarrierGetShInfoType; (*Additional information*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_BarrierReadInfo_AcpTrak (*Returns information about the barrier.*)
	VAR_INPUT
		ProcessPoint : REFERENCE TO McProcessPointType; (*The ProcessPoint reference provides the link between the function block and the process point.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		BarrierInfo : McAcpTrakBarrierInfoType; (*Information of the barrier.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ProcPointReadInfo_AcpTrak (*Cyclically returns information about the specified process point.*)
	VAR_INPUT
		ProcessPoint : REFERENCE TO McProcessPointType; (*The ProcessPoint reference provides the link between the function block and the process point.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		ProcPointInfo : McAcpTrakProcPointInfoType; (*Information on the process point.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ConDelete_AcpTrak (*Deletes the convoy of the specified convoy master shuttle.*)
	VAR_INPUT
		ConvoyMaster : REFERENCE TO McAxisType; (*The shuttle reference to the convoy master establishes the connection of the function block to the convoy.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		AdvancedParameters : McAcpTrakAdvConDeleteParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ConGetShuttle_AcpTrak (*Returns the axis references of all shuttles of the convoy of the specified convoy master shuttle.*)
	VAR_INPUT
		ConvoyMaster : REFERENCE TO McAxisType; (*The shuttle reference to the convoy master establishes the connection of the function block to the convoy.*)
		Enable : BOOL;  (*A list of shuttles is stored after the function block is enabled. This list is retained until "Enable" is reset or all shuttle information is output via input "Next".*)
		Next : BOOL; (*Show information about the next shuttle.*)
		AdvancedParameters : McAcpTrakAdvConGetShParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		TotalCount : UINT; (*Number of all shuttles that were included in the convoy when the function block was enabled.*)
		RemainingCount : UINT; (*Number of shuttle information items not yet read.*)
		Axis : McAxisType; (*The determined axis reference.*)
		AdditionalInfo :  McAcpTrakConGetShAddInfoType; (*Additional information.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ConReadInfo_AcpTrak (*Provides information about the convoy of the specified convoy master shuttle.*)
	VAR_INPUT
		ConvoyMaster : REFERENCE TO McAxisType; (*The shuttle reference to the convoy master establishes the connection of the function block to the convoy.*)
		Enable: BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		ConvoyInfo : McAcpTrakConInfoType; (*Information about the convoy.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ElasticMoveAbs_AcpTrak (*Starts an elastic movement to a specified absolute position on the shuttle's current reference sector.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Position : LREAL; (*Target position for the movement.*)
		Velocity : REAL; (*Maximum velocity*)
		Acceleration : REAL; (*Maximum acceleration*)
		Deceleration : REAL; (*Maximum deceleration*)
		Jerk : REAL; (*Maximum jerk*)
		BufferMode : McBufferModeEnum; (*Defines the chronological order of the function block and the preceding function block.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType; (*Internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ElasticMoveAdd_AcpTrak (*Starts an elastic movement over a specified distance on the shuttle's current reference sector.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Distance : LREAL; (*Traverse path for the movement.*)
		Velocity : REAL; (*Maximum velocity*)
		Acceleration : REAL; (*Maximum acceleration*)
		Deceleration : REAL; (*Maximum deceleration*)
		Jerk : REAL; (*Maximum jerk*)
		BufferMode : McBufferModeEnum; (*Defines the chronological order of the function block and the preceding function block.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType; (*Internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ElasticMoveCycPos_AcpTrak (*Specifies the position setpoint of a shuttle on a cyclic basis. An elastic movement relative to the shuttle's current reference sector is being performed.*)
	VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
        Enable : BOOL; (*The function block is active as long as this input is set.*)
        InterpolationMode : McIplModeEnum; (*Interpolation mode for the received value.*)
        AdvancedParameters : McAdvMoveCycParType; (*Structure for using advanced functions.*)
	CyclicPosition : LREAL; (*Cyclic position setpoint.*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*Initialization completed, position being transmitted cyclically.*)
        Busy : BOOL; (*The function block is active and must continue to be called.*)
        CommandAborted : BOOL; (*The command was aborted by another command.*)
        Error : BOOL; (*An error occurred during execution.*)
        ErrorID : DINT; (*Error number.*)
        InCyclicPosition : BOOL; (*The specified cyclic position is reached in the current cycle.*)
    END_VAR
    VAR
        Internal : McInternalType; (*Internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ElasticMoveVel_AcpTrak (*Starts an elastic movement with a specified velocity in a specified direction relative to the shuttle's current reference sector.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Velocity : REAL; (*Maximum velocity*)
		Acceleration : REAL; (*Maximum acceleration*)
		Deceleration : REAL; (*Maximum deceleration*)
		Jerk : REAL; (*Maximum jerk*)
		Direction : McDirectionEnum; (*Direction of movement.*)
		BufferMode : McBufferModeEnum; (*Defines the chronological order of the function block and the preceding function block.*)
	END_VAR
	VAR_OUTPUT
		InVelocity : BOOL; (*Specified velocity reached.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType; (*Internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_MoveCyclicTcpPos_AcpTrak (*Specifies the tcp position setpoint of a shuttle on a cyclic basis. A movement relative to the shuttle's current reference sector is being performed.*)
        VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
        Enable : BOOL; (*The function block is active as long as this input is set.*)
        CoordSystemName : STRING[260]; (*frame name*)
        Tcp : McPosType; (*Position in the coordinate system*)
        AdvancedParameters : McAcpTrakAdvMoveCycParType; (*Structure for using advanced functions.*)
        CyclicPosition : LREAL; (*Cyclic position setpoint.*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*Initialization completed, position being transmitted cyclically.*)
        Busy : BOOL; (*The function block is active and must continue to be called.*)
        CommandAborted : BOOL; (*The command was aborted by another command.*)
        Error : BOOL; (*An error occurred during execution.*)
        ErrorID : DINT; (*Error number.*)
        InCyclicPosition : BOOL; (*The specified cyclic position is reached in the current cycle.*)
    END_VAR
    VAR
        Internal : McInternalType; (*Internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_MoveCyclicTcpVel_AcpTrak (*Specifies the tcp velocity of a shuttle on a cyclic basis. A movement relative to the shuttle's current reference sector is being performed.*)
        VAR_INPUT
        Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
        Enable : BOOL; (*The function block is active as long as this input is set.*)
        CoordSystemName : STRING[260]; (*frame name*)
        Tcp : McPosType; (*Position in the coordinate system*)
        Mode: McAcpTrakMoveCycTcpVelModeEnum; (*Specifies how the cyclic velocity in interpreted.*)
        AdvancedParameters : McAcpTrakAdvMoveCycParType; (*Structure for using advanced functions.*)
        CyclicVelocity : REAL; (*Cyclic velocity.*)
    END_VAR
    VAR_OUTPUT
        Valid : BOOL; (*Initialization completed, position being transmitted cyclically.*)
        Busy : BOOL; (*The function block is active and must continue to be called.*)
        CommandAborted : BOOL; (*The command was aborted by another command.*)
        Error : BOOL; (*An error occurred during execution.*)
        ErrorID : DINT; (*Error number.*)
        InCyclicVelocity : BOOL; (*The specified cyclic velocity is reached in the current cycle.*)
    END_VAR
    VAR
        Internal : McInternalType; (*Internal variable*)
    END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_GetPosition_AcpTrak (*Translates a position from a specified source component to a position on a specified target component*)
	VAR_INPUT
		Component: McComponentType; (*The component the function block should be called for.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		TargetComponent: McComponentType; (*Reference to the component*)
		AdvancedParameters : McAcpTrakAdvGetPositionParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*Function block is active and must continue to be called*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Info :  McAcpTrakGetPositionInfoType; (*Additional information*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_GetRouteInfo_AcpTrak (*Provides information about the route for a specified shuttle, prior to calling a routed-move command.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Sector: REFERENCE TO McSectorType; (*Reference to the target sector.*)
		Position: LREAL; (*The target position on the specified sector.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		AdvancedParameters : McAcpTrakAdvRouteParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Info : McAcpTrakAdvRouteInfoType; (*Route information*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ModuloMoveAbs_AcpTrak (*Starts an elastic or rigid movement to a specified absolute modulo position on the current reference sector of the shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Position : LREAL; (*Target position for the movement.*)
		Velocity : REAL; (*Maximum velocity*)
		Acceleration : REAL; (*Maximum acceleration*)
		Deceleration : REAL; (*Maximum deceleration*)
		Jerk : REAL; (*Maximum jerk*)
		Elastic : BOOL; (*Defines whether the movement is executed in elastic or rigid mode.*)
		Direction : McDirectionEnum; (*Direction of movement.*)
		BufferMode : McBufferModeEnum; (*Defines the chronological order of the function block and the preceding function block.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis group.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType; (*Internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ProcPointGetInfo_AcpTrak (*Returns information about the specified process point.*)
	VAR_INPUT
		ProcessPoint : REFERENCE TO McProcessPointType; (*The ProcessPoint reference provides the link between the function block and the process point.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		ProcPointInfo : McAcpTrakProcPointGetInfoType; (*Information about the process point.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_RoutedMoveAbs_AcpTrak (*Starts an elastic movement to a specified absolute position on a defined sector.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute: BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Sector : REFERENCE TO McSectorType; (*Target sector reference.*)
		Position: LREAL; (*Target position for the movement.*)
		Velocity : REAL; (*Maximum velocity*)
		Acceleration : REAL; (*Maximum acceleration*)
		Deceleration : REAL; (*Maximum deceleration*)
		Jerk : REAL; (*Maximum jerk*)
		BufferMode : McBufferModeEnum; (*Defines the chronological order of the function block and the preceding function block.*)
		AdvancedParameters : McAcpTrakAdvRouteParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed. The shuttle has reached the required position on the target sector.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalTwoRefType; (*Internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_RoutedMoveVel_AcpTrak (*Starts an elastic movement in the direction of a specified absolute position on a defined sector.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute: BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Sector : REFERENCE TO McSectorType; (*Target sector reference.*)
		Position: LREAL; (*Target position for the movement. The target position will be passed by the shuttle.*)
		Velocity : REAL; (*Maximum velocity after the target position has been reached.*)
		RouteVelocity : REAL; (*Maximum velocity before the target position has been reached.*)
		Acceleration : REAL; (*Maximum acceleration.*)
		Deceleration : REAL; (*Maximum deceleration.*)
		Jerk : REAL; (*Maximum jerk.*)
		BufferMode : McBufferModeEnum; (*Defines the chronological order of the function block and the preceding function block.*)
		AdvancedParameters : McAcpTrakAdvRouteParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		InVelocity : BOOL; (*Specified velocity reached.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		PositionReached : BOOL; (*The shuttle has reached the required position on the target sector.*)
	END_VAR
	VAR
		Internal : McInternalTwoRefType; (*Internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SecAddShuttle_AcpTrak (*Creates and adds a shuttle at a defined position of the sector.*)
	VAR_INPUT
		Sector : REFERENCE TO McSectorType; (*The sector reference provides the link between the function block and the sector.*)
		Execute : BOOL;  (*Execution of the function block is started on a rising edge of the input.*)
		Position : LREAL; (*Shuttle position within the specified sector.*)
		Velocity : REAL; (*Shuttle actual velocity.*)
		Orientation : McDirectionEnum; (*Defines the orientation of the shuttle on end position.*)
		AdvancedParameters : McAcpTrakAdvSecAddShuttleType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block is completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*FB has control over shuttle*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Axis : McAxisType; (*Axis reference of the added shuttle.*)
		ID : UDINT; (*ID of the shuttle*)
		AdditionalInfo :  McAcpTrakSecAddShuttleInfoType; (*Additional information about the shuttle.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_SecGetInfo_AcpTrak (*Outputs information about the specified sector.*)
	VAR_INPUT
		Sector : REFERENCE TO McSectorType; (*The sector reference provides the link between the function block and the sector.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		SectorInfo :    McAcpTrakSecGetInfoType;  (*Information about the sector.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SecGetShuttle_AcpTrak (*Returns the axis references of all shuttles in an area of a sector, corresponding to the specified selection.*)
	VAR_INPUT
		Sector : REFERENCE TO McSectorType; (*The sector reference provides the link between the function block and the sector.*)
		Enable : BOOL;  (*A list of shuttles is stored after the function block is enabled. This list is retained until "Enable" is reset or all shuttle information is output via input "Next".*)
		Next : BOOL; (*Show information about the next shuttle.*)
		Mode : McAcpTrakSearchModeEnum; (*Direction for shuttle listing.*)
		AdvancedParameters : McAcpTrakAdvSecGetShParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		TotalCount : UINT; (*Total number of shuttles detected in the section of the specified sector when the function block is enabled.*)
		RemainingCount : UINT; (*Number of shuttle information items not yet read.*)
		Axis : McAxisType; (*The determined axis reference.*)
		AdditionalInfo : McAcpTrakSecGetShAddInfoType; (*Additional information.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_SecReadInfo_AcpTrak (*Reads current information about the specified sector.*)
	VAR_INPUT
		Sector : REFERENCE TO McSectorType; (*The sector reference provides the link between the function block and the sector.*)
		Enable : BOOL;  (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		SectorInfo :  McAcpTrakSecInfoType;  (*Information about the sector.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SecStop_AcpTrak (*Stops all shuttles on the specified sector.*)
	VAR_INPUT
		Sector : REFERENCE TO McSectorType; (*The sector reference provides the link between the function block and the sector.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		AdvancedParameters : McAcpTrakAdvSecStopParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegCommandError_AcpTrak (*Specifically generates an error for the specified segment.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference provides the link between the function block and the segment.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Command : McErrorCmdEnum; (*Defines the command that should be triggered by the drive.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_SegGetInfo_AcpTrak (*Outputs information about the specified segment.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference establishes the connection between the function block and the segment.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		SegmentInfo : McAcpTrakSegGetInfoType;  (*Information about the segment.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegLimitErrorScope_AcpTrak (*Limits the error response scope for the specified segment.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference provides the link between the function block and the segment.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Mode : McAcpTrakSegLimitErrorScopeMode; (*Defines the error response scope for errors on this segment.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegPowerOff_AcpTrak (*Switches off the controller for the segment.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference provides the link between the function block and the segment.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		AdvancedParameters : McAcpTrakAdvSegPowerOffParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegPowerOn_AcpTrak (*Switches on the controller for the segment.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference provides the link between the function block and the segment.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegProcessParID_AcpTrak (*Reads or writes parameters (parameter IDs or ParIDs for short) from or to the segment, either individually or as a list.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference provides the link between the function block and the segment.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		DataAddress : UDINT; (*Address of the variable or array of data type McAcpTrakSegProcessParIDType.*)
		NumberOfParIDs : UDINT; (*Number of parameter IDs that are to be read or written (equals the number of elements in the array).*)
		Mode : McAcpTrakSegProcessParIDModeEnum; (*Mode that defines whether the parameter IDs should be read or written once only.*)
		ChannelIndex : USINT; (*Channel index (gripper) to which the ParID should be written or read.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK  MC_BR_SegReadErrorInfo_AcpTrak (*Reads information about an error of the specified segment.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference establishes the connection between the function block and the segment.*)
		Enable : BOOL;  (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		ErrorInfo :  McAcpTrakSegErrorInfoType;  (*Information about the error response of the segment.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegReadInfo_AcpTrak (*Provides status information about the specified segment.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference provides the link between the function block and the segment.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		SegmentInfo : McAcpTrakSegInfoType; (*Information about the segment.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegReadStatus_AcpTrak (*Provides the current state of the segment.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference provides the link between the function block and the segment.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		SegmentDisabled : BOOL; (*The segment is switched off. Initialization is completed.*)
		SegmentReady : BOOL; (*The segment is switched on and ready.*)
		SegmentStopping : BOOL; (*The segment is in state Stopping. Shuttle movements are being stopped.*)
		SegmentErrorStop : BOOL; (*The segment is in an error state. Shuttle movements are being stopped.*)
		SegmentStartup : BOOL; (*The initialization of the segment is being performed.*)
		SegmentInvalidConfig : BOOL; (*The configuration of the segment is not valid.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegReset_AcpTrak (*Performs a state transition from SegmentErrorStop to SegmentReady or SegmentDisabled for the specified segment.*)
	VAR_INPUT
		Segment : REFERENCE TO McSegmentType; (*The segment reference provides the link between the function block and the segment.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShCamAutCmd_AcpTrak (*Transfers commands for shuttles to a cam automat.*)
	VAR_INPUT
		Slave : REFERENCE TO McAxisType; (*The slave axis reference creates a link between the function block and the slave axis.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
		AdvancedParameters : McAcpTrakAdvShCamAutCmdParType; (*Structure for using advanced functions.*)
		Commands : McAcpTrakShCamAutCmdCommandsType; (*Structure containing the commands that can be issued.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Info : McAcpTrakShCamAutCmdInfoType; (*Information about the current state.*)
		Ready : BOOL; (*Specifies whether a new command can be executed immediately. If not, the new command will be executed once the current command has been successfully transferred.*)
	END_VAR
	VAR
		Internal : McInternalType; (*Internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShCopyUserData_AcpTrak (*Reads or writes user data for a specified shuttle from or to the corresponding process variable.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute: BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		DataAddress : UDINT; (*Address of the user-data process variable.*)
		DataSize : UDINT; (*Size of the user data process variable in bytes.*)
		Mode : McAcpTrakCopyUserDataModeEnum; (*Defines whether the user data for a shuttle should be read or written.*)
		UserState : UDINT; (*User defined state*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		ActualUserState : UDINT; (*actual set user state*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShCouplingObjCmd_AcpTrak (*Sets or removes a coupling object for or from the specified shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute: BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Command: McAcpTrakCouplingObjCmdEnum; (*Coupling object command.*)
		CouplingObjectName: STRING[32]; (*Name of the coupling object to be used.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShCreateConvoy_AcpTrak (*Creates a convoy for the specified shuttle, which is then defined to be its convoy master.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Parameters : McAcpTrakConvoyParType; (*Parameters for the convoy to be generated.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShInteractCmd_AcpTrak (*Provides the option to execute an action for a shuttle with respect to another shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute: BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Command:  McAcpTrakShInteractCmdEnum; (*Action to be carried out.*)
		Shuttle: REFERENCE TO McAxisType; (*The second shuttle, in relation to which the action is performed.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShLocalLimitCmd_AcpTrak (*Enables or disables a local motion limit for the specified shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute: BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Command:  McAcpTrakShLocalLimitCmdEnum; (*Local movement limit command.*)
		LocalLimitName: STRING[32]; (*Name of the local movement limit to be used.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShMoveInConvoy_AcpTrak (*Adds a shuttle or a convoy to the specified convoy.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The axis reference establishes the connection between the function block and an axis.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Parameters : McAcpTrakShConvoyParType; (*Parameters for the shuttle in the convoy.*)
		AdvancedParameters : McAcpTrakAdvShConvoyParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis group.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalTwoRefType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShMoveCycInConvoy_AcpTrak (*Adds a shuttle or a convoy to the specified convoy.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The axis reference establishes the connection between the function block and an axis.*)
		Enable : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Parameters : McAcpTrakShConvoyParType; (*Parameters for the shuttle in the convoy.*)
		AdvancedParameters : McAcpTrakAdvShConvoyParType; (*Structure for using advanced functions.*)
		CyclicTargetDistance : LREAL; (*Distance can be changed cyclically.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		InCyclicDistance : BOOL; (*Cyclic target distance.*)
	END_VAR
	VAR
		Internal : McInternalTwoRefType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShPowerOff_AcpTrak (*Performs a state transition to state Disabled for the specified shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShPowerOn_AcpTrak (*Performs a state transition to state Standstill or ContinuousMotion for the specified shuttle, provided it is controllable and in state Disabled.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShReadErrorInfo_AcpTrak (*Reads information about an error stop of the specified shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Enable: BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		ErrorInfo :  McAcpTrakShErrorInfoType; (*Information about the error response of the shuttle*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShReadFrame_AcpTrak (*Reads the position and orientation of the specified shuttle with respect to the selected coordinate system.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Enable: BOOL; (*The function block is active as long as this input is set.*)
		CoordSystem: UDINT; (*Coordinate system*)
		AdvancedParameters : McAcpTrakAdvShReadFrameParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Frame : McFrameType; (*Shuttle frame*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShReadInfo_AcpTrak (*Reads current information about the specified shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Enable: BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		ShuttleInfo : McAcpTrakShInfoType; (*Information about the shuttle.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShReadRecoveryInfo_AcpTrak (*Reads the position and target position of the shuttle at the last time it was controlled.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		AdvancedParameters : McAcpTrakAdvShReadRecInfoParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		RecoveryInfo : McAcpTrakShRecoveryInfoType; (*Information about the shuttle position and destination at the moment of transition to state Disabled.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShReadSectorPos_AcpTrak (*Determines the position and orientation of the shuttle with respect to a specific sector.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
		Sector : REFERENCE TO McSectorType; (*Sector to which the output position should refer.*)
		AdvancedParameters : McAcpTrakAdvShReadSecPosParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Info : McAcpTrakShReadSecPosInfoType; (*Information about the shuttle position on the specified sector.*)
	END_VAR
	VAR
		Internal : McInternalTwoRefType; (*Internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShReadSegmentInfo_AcpTrak (*Provides information about the segments the shuttle is currently located on.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Enable: BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		SegmentInfo :  McAcpTrakShSegmentInfoType; (*Information about the segments on which the shuttle is located.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShReadSize_AcpTrak (*Outputs the dimensions of the shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		SizeInfo : McAcpTrakShSizeInfoType; (*Information about the shuttle dimensions.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShRemoveFromConvoy_AcpTrak (*Removes the shuttle or convoy from its convoy.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The axis reference establishes the connection between the function block and an axis.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		AdvancedParameters : McAcpTrakAdvShRemoveConParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis group.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShResize_AcpTrak (*Changes the dimensions of the specified shuttle during runtime.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute: BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Command :   McAcpTrakShResizeCmdEnum; (*Selects the command.*)
		ResizeParameter:  McAcpTrakShResizeParamType; (*Parameters to be changed*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShSelCtrlParSet_AcpTrak (*Switches to a configured parameter set of the shuttle during runtime. Up to eight such sets can be configured.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute: BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Mode :  McAcpTrakSelectShSideEnum; (*Selection of the shuttle side to be changed.*)
		ParameterSetIndex: USINT; (*Index of the parameter set that should be changed.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShSetMotionFilter_AcpTrak (*Sets the motion filter parameter of the specified shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		MotionFilterParameter : McAcpTrakShFilterParType; (*Motion filter parameter.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShSetUserID_AcpTrak (*Defines a user ID for the specified shuttle.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		UserID : STRING[32]; (*User ID of the shuttle.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShSwitchSector_AcpTrak (*Changes the shuttle's current reference sector to the specified sector.*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*The shuttle reference provides the link between the function block and the shuttle.*)
		Execute: BOOL; (*Execution of the function block is started on a rising edge of the input.*)
		Sector : REFERENCE TO McSectorType; (*Target sector where shuttle should be switched to.*)
		AdvancedParameters : McAcpTrakAdvShSwitchSecParType; (*Structure for using advanced functions.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis.*)
		CommandAborted : BOOL; (*The command was aborted by another command.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		Info : McAcpTrakShSwitchSecInfoType; (*Information about the shuttle position after the sector has been changed.*)
	END_VAR
	VAR
		Internal : McInternalTwoRefType; (*Internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrgPointEnable_AcpTrak (*Enables a configured process point as a trigger point.*)
	VAR_INPUT
		ProcessPoint : REFERENCE TO McProcessPointType; (*The ProcessPoint reference provides the link between the function block and the process point.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block output values can be used.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		EventCount : UINT; (*Number of unevaluated events.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrgPointReadInfo_AcpTrak (*Returns information about a trigger event.*)
	VAR_INPUT
		ProcessPoint : REFERENCE TO McProcessPointType; (*The ProcessPoint reference provides the link between the function block and the process point.*)
		Execute : BOOL; (*Execution of the function block is started on a rising edge of the input.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful, function block completed.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*An error occurred during execution.*)
		ErrorID : DINT; (*Error number.*)
		TrgPointInfo : McAcpTrakTrgPointReadInfoType; (*Information about the trigger point.*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK
