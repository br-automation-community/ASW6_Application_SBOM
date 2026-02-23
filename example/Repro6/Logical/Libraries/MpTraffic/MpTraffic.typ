TYPE

    MpTrafficPositionType : STRUCT
        X : LREAL; (*Position on the x-axis. Unit: [m]*)
        Y : LREAL; (*Position on the y-axis. Unit: [m]*)
    END_STRUCT;

    MpTrafficInternalManagerIfType : STRUCT (*Partial interface type (C only)*)
        vtable : DWORD;
    END_STRUCT;

    MpTrafficManagerType : STRUCT
        controlif : REFERENCE TO MpTrafficInternalManagerIfType;
        mappLinkInternal : McInternalMappLinkType;
    END_STRUCT;

    MpTrafficInternalStationIfType : STRUCT (*Partial interface type (C only)*)
        vtable : DWORD;
    END_STRUCT;

    MpTrafficStationType : STRUCT
        controlif : REFERENCE TO MpTrafficInternalStationIfType;
    END_STRUCT;

    MpTrafficInternalWaypointIfType : STRUCT (*Partial interface type (C only)*)
        vtable : DWORD;
    END_STRUCT;

    MpTrafficWaypointType : STRUCT
        controlif : REFERENCE TO MpTrafficInternalWaypointIfType;
    END_STRUCT;

    MpTrafficInternalPathIfType : STRUCT (*Partial interface type (C only)*)
        vtable : DWORD;
    END_STRUCT;

    MpTrafficPathType : STRUCT
        controlif : REFERENCE TO MpTrafficInternalPathIfType;
    END_STRUCT;

    MpTrafficObjectInfoType : STRUCT
        Type : MpTrafficObjectTypeEnum; (*Type of object.*)
        Name : STRING[32]; (*Name of the object.*)
        Station : MpTrafficStationType; (*Station object reference.*)
        Waypoint : MpTrafficWaypointType; (*Waypoint object reference.*)
        Path : MpTrafficPathType; (*Path object reference.*)
    END_STRUCT;

    MpTrafficShuttleInfoType : 	STRUCT
        ShuttleID : UINT; (*Shuttle ID.*)
        Shuttle6D : Mc6DShuttleType; (* Shuttle reference.*)
    END_STRUCT;

    MpTrafficStationInfoType : STRUCT
        Name : STRING[80]; (*Name of the station.*)
        Station : MpTrafficStationType; (*Station object reference.*)
    END_STRUCT;

    MpTrafficWaypointInfoType : STRUCT
        Name : STRING[80]; (*Name of the waypoint.*)
        Waypoint : MpTrafficWaypointType; (*Waypoint object reference.*)
    END_STRUCT;

    MpTrafficPathInfoType : STRUCT
        Name : STRING[80]; (*Name of the path.*)
        Path : MpTrafficPathType; (*Path object reference.*)
    END_STRUCT;

    MpTrafficObjectType : 	STRUCT
        Type : MpTrafficObjectTypeEnum; (*Type of traffic object (e.g. station, waypoint)*)
        Station : MpTrafficStationInfoType; (*Additional information is available here if the type of traffic object read out is a station.*)
        Waypoint : MpTrafficWaypointInfoType; (*Additional information is available here if the type of traffic object read out is a waypoint.*)
        Path : MpTrafficPathInfoType; (*Additional information is available here if the type of traffic object read out is a path.*)
    END_STRUCT;

    MpTrafficControlInfoType : 	STRUCT
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficMonRecipeErrorInfoType : STRUCT
        Station : MpTrafficStationInfoType; (*Process station.*)
        Shuttle : MpTrafficShuttleInfoType; (*Shuttle info.*)
        StatusID : DINT; (*Status information about the error.*)
    END_STRUCT;

    MpTrafficMonRecipeInfoType : STRUCT
        Name : STRING[80]; (*Name of the recipe.*)
        ProductLabel : STRING[80]; (*Product label of this recipe.*)
        IsActive : BOOL; (*Recipe is active.*)
        NumberOfProcessSteps : UINT; (*Number of parametrized process steps in this recipe.*)
        RecipeError : MpTrafficMonRecipeErrorInfoType; (*Additional information if the mode mpTRAFFIC_RECIPE_ERROR was selected.*)
    END_STRUCT;

    MpTrafficNetShuttleInfoType : 	STRUCT
        ShuttleCount : UINT; (*Number of shuttles.*)
        ShuttleErrorCount : UINT; (*Number of shuttles that are in an error state.*)
        ShuttleWaitingExclusivCount : UINT; (*Number of shuttles that must wait due to the exclusivity of the next traffic object on the route.*)
        ShuttleWaitingClosedCount : UINT; (*Number of shuttles that must wait since the next traffic object on the route is closed.*)
        ShuttleWaitingHaltedCount : UINT; (*Number of shuttles that are in the paused state.*)
        ShuttleStateIdleCount : UINT; (*Number of shuttles that do not have an order, i.e. are not traveling a route.*)
        ShuttleStateMotionCount : UINT; (*Number of shuttles that are moving along a route due to execution.*)
        ShuttleStateObstacleCount : UINT; (*Number of shuttles that cannot travel due to an obstacle.*)
        ShuttleStateStoppedCount : UINT; (*Number of shuttles that were stopped.*)
        ShuttleDeadlockCount : UINT; (*Number of shuttles for which a "deadlock" was detected. CURRENTLY NOT AVAILABLE*)
    END_STRUCT;

    MpTrafficNetInfoType : 	STRUCT
        StationsCount : UINT; (*Number of stations.*)
        StationsOccupiedCount : UINT; (*Number of stations that are occupied.*)
        StationsInactiveCount : UINT; (*Number of stations that are deactivated.*)
        StationsClosedCount : UINT; (*Number of stations that are closed.*)
        WaypointsCount : UINT := 0; (*Number of waypoints.*)
        WaypointsOccupiedCount : UINT := 0; (*Number of waypoints that are occupied.*)
        WaypointsInactiveCount : UINT := 0; (*Number of waypoints that are deactivated.*)
        WaypointsClosedCount : UINT := 0; (*Number of waypoints that are closed.*)
        PathsCount : UINT := 0; (*Number of paths.*)
        RecoveryPointsCount : UINT := 0; (*Number of recovery points.*)
        BranchesCount : UINT := 0; (*Number of branches. A branch is a waypoint from which it is possible to travel to more than one traffic object.*)
    END_STRUCT;

    MpTrafficNetRecipeInfoType : STRUCT
        RecipeCount : UINT; (*Current number of parametrized recipes.*)
        RecipeActiveCount : UINT; (*Current number of active recipes.*)
        RecipeErrorCount : UINT; (*Current number of error while executing all active recipes. Further information can be read out using the selection mode mpTRAFFIC_RECIPE_ERROR.*)
    END_STRUCT;

    MpTrafficMonitorInfoType : 	STRUCT
        ShuttleInfo : MpTrafficNetShuttleInfoType; (*Additional information about the shuttle.*)
        TrafficStateInfo : MpTrafficNetInfoType; (*Additional information about traffic objects*)
        RecipeInfo : MpTrafficNetRecipeInfoType; (*Additional information about recipes.*)
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficStationShInfoType :  STRUCT
        Shuttle6D : Mc6DShuttleType; (*Shuttle reference.*)
        ShuttleID : UINT; (*Shuttle ID.*)
        Index : UINT; (*Order index of the occupying shuttles. The first arrived shuttle has the index=1, the second index=2, the 3rd has index=3, ...*)
        Releasing : BOOL; (*Releasing process has started for this shuttle.*)
        State : MpTrafficShuttleStateEnum; (*Shuttle state.*)
    END_STRUCT;

    MpTrafficTicketingType : 	STRUCT
        Active : BOOL; (*In ticketing process.*)
        NumberOfTickets : UINT; (*Current number of all tickets.*)
        RemainingTickets : UINT; (*Tickets, which are still available and not already granted to a shuttle.*)
        GrantedTickets : UINT; (*Number of tickets which are already granted to a shuttle but this ticket was not consumed (e.g. the shuttle must still wait because of exclusivity).*)
    END_STRUCT;

    MpTrafficStationCtrlInfoType : 	STRUCT
        Name : STRING[80]; (*The name of the Station.*)
        Position : MpTrafficPositionType; (*The position of the Station.*)
        Activated : BOOL; (*Station is activated.*)
        Deactivated : BOOL; (*Station is deactivated.*)
        Open : BOOL; (*Station is open.*)
        Closed : BOOL; (*Station is closed.*)
        Ticketing : MpTrafficTicketingType; (*Station is ticketing.*)
        Occupied : BOOL; (*Station is occupied with at least 1 shuttle.*)
        NumOccupyingShuttles : UINT; (*Number of shuttles, which are occupying the station.*)
        LastArrivedShuttle : MpTrafficShuttleInfoType; (*Last arrived shuttle.*)
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficStationMonInfoType : 	STRUCT
        Name : STRING[80]; (*The name of the Station.*)
        Position : MpTrafficPositionType; (*The position of the Station.*)
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficWaypointCtrlInfoType : STRUCT
        Name : STRING[80]; (*The name of the Waypoint.*)
        Position : MpTrafficPositionType; (*The position of the Waypoint.*)
        Activated : BOOL; (*Waypoint is activated.*)
        Deactivated : BOOL; (*Waypoint is deactivated.*)
        Open : BOOL; (*Waypoint is open.*)
        Closed : BOOL; (*Waypoint is closed.*)
        Ticketing : MpTrafficTicketingType; (*Waypoint is ticketing.*)
        Occupied : BOOL; (*Waypoint is occupied with a shuttle.*)
        OccupiedReason : MpTrafficWaypointOccupiedEnum; (*Snapshot. Reason, why a shuttle is occupying the waypoint. Can be used, if a shuttle is longer occupying the waypoint.*)  
        Shuttle : MpTrafficShuttleInfoType; (*Shuttle, which is occupying the waypoint.*)
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficShRoutePositionType :  STRUCT
        FromStation : MpTrafficStationInfoType; (*Origin of the current route.*)
        ToStation : MpTrafficStationInfoType; (*Target of the current route.*)
        CurrentObject : MpTrafficObjectInfoType; (*Current object on the route.*)
        PreviousObject : MpTrafficObjectInfoType; (*Previous object on the route.*)
        NextObject : MpTrafficObjectInfoType; (*Next object on the route.*)
        PassedObjectsCount : UDINT; (*Number of objects passed by the shuttle on the route.*)
    END_STRUCT;

    MpTrafficShuttleControlInfoType : 	STRUCT
        ShuttleID : UINT; (*The ID of the shuttle being controlled.*)
        RoutePosition : MpTrafficShRoutePositionType; (*Position of the shuttle on the route.*)
        AssignedStation : MpTrafficStationInfoType; (*The current assigned station of the shuttle. Any routed moves will begin with this station as the origin.*)
        AssignedRecoveryStation : MpTrafficStationInfoType; (*The current recovery station of the shuttle. The shuttle will attempt to move to this station during recovery.*)
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficWaypointMonInfoType : 	STRUCT
        Name : STRING[80]; (*The name of the Waypoint.*)
        Position : MpTrafficPositionType; (*The position of the Waypoint.*)
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficStationParamInfoType : 	STRUCT
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficObjectCreatorInfoType : 	STRUCT
        LastAddedObject: MpTrafficObjectInfoType; (*Information about the last added object.*)
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficRecoveryType : 	STRUCT
        RecoveryMode : MpTrafficStationRecoveryModeEnum; (*Recovery mode of the station.*)
        StationIsRecoveryPoint : BOOL; (*If true, the station is a recovery point.*)
        RecoveryPoints : MpTrafficRecoveryPointsType; (*Recovery points.*)
    END_STRUCT;

    MpTrafficRecoveryPointsType : 	STRUCT
        ArrayAddress : UDINT; (*Recovery points. Adress of the array of datatype MpTrafficRecoveryPointType.*)
        ArraySize : UINT; (*Size of the data array. (ArraySize = sizeof(array)/sizeof(array[0])).*)
        NumberOfRecoveryPoints : UINT; (*Number of recovery points.*)
    END_STRUCT;

    MpTrafficRecoveryPointType : 	STRUCT
        Position : MpTrafficPositionType; (*The position of the recovery point.*)
    END_STRUCT;

    MpTrafficMappingType : 	STRUCT
        MappingListName : STRING[80]; (*Name of the mapping list.*)
        To : MpTrafficObjMappingType; (*Mapping to these traffic objects.*)
    END_STRUCT;

    MpTrafficObjMappingType : 	STRUCT
        ArrayAddress : UDINT; (*Mapped traffic objects. Adress of the array of datatype MpTrafficObjectNameType.*)
        ArraySize : UINT; (*Size of the data array. (ArraySize = sizeof(array)/sizeof(array[0])).*)
        NumberOfObjects : UINT; (*Number of mapped traffic objects (stations, waypoints).*)
    END_STRUCT;

    MpTrafficObjectNameType : 	STRUCT
        Name : STRING[80]; (*Name of the traffic object.*)
    END_STRUCT;

    MpTrafficWaypointParamInfoType : 	STRUCT
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficConfigHandlerInfoType : STRUCT
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;
    
    MpTrafficDiagType : 	STRUCT
        StatusID : MpTrafficStatusIDType; (*StatusID evaluation (internal).*)
    END_STRUCT;

    MpTrafficStatusIDType : 	STRUCT
        ID : MpTrafficErrorEnum; (*Message ID.*)
        Severity : MpComSeveritiesEnum; (*Message severity.*)
        Code : UINT; (*Message code.*)
    END_STRUCT;

    MpTrafficDetectedShInfoType : STRUCT
        Event : MpTrafficShDetectionEnum; (*How the shuttle was moving during detection.*)
        Shuttle : MpTrafficShuttleInfoType; (*Shuttle information.*)
    END_STRUCT;

    MpTrafficMotionSystemParType : STRUCT
        Type : MpTrafficMotionSystemTypeEnum; (*Selector setting of motion system.*)
        Acopos6D : MpTrafficMotionSysAcp6DType; (*Acopos6D reference settings.*)
    END_STRUCT;

    MpTrafficMotionSysAcp6DType : STRUCT
        AssemblyName : STRING[80] ; (*Name of the referenced assembly.*)
    END_STRUCT;

    MpTrafficObjectListsParType : STRUCT
		ArrayAddress : {REDUND_UNREPLICABLE} UDINT; (*Names of the traffic object lists. Adress of the array of datatype MpTrafficListNamesParType.*)
        ArraySize : UINT; (*Size of the data array. (ArraySize = sizeof(array)/sizeof(array[0])).*)
        NumberOfLists : UINT; (*Number of lists.*)
    END_STRUCT;

    MpTrafficMappingListsParType : STRUCT
		ArrayAddress : {REDUND_UNREPLICABLE} UDINT; (*Names of the mapping lists. Adress of the array of datatype MpTrafficListNamesParType.*)
        ArraySize : UINT; (*Size of the data array. (ArraySize = sizeof(array)/sizeof(array[0])).*)
        NumberOfLists : UINT; (*Number of lists.*)
    END_STRUCT;

    MpTrafficRuleListsParType : STRUCT
		ArrayAddress : {REDUND_UNREPLICABLE} UDINT; (*Names of the rule lists. Adress of the array of datatype MpTrafficListNamesParType.*)
        ArraySize : UINT; (*Size of the data array. (ArraySize = sizeof(array)/sizeof(array[0])).*)
        NumberOfLists : UINT; (*Number of lists.*)
    END_STRUCT;

    MpTrafficListNamesParType : STRUCT
        Name : STRING[80] ; (*Name of the list.*)
    END_STRUCT;

    MpTrafficManagerParamInfoType : STRUCT
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;

    MpTrafficRecipeControlInfoType : STRUCT
        Diag : MpTrafficDiagType; (*Diagnostic structure for the status ID.*)
    END_STRUCT;
