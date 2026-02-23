FUNCTION_BLOCK MpTrafficControl (*Traffic control.*)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic manager reference.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable traffic control*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset.*) (* *) (*#PAR#*)
		Velocity : REAL; (*Velocity of shuttle movement at a recovery process.*) (* *) (*#CMD##OPT#*)
		Acceleration : REAL; (*Acceleration of shuttle movement at a recovery process.*) (* *) (*#CMD##OPT#*)
		Recover : BOOL; (*Edge sensitive. Recover all shuttles managed by the traffic manager.*) (* *) (*#CMD#*)
		Recipe : REFERENCE TO STRING[80]; (*Recipe for activation or deactivation.*) (* *) (*#CMD##OPT#*)
		ActivateRecipe : BOOL; (*Edge sensitive. Activate the specified recipe. If no recipe is specified, all parametrized recipes will be activated.*) (* *) (*#CMD#*)
		DeactivateRecipe : BOOL; (*Edge sensitive. Deactivate the specified recipe. If no recipe is specified, all parametrized recipes will be deactivated.*) (* *) (*#CMD#*)
		Halt : BOOL; (*Edge sensitive. Halt the movements of all shuttles managed by the traffic manager.*) (* *) (*#CMD#*)
		Resume : BOOL; (*Edge sensitive. Resume the movements of all shuttles managed by the traffic manager.*) (* *) (*#CMD#*)
		Stop : BOOL; (*Edge sensitive. Stop the movements of all shuttles managed by the traffic manager.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred.*) (* *) (*#PAR#*)
		RecoverBuffered : BOOL; (*Recover command buffered.*) (* *) (*#CMD##OPT#*)
		RecoverAborted : BOOL; (*Recover command aborted.*) (* *) (*#CMD##OPT#*)
		RecoverDone : BOOL; (*Recovery done.*) (* *) (*#CMD#*)
		ActivateRecipeDone : BOOL; (*Activate recipe done.*) (* *) (*#CMD#*)
		DeactivateRecipeDone : BOOL; (*Deactivate recipe done.*) (* *) (*#CMD#*)
		HaltBuffered : BOOL; (*Halt command buffered.*) (* *) (*#CMD##OPT#*)
		HaltAborted : BOOL; (*Halt command aborted.*) (* *) (*#CMD##OPT#*)
		HaltDone : BOOL; (*Halt command done.*) (* *) (*#CMD#*)
		ResumeBuffered : BOOL; (*Resume command buffered.*) (* *) (*#CMD##OPT#*)
		ResumeAborted : BOOL; (*Resume command aborted.*) (* *) (*#CMD##OPT#*)
		ResumeDone : BOOL; (*Resume command done.*) (* *) (*#CMD#*)
		StopBuffered : BOOL; (*Stop command buffered.*) (* *) (*#CMD##OPT#*)
		StopDone : BOOL; (*Stop command done.*) (* *) (*#CMD#*)
		State : MpTrafficManagerStateEnum; (*State.*) (* *) (*#CMD#*)
		Info : MpTrafficControlInfoType; (*Info.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficMonitor (*Traffic monitor.*)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic manager.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable station monitoring.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset*) (* *) (*#PAR#*)
		SelectionMode : MpTrafficSelectionModeEnum; (*Selection mode.*) (* *) (*#CMD#*)
		GetSelectedObjects : BOOL; (*Edge sensitive. Get all traffic objects, that fulfill the selection mode criteria at this moment.*) (* *) (*#CMD#*)
		GetNextObject : BOOL; (*Edge sensitive. Write the next traffic object info to the output.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT		
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred*) (* *) (*#PAR#*)
		SelectedObjectsValid : BOOL; (*The selected objects output is valid*) (*#CMD#*)
		TotalCount : UINT; (*Total count of selected objects*) (* *) (*#CMD#*)
		RemainingCount : UINT; (*Number of unevaluated detected objects.*) (* *) (*#CMD#*)
		Shuttle : MpTrafficShuttleInfoType; (*Shuttle info*) (* *) (*#CMD#*)
		TrafficObject : MpTrafficObjectType; (*Traffic object info*) (* *) (*#CMD#*)
		Recipe : MpTrafficMonRecipeInfoType; (*Recipe info*) (* *) (*#CMD#*)
		Info : MpTrafficMonitorInfoType; (*Info. The count of objects will be updated cyclically.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficShuttleControl (*Shuttle control.*)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic manager reference.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable shuttle control.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset.*) (* *) (*#PAR#*)
		Shuttle : REFERENCE TO Mc6DShuttleType; (*Shuttle to control.*) (* *) (*#PAR#*)
		Update : BOOL; (*Edge sensitive. If the shuttle is valid, update done will be TRUE. Otherwise a warning is output and the old shuttle will be controlled.*) (* *) (*#PAR##OPT#*)
		Velocity : REAL; (*Shuttle velocity.*) (* *) (*#CMD##OPT#*)
		Acceleration : REAL; (*Shuttle acceleration.*) (* *) (*#CMD##OPT#*)
		To : REFERENCE TO MpTrafficStationType; (*Target station of routed move.*) (* *) (*#CMD#*)
		Move : BOOL; (*Execute a routed move to the given Station on the rising edge.*) (* *) (*#CMD#*)
		AssignToStation : BOOL; (*Assign the shuttle to the given Station on the rising edge.*) (* *) (*#CMD##OPT#*)
		AssignToRecoveryStation : BOOL; (*Assign the shuttle to the given recovery Station on the rising edge.*) (* *) (*#CMD##OPT#*)
		Halt : BOOL; (*Halt the movement of this shuttle on the rising edge.*) (* *) (*#CMD#*)
		Resume : BOOL; (*Resume the movement of this shuttle on the rising edge.*) (* *) (*#CMD#*)
		Stop : BOOL; (*Abort any active routed move and stop the shuttle on the rising edge.*) (* *) (*#CMD#*)
	END_VAR
		VAR_OUTPUT
		Active : BOOL; (*Function block is controlling the waypoint.*) (* *) (*#PAR#*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error number*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update done successfully.*) (* *) (*#PAR##OPT#*)
		MoveBuffered : BOOL; (*Move command buffered.*) (* *) (*#CMD##OPT#*)
		MoveAborted : BOOL; (*Move command aborted.*) (* *) (*#CMD##OPT#*)
		MoveDone : BOOL; (*Move command done.*) (* *) (*#CMD#*)
		AssignDone : BOOL; (*Assign to station or assign to recovery station is done.*) (* *) (*#CMD##OPT#*)
		HaltBuffered : BOOL; (*Halt command buffered.*) (* *) (*#CMD##OPT#*)
		HaltAborted : BOOL; (*Halt command aborted.*) (* *) (*#CMD##OPT#*)
		HaltDone : BOOL; (*Halt command done.*) (* *) (*#CMD#*)
		ResumeBuffered : BOOL; (*Resume command buffered.*) (* *) (*#CMD##OPT#*)
		ResumeAborted : BOOL; (*Resume command aborted.*) (* *) (*#CMD##OPT#*)
		ResumeDone : BOOL; (*Resume command done.*) (* *) (*#CMD#*)
		StopBuffered : BOOL; (*Stop command buffered.*) (* *) (*#CMD##OPT#*)
		StopDone : BOOL; (*Stop command done.*) (* *) (*#CMD#*)
		State : MpTrafficShuttleStateEnum; (*Shuttle State.*) (* *) (*#CMD#*)
		Info : MpTrafficShuttleControlInfoType; (*Shuttle Info.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficStationControl (*Station control.*)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic manager reference.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable station control.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset.*) (* *) (*#PAR#*)
		Station : REFERENCE TO MpTrafficStationType; (*Station reference.*) (* *) (*#PAR#*)
		Update : BOOL; (*Edge sensitive. If the station is valid, update done will be TRUE. Otherwise a warning is output and the old station will be controlled.*) (* *) (*#PAR##OPT#*)
		SelectNextShuttle : BOOL; (*Edge sensitive. If the station is occupied with more than 1 shuttles, the shuttle can be selected which should be released.*) (* *) (*#CMD##OPT#*)
		ExitVelocity : REAL; (*Exit velocity of shuttles released by the station.*) (* *) (*#CMD##OPT#*)
		ExitAcceleration : REAL; (*Exit acceleration of shuttles released by the station.*) (* *) (*#CMD##OPT#*)
		To : REFERENCE TO MpTrafficStationType; (*Station to move to.*) (* *) (*#CMD##OPT#*)
		Release : BOOL; (*Edge sensitive. A shuttle is either sent to the “To” station or it is sent on according to the recipe definition.*) (* *) (*#CMD#*)
		Tickets : DINT; (*One shuttle will enter the station per ticket. Once the RemainingTicket count reaches 0, it will be closed.*) (* *) (*#CMD##OPT#*)
		AddTickets : BOOL; (*Add tickets.*) (* *) (*#CMD##OPT#*)
		Close : BOOL; (*Edge sensitive. Close the station and set the remaining tickets to 0. If a station is closed, shuttles will wait at the last traffic object prior to this one. Once the station is open again, shuttles will continue to move there.*) (* *) (*#CMD#*)
		Open : BOOL; (*Edge sensitive. Open the station.*) (* *) (*#CMD#*)
		Deactivate : BOOL; (*Edge sensitive. Deactivate the station. No shuttle can be sent to a deactivated station.*) (* *) (*#CMD#*)
		Activate : BOOL; (*Edge sensitive. Activate the station.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update done successfully.*) (* *) (*#PAR##OPT#*)
		SelectedShuttle : MpTrafficStationShInfoType; (*Information of the shuttle, which can be released.*) (* *) (*#CMD##OPT#*)
		ReleaseBuffered : BOOL; (*Release command buffered.*) (* *) (*#CMD##OPT#*)
		ReleaseAborted : BOOL; (*Release command aborted.*) (* *) (*#CMD##OPT#*)
		ReleaseDone : BOOL; (*Release command done. Shuttle is released from this station.*) (* *) (*#CMD#*)
		State : MpTrafficStationStateEnum; (*State.*) (* *) (*#CMD#*)
		Info : MpTrafficStationCtrlInfoType; (*Info.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficStationMonitor (*Station monitor.*)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic manager.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable station monitoring.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset*) (* *) (*#PAR#*)
		Station : REFERENCE TO MpTrafficStationType; (*Station to monitor for shuttles*) (* *) (*#PAR#*)
		GetNextShuttle : BOOL; (*Edge sensitive. Write the next detected shuttle info to the output.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT		
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred*) (* *) (*#PAR#*)
		RemainingShuttleCount : UINT; (*Number of unevaluated detected shuttles.*) (* *) (*#CMD#*)
		DetectedShuttle : MpTrafficDetectedShInfoType; (*Info about the first detected shuttle.*) (* *) (*#CMD#*)
		Info : MpTrafficStationMonInfoType; (*Info.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficWaypointControl (*Waypoint control.*)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic manager reference.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable waypoint control.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset.*) (* *) (*#PAR#*)
		Waypoint : REFERENCE TO MpTrafficWaypointType; (*Waypoint reference.*) (* *) (*#PAR#*)
        Update : BOOL; (*Edge sensitive. If the waypoint is valid, update done will be TRUE. Otherwise a warning is output and the old waypoint will be controlled.*) (* *) (*#PAR#*)
		Tickets : DINT; (*One shuttle will enter the waypoint per ticket. Once the RemainingTicket count reaches 0, it will be closed.*) (* *) (*#CMD##OPT#*)
		AddTickets : BOOL; (*Add tickets.*) (* *) (*#CMD##OPT#*)
		Close : BOOL; (*Edge sensitive. Close the waypoint and set the remaining tickets to 0. If a waypoint is closed, shuttles will wait at the last traffic object prior to this one. Once the waypoint is open again, shuttles will continue to move there.*) (* *) (*#CMD#*)
		Open : BOOL; (*Edge sensitive. Open the waypoint.*) (* *) (*#CMD#*)
		Deactivate : BOOL; (*Edge sensitive. Deactivate the waypoint. No shuttle can be sent to a deactivated waypoint.*) (* *) (*#CMD#*)
		Activate : BOOL; (*Edge sensitive. Activate the waypoint.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update done successfully.*) (* *) (*#PAR#*)
		State : MpTrafficWaypointStateEnum; (*State.*) (* *) (*#CMD#*)
		Info : MpTrafficWaypointCtrlInfoType; (*Waypoint Info.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficWaypointMonitor (*Waypoint monitor.*)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic manager.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable waypoint monitoring.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset*) (* *) (*#PAR#*)
		Waypoint : REFERENCE TO MpTrafficWaypointType; (*Waypoint to monitor for events*) (* *) (*#PAR#*)
		GetNextShuttle : BOOL; (*Edge sensitive. Write the next detected shuttle info to the output.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred*) (* *) (*#PAR#*)
		RemainingShuttleCount : UINT; (*Number of unevaluated detected shuttles.*) (* *) (*#CMD#*)
		DetectedShuttle : MpTrafficDetectedShInfoType; (*Info about the first detected shuttle.*) (* *) (*#CMD#*)
		Info : MpTrafficWaypointMonInfoType; (*Info.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficConfigHandler (*Load configuration into parameterization or save parameterization into configuration.*)
    VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic Manager.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable parameter commands.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset*) (* *) (*#PAR#*)
		LoadToParam : BOOL; (*Loads the currently stored configuration on the target system to the parameterization of the traffic manager.*) (* *) (*#CMD#*)
		SaveFromParam : BOOL; (*Save the current parameterization of the traffic manager into the configuration on the target system.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred*) (* *) (*#PAR#*)
		CommandBusy : BOOL; (*Processing a command*) (* *) (*#CMD#OPT#*)
        CommandDone : BOOL; (*Command done*) (* *) (*#CMD#*)
		Info : MpTrafficConfigHandlerInfoType; (*Info.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficStationParam (*Parameterization of a station from the traffic manager. *)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic manager.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable parameterization functions.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset*) (* *) (*#PAR#*)
		Station : REFERENCE TO MpTrafficStationType; (*Station to parameterize.*) (* *) (*#PAR#*)
		Update : BOOL; (*Edge sensitive. If the station is valid, update done will be TRUE. Otherwise a warning is output and the old station will be used.*) (* *) (*#PAR#*)
		Position : REFERENCE TO MpTrafficPositionType; (*The position of the traffic object. A nullpointer deactivates reading or writing of the traffic object position.*) (* *) (*#CMD#*) 
		Recovery : REFERENCE TO MpTrafficRecoveryType; (*Recovery parameterization. A nullpointer deactivates the reading or writing of the recovery settings from the traffic object.*) (* *) (*#CMD#*)
		Mapping : REFERENCE TO MpTrafficMappingType; (*Mapping of the traffic objects. A nullpointer deactivates the reading or writing of the mapping from the traffic object.*) (* *) (*#CMD#*)
		Read : BOOL; (*Read the current parameterization of the traffic object into the referenced data structures.*) (* *) (*#CMD#*)
		Write : BOOL; (*Write the specified settings at the referenced data structures into the parameterization of the traffic object.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update done successfully.*) (* *) (*#PAR##OPT#*)
		CommandBusy : BOOL; (*Processing a command.*) (* *) (*#CMD#*)
		CommandDone : BOOL; (*Command done.*) (* *) (*#CMD#*)
		Info : MpTrafficStationParamInfoType; (*Info.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficWaypointParam (*Parameterization of a waypoint from the traffic manager. *)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic manager.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable parameterization functions.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset*) (* *) (*#PAR#*)
		Waypoint : REFERENCE TO MpTrafficWaypointType; (*Waypoint to parameterize.*) (* *) (*#PAR#*)
		Update : BOOL; (*Edge sensitive. If the waypoint is valid, update done will be TRUE. Otherwise a warning is output and the old waypoint will be used.*) (* *) (*#PAR#*)
		Position : REFERENCE TO MpTrafficPositionType; (*The position of the traffic object. A nullpointer deactivates reading or writing of the traffic object position.*) (* *) (*#CMD#*) 
		Mapping : REFERENCE TO MpTrafficMappingType; (*Mapping of the traffic objects. A nullpointer deactivates the reading or writing of the mapping from the traffic object.*) (* *) (*#CMD#*)
		Read : BOOL; (*Read the current parameterization of the traffic object into the referenced data structures.*) (* *) (*#CMD#*)
		Write : BOOL; (*Write the specified settings at the referenced data structures into the parameterization of the traffic object.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update done successfully.*) (* *) (*#PAR##OPT#*)
		CommandBusy : BOOL; (*Processing a command.*) (* *) (*#CMD#*)
		CommandDone : BOOL; (*Command done.*) (* *) (*#CMD#*)
		Info : MpTrafficWaypointParamInfoType; (*Info.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficObjectCreator (*Add or remove a traffic object to or from the traffic manager.*)
	VAR_INPUT
		MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic Manager.*) (* *) (*#PAR#*)
		Enable : BOOL; (*Enable parameter commands.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset*) (* *) (*#PAR#*)
		ObjectName : STRING[80]; (*Name of the traffic object.*) (* *) (*#CMD#*)
		ObjectType : MpTrafficObjectTypeEnum; (*Type of the traffic object.*) (* *) (*#CMD#*)
		ObjectListName : STRING[80]; (*Name of the traffic object list.*) (* *) (*#CMD#*)
		Add : BOOL; (*Add the traffic object to the specified list of the traffic manager.*) (* *) (*#CMD#*)
		Remove : BOOL; (*Remove the traffic object from the traffic manager. Rhe ObjectListName is not required for this operation.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred*) (* *) (*#PAR#*)
		CommandBusy : BOOL; (*Processing a command*) (* *) (*#CMD#OPT#*)
        CommandDone : BOOL; (*Command done*) (* *) (*#CMD#*)
		Info : MpTrafficObjectCreatorInfoType; (*Info.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTrafficManagerParam (*Parameterization the traffic manager.*)
    VAR_INPUT
        MpLink : REFERENCE TO MpTrafficManagerType; (*Traffic Manager.*) (* *) (*#PAR#*)
		Enable : BOOL; (* The function block is active as long as this input is set.*) (* *) (*#PAR#*)
		ErrorReset : BOOL; (*Error reset*) (* *) (*#PAR#*)
		MotionSystem : REFERENCE TO MpTrafficMotionSystemParType; (*Motion system controlled by the traffic manager. A nullpointer deactivates the reading or writing of this dataset.*) (* *) (*#CMD#*)
        TrafficObjects : REFERENCE TO MpTrafficObjectListsParType; (*Address of a datastructure which contains the names of the traffic object lists. A nullpointer deactivates the reading or writing of this dataset.*) (* *) (*#CMD#*)
        Mapping : REFERENCE TO MpTrafficMappingListsParType; (*Address of a datastructure which contains the names of the traffic mapping lists. A nullpointer deactivates the reading or writing of this dataset.*) (* *) (*#CMD#*)
        Rules : REFERENCE TO MpTrafficRuleListsParType; (*Address of a datastructure which contains the names of the traffic rule lists. A nullpointer deactivates the reading or writing of this dataset.*) (* *) (*#CMD#*)
		Read : BOOL; (*Loads the current parameterization settings into the referenced data structure "Data".*) (* *) (*#CMD#*)
		Write : BOOL; (*Saves the specified settings at the referenced data structure "Data" into the parameterization of the component.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active. Outputs are valid.*) (* *) (*#PAR#*)
		Error : BOOL; (*An error occurred*) (* *) (*#PAR#*)
		StatusID : DINT; (*Error that occurred*) (* *) (*#PAR#*)
		CommandBusy : BOOL; (*Processing a command*) (* *) (*#CMD#OPT#*)
        CommandDone : BOOL; (*Command done*) (* *) (*#CMD#*)
		Info : MpTrafficManagerParamInfoType; (*Info.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