END_TYPE

(*Enums*)

TYPE
    MpTrafficObjectTypeEnum :
        ( (*Object type.*)
        mpTRAFFIC_OBJECT_NONE := 0, (*Object not present*)
        mpTRAFFIC_OBJECT_STATION := 1, (*Station object*)
        mpTRAFFIC_OBJECT_WAYPOINT := 2, (*Waypoint object*)
        mpTRAFFIC_OBJECT_PATH := 3 (*Path object*)
        );
    MpTrafficManagerStateEnum :
        (
        mpTRAFFIC_MNG_DISABLED := 0, (*The function block is disabled. No information about the traffic manager is specified.*)
        mpTRAFFIC_MNG_READY := 1, (*The traffic manager is active.*)
        mpTRAFFIC_MNG_RECOVER_ASSIGNING := 2, (*The recovery procedure is active. Recovery points and recovery stations are assigned to the shuttles.*)
        mpTRAFFIC_MNG_RECOVER_TO_POINTS := 3, (*The recovery procedure is active. The shuttles are moving to the assigned recovery points.*)
        mpTRAFFIC_MNG_RECOVER_STATIONS := 4, (*The recovery procedure is active. The shuttles are moving to the recovery stations*)
        mpTRAFFIC_MNG_STOPPING := 5, (*All shuttle movements were stopped.*)
        mpTRAFFIC_MNG_ERROR := 6 (*An error has occurred, and the traffic manager cannot be operated.*)
        );
    MpTrafficSelectionModeEnum :
        (
        mpTRAFFIC_SH_ALL := 0, (*All shuttles on the assembly.*)
        mpTRAFFIC_SH_IN_ERROR := 1, (*All shuttles that are in the error state.*)
        mpTRAFFIC_SH_WAITING_EXCLUSIV := 2, (*All shuttles that must wait when traveling along the route due to exclusivity.*)
        mpTRAFFIC_SH_WAITING_CLOSED := 3, (*All shuttles that must wait while traveling along the route due to a closed traffic object.*)
        mpTRAFFIC_SH_WAITING_HALTED := 4, (*All shuttles that were paused while traveling along the route.*)
        mpTRAFFIC_SH_STATE_IDLE := 5, (*All shuttles that are not running a route.*)
        mpTRAFFIC_SH_STATE_MOTION := 6, (*All shuttles that are running a route.*)
        mpTRAFFIC_SH_STATE_OBSTACLE := 7, (*All shuttles that cannot continue moving due to an obstacle.*)
        mpTRAFFIC_SH_STATE_STOPPED := 8, (*All shuttles that were stopped.*)
        mpTRAFFIC_STATION_ALL := 10, (*All stations.*)
        mpTRAFFIC_STATION_OCCUPIED := 11, (*All stations that are occupied.*)
        mpTRAFFIC_STATION_INACTIVE := 12, (*All stations that are disabled.*)
        mpTRAFFIC_STATION_CLOSED := 13, (*All stations that are closed.*)
        mpTRAFFIC_WAYPOINT_ALL := 14, (*All waypoints.*)
        mpTRAFFIC_WAYPOINT_OCCUPIED := 15, (*All waypoints that are occupied.*)
        mpTRAFFIC_WAYPOINT_INACTIVE := 16, (*All waypoints that are disabled.*)
        mpTRAFFIC_WAYPOINT_CLOSED := 17, (*All waypoints that are closed.*)
        mpTRAFFIC_WAYPOINT_BRANCHES := 18, (*All waypoints that are branches. A branch is a waypoint from which it is possible to travel to more than one traffic object.*)
        mpTRAFFIC_PATH := 20, (*not yet available, output info path would be necessary*)
        mpTRAFFIC_RECIPE_ALL := 21, (*All recipes.*)
        mpTRAFFIC_RECIPE_ACTIVE := 22, (*All active recipes.*)
        mpTRAFFIC_RECIPE_ERROR := 23 (*All current errors that occurred during recipe processing.*)
        );
    MpTrafficShDetectionEnum :
        ( (*Shuttle detection event.*)
        mpTRAFFIC_SH_NONE := 0, (*No detection.*)
        mpTRAFFIC_SH_ASSIGNED := 1, (*Shuttle has been manually assigned to the station.*)
        mpTRAFFIC_SH_ARRIVAL := 2, (*Shuttle has arrived at the traffic object.*)
        mpTRAFFIC_SH_PASSTHROUGH := 3 (*Shuttle is passing through the traffic object.*)
        );
    MpTrafficShuttleStateEnum :
        (
        mpTRAFFIC_SH_STANDSTILL := 0, (*Shuttle is in standstill. No movement started, movement done or movement aborted.*)
        mpTRAFFIC_SH_MOVING := 1, (*Shuttle is moving from waypoint to waypoint to a station.*)
        mpTRAFFIC_SH_HALTING_CMD := 2, (*Shuttle is not moving because it was halted with a Halt command.*)
        mpTRAFFIC_SH_WAITING_CLOSE := 3, (*Shuttle is waiting, because the next traffic object is closed.*)
        mpTRAFFIC_SH_WAITING_EXCLUSIVITY := 4, (*Shuttle is waiting, because the next traffic object is through exclusivty not accessable.*)
        mpTRAFFIC_SH_WAITING_INACTIVE := 5, (*Shuttle is waiting, because the next traffic object is inactive and therefore not accessable.*)
        mpTRAFFIC_SH_ABORTING := 6, (*Shuttle is aborting the last movement.*)
        mpTRAFFIC_SH_ERROR := 7 (*Shuttle has an error.*)
        );
    MpTrafficWaypointOccupiedEnum :
        ( (*Waypoint is occupied by a shuttle. This is the reason.*)
        mpTRAFFIC_WYP_SH_FREE := 0, (*Waypoint is free.*)
        mpTRAFFIC_WYP_SH_WAIT_HALTED := 1, (*Waypoint is occupied with a shuttle, because it was halted externally.*)
        mpTRAFFIC_WYP_SH_WAIT_NEXT_CLOSE := 2, (*Waypoint is occupied with a shuttle, because the next traffic object is closed.*)
        mpTRAFFIC_WYP_SH_WAIT_NEXT_EXCL := 3, (*Waypoint is occupied with a shuttle, because the next traffic object is exclusive and occupied by another shuttle.*)
        mpTRAFFIC_WYP_SH_WAIT_NEXT_INACT := 4 (*Waypoint is occupied with a shuttle, because the next traffic object is exclusive.*)
        );
    MpTrafficWaypointStateEnum :
        ( (*Waypoint state*)
        mpTRAFFIC_WYP_ON_OPEN := 0, (*Waypoint is active and open.*)
        mpTRAFFIC_WYP_ON_CLOSED := 1, (*Waypoint is active and closed.*)
        mpTRAFFIC_WYP_ON_TICKETING := 2, (*Waypoint is active and in ticketing process.*)
        mpTRAFFIC_WYP_OFF_OPEN := 3, (*Waypoint is deactivated and open.*)
        mpTRAFFIC_WYP_OFF_CLOSED := 4, (*Waypoint is deactivated and closed.*)
        mpTRAFFIC_WYP_OFF_TICKETING := 5 (*Waypoint is deactivated and in ticketing process.*)
        );
    MpTrafficRouteStateEnum :
        ( (*Waypoint state*)
        mpTRAFFIC_ROUTE_CONTROL_DISABLED := 0, (*disabled*)
        mpTRAFFIC_ROUTE_CONTROL_ROUTING := 1, (*accessible, not occupied with shuttle, open*)
        mpTRAFFIC_ROUTE_CTRL_REROUTING := 2, (*accessible, occupied with shuttle and released, open*)
        mpTRAFFIC_ROUTE_CONTROL_HALTING := 3, (*accessible, not occupied with shuttle, counting for closing*)
        mpTRAFFIC_ROUTE_ERROR := 4 (*error state*)
        );
    MpTrafficStationStateEnum :
        ( (*Station state*)
        mpTRAFFIC_ST_ON_OPEN := 0, (*Station is active and open.*)
        mpTRAFFIC_ST_ON_CLOSED := 1, (*Station is active and closed.*)
        mpTRAFFIC_ST_ON_TICKETING := 2, (*Station is active and in ticketing process.*)
        mpTRAFFIC_ST_OFF_OPEN := 3, (*Station is deactivated and open.*)
        mpTRAFFIC_ST_OFF_CLOSED := 4, (*Station is deactivated and closed.*)
        mpTRAFFIC_ST_OFF_TICKETING := 5 (*Station is deactivated and in ticketing process.*)
        );
    MpTrafficStationOccupiedEnum :
        ( (*Station is occupied by a shuttle. This is the reason.*)
        mpTRAFFIC_STN_SH_FREE := 0, (*Station is free.*)
        mpTRAFFIC_STN_SH_ASSIGNED := 1, (*Shuttle has been manually assigned to the station.*)
        mpTRAFFIC_STN_SH_ARRIVAL := 2, (*Shuttle has arrived at the station from a route*)
        mpTRAFFIC_STN_SH_WAIT_HALTED := 3, (*Station is occupied with a shuttle, because it was halted externally.*)
        mpTRAFFIC_STN_SH_WAIT_NEXT_CLOSE := 4, (*Station is occupied with a shuttle, because the next traffic object is closed.*)
        mpTRAFFIC_STN_SH_WAIT_NEXT_EXCL := 5, (*Station is occupied with a shuttle, because the next traffic object is exclusive and occupied by another shuttle.*)
        mpTRAFFIC_STN_SH_WAIT_NEXT_INACT := 6 (*Station is occupied with a shuttle, because the next traffic object is inactive.*)
        );
    MpTrafficStationRecoveryModeEnum :
        ( (*Recovery mode of the station.*)
        mpTRAFFIC_RECOVER_DIRECT := 0, (*Shuttle will move from the recovery point directly to the station.*)
        mpTRAFFIC_RECOVER_SEQUENTIAL := 1 (*Shuttle will move along remaining recovery points to the station.*)
        );
    MpTrafficMotionSystemTypeEnum :
        ( (*Motion system controlled by the Traffic Manager.*)
        mpTRAFFIC_MOTION_SYS_ACP6D := 0 (*ACOPOS 6D system.*)
        );
    
END_TYPE