/* Automation Studio generated header file */
/* Do not edit ! */
/* MpTraffic 3.5.0 */

#ifndef _MPTRAFFIC_
#define _MPTRAFFIC_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpTraffic_VERSION
#define _MpTraffic_VERSION 3.5.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif

#ifdef _SG4
#include <McBase.h> 
#include <McAcp6D.h> 
#include <MpBase.h>
#endif
 
#ifdef _SG3
#include <McBase.h> 
#include <McAcp6D.h> 
#include <MpBase.h>
#endif
 
#ifdef _SGC
#include <McBase.h> 
#include <McAcp6D.h> 
#include <MpBase.h>
#endif

/* Datatypes and datatypes of function blocks */
typedef enum MpTrafficObjectTypeEnum
{	mpTRAFFIC_OBJECT_NONE = 0,
	mpTRAFFIC_OBJECT_STATION = 1,
	mpTRAFFIC_OBJECT_WAYPOINT = 2,
	mpTRAFFIC_OBJECT_PATH = 3
} MpTrafficObjectTypeEnum;

typedef enum MpTrafficManagerStateEnum
{	mpTRAFFIC_MNG_DISABLED = 0,
	mpTRAFFIC_MNG_READY = 1,
	mpTRAFFIC_MNG_RECOVER_ASSIGNING = 2,
	mpTRAFFIC_MNG_RECOVER_TO_POINTS = 3,
	mpTRAFFIC_MNG_RECOVER_STATIONS = 4,
	mpTRAFFIC_MNG_STOPPING = 5,
	mpTRAFFIC_MNG_ERROR = 6
} MpTrafficManagerStateEnum;

typedef enum MpTrafficSelectionModeEnum
{	mpTRAFFIC_SH_ALL = 0,
	mpTRAFFIC_SH_IN_ERROR = 1,
	mpTRAFFIC_SH_WAITING_EXCLUSIV = 2,
	mpTRAFFIC_SH_WAITING_CLOSED = 3,
	mpTRAFFIC_SH_WAITING_HALTED = 4,
	mpTRAFFIC_SH_STATE_IDLE = 5,
	mpTRAFFIC_SH_STATE_MOTION = 6,
	mpTRAFFIC_SH_STATE_OBSTACLE = 7,
	mpTRAFFIC_SH_STATE_STOPPED = 8,
	mpTRAFFIC_STATION_ALL = 10,
	mpTRAFFIC_STATION_OCCUPIED = 11,
	mpTRAFFIC_STATION_INACTIVE = 12,
	mpTRAFFIC_STATION_CLOSED = 13,
	mpTRAFFIC_WAYPOINT_ALL = 14,
	mpTRAFFIC_WAYPOINT_OCCUPIED = 15,
	mpTRAFFIC_WAYPOINT_INACTIVE = 16,
	mpTRAFFIC_WAYPOINT_CLOSED = 17,
	mpTRAFFIC_WAYPOINT_BRANCHES = 18,
	mpTRAFFIC_PATH = 20,
	mpTRAFFIC_RECIPE_ALL = 21,
	mpTRAFFIC_RECIPE_ACTIVE = 22,
	mpTRAFFIC_RECIPE_ERROR = 23
} MpTrafficSelectionModeEnum;

typedef enum MpTrafficShDetectionEnum
{	mpTRAFFIC_SH_NONE = 0,
	mpTRAFFIC_SH_ASSIGNED = 1,
	mpTRAFFIC_SH_ARRIVAL = 2,
	mpTRAFFIC_SH_PASSTHROUGH = 3
} MpTrafficShDetectionEnum;

typedef enum MpTrafficShuttleStateEnum
{	mpTRAFFIC_SH_STANDSTILL = 0,
	mpTRAFFIC_SH_MOVING = 1,
	mpTRAFFIC_SH_HALTING_CMD = 2,
	mpTRAFFIC_SH_WAITING_CLOSE = 3,
	mpTRAFFIC_SH_WAITING_EXCLUSIVITY = 4,
	mpTRAFFIC_SH_WAITING_INACTIVE = 5,
	mpTRAFFIC_SH_ABORTING = 6,
	mpTRAFFIC_SH_ERROR = 7
} MpTrafficShuttleStateEnum;

typedef enum MpTrafficWaypointOccupiedEnum
{	mpTRAFFIC_WYP_SH_FREE = 0,
	mpTRAFFIC_WYP_SH_WAIT_HALTED = 1,
	mpTRAFFIC_WYP_SH_WAIT_NEXT_CLOSE = 2,
	mpTRAFFIC_WYP_SH_WAIT_NEXT_EXCL = 3,
	mpTRAFFIC_WYP_SH_WAIT_NEXT_INACT = 4
} MpTrafficWaypointOccupiedEnum;

typedef enum MpTrafficWaypointStateEnum
{	mpTRAFFIC_WYP_ON_OPEN = 0,
	mpTRAFFIC_WYP_ON_CLOSED = 1,
	mpTRAFFIC_WYP_ON_TICKETING = 2,
	mpTRAFFIC_WYP_OFF_OPEN = 3,
	mpTRAFFIC_WYP_OFF_CLOSED = 4,
	mpTRAFFIC_WYP_OFF_TICKETING = 5
} MpTrafficWaypointStateEnum;

typedef enum MpTrafficRouteStateEnum
{	mpTRAFFIC_ROUTE_CONTROL_DISABLED = 0,
	mpTRAFFIC_ROUTE_CONTROL_ROUTING = 1,
	mpTRAFFIC_ROUTE_CTRL_REROUTING = 2,
	mpTRAFFIC_ROUTE_CONTROL_HALTING = 3,
	mpTRAFFIC_ROUTE_ERROR = 4
} MpTrafficRouteStateEnum;

typedef enum MpTrafficStationStateEnum
{	mpTRAFFIC_ST_ON_OPEN = 0,
	mpTRAFFIC_ST_ON_CLOSED = 1,
	mpTRAFFIC_ST_ON_TICKETING = 2,
	mpTRAFFIC_ST_OFF_OPEN = 3,
	mpTRAFFIC_ST_OFF_CLOSED = 4,
	mpTRAFFIC_ST_OFF_TICKETING = 5
} MpTrafficStationStateEnum;

typedef enum MpTrafficStationOccupiedEnum
{	mpTRAFFIC_STN_SH_FREE = 0,
	mpTRAFFIC_STN_SH_ASSIGNED = 1,
	mpTRAFFIC_STN_SH_ARRIVAL = 2,
	mpTRAFFIC_STN_SH_WAIT_HALTED = 3,
	mpTRAFFIC_STN_SH_WAIT_NEXT_CLOSE = 4,
	mpTRAFFIC_STN_SH_WAIT_NEXT_EXCL = 5,
	mpTRAFFIC_STN_SH_WAIT_NEXT_INACT = 6
} MpTrafficStationOccupiedEnum;

typedef enum MpTrafficStationRecoveryModeEnum
{	mpTRAFFIC_RECOVER_DIRECT = 0,
	mpTRAFFIC_RECOVER_SEQUENTIAL = 1
} MpTrafficStationRecoveryModeEnum;

typedef enum MpTrafficMotionSystemTypeEnum
{	mpTRAFFIC_MOTION_SYS_ACP6D = 0
} MpTrafficMotionSystemTypeEnum;

typedef enum MpTrafficErrorEnum
{	mpTRAFFIC_NO_ERROR = 0,
	mpTRAFFIC_ERR_ACTIVATION = -1064239103,
	mpTRAFFIC_ERR_MPLINK_NULL = -1064239102,
	mpTRAFFIC_ERR_MPLINK_INVALID = -1064239101,
	mpTRAFFIC_ERR_MPLINK_CHANGED = -1064239100,
	mpTRAFFIC_ERR_MPLINK_CORRUPT = -1064239099,
	mpTRAFFIC_ERR_MPLINK_IN_USE = -1064239098,
	mpTRAFFIC_ERR_OPENING_DATA = -1065746325,
	mpTRAFFIC_ERR_WRITING_DATA = -1065746324,
	mpTRAFFIC_ERR_MANAGER_CREATION = -1065746231,
	mpTRAFFIC_ERR_STATION_CREATION = -1065746230,
	mpTRAFFIC_ERR_WAYPOINT_CREATION = -1065746229,
	mpTRAFFIC_ERR_PATH_CREATION = -1065746228,
	mpTRAFFIC_ERR_CMD_ERROR = -1065745927,
	mpTRAFFIC_ERR_CMD_NOT_IMPL = -1065745922,
	mpTRAFFIC_ERR_FB_CMD_CONFLICT = -1065745917,
	mpTRAFFIC_ERR_FB_CMD_NOT_READY = -1065745916,
	mpTRAFFIC_ERR_MOTION_SYS_INVALID = -1065745892,
	mpTRAFFIC_ERR_REC_ARR_NULL = -1065745882,
	mpTRAFFIC_ERR_MAP_ARR_NULL = -1065745881,
	mpTRAFFIC_ERR_LISTS_ARR_NULL = -1065745880,
	mpTRAFFIC_ERR_EMPTY_OR_DUPL_NAME = -1065745877,
	mpTRAFFIC_ERR_LISTNAME_CONFLICT = -1065745876,
	mpTRAFFIC_ERR_REC_ARR_SIZE = -1065745872,
	mpTRAFFIC_ERR_MAP_ARR_SIZE = -1065745871,
	mpTRAFFIC_ERR_LISTS_ARR_SIZE = -1065745870,
	mpTRAFFIC_WRN_REC_ARR_READ = -2139487686,
	mpTRAFFIC_WRN_MAP_ARR_READ = -2139487685,
	mpTRAFFIC_WRN_READ_NOT_ALL_LISTS = -2139487684,
	mpTRAFFIC_ERR_OBJ_LST_NOT_EXIST = -1065745852,
	mpTRAFFIC_ERR_MAP_LST_NOT_EXIST = -1065745851,
	mpTRAFFIC_ERR_OBJ_NOT_IN_LIST = -1065745850,
	mpTRAFFIC_ERR_OBJ_NO_LIST = -1065745847,
	mpTRAFFIC_ERR_MAP_NO_LIST = -1065745846,
	mpTRAFFIC_ERR_CHANGE_PARAM_STATE = -1065745832,
	mpTRAFFIC_ERR_ASM_CFG_BASE_READ = -1065745431,
	mpTRAFFIC_ERR_ASM_CFG_BASE_TYPE = -1065745430,
	mpTRAFFIC_ERR_ASM_CFG_BASE_REF = -1065745429,
	mpTRAFFIC_ERR_OBJ_TYPE_READ = -1065745422,
	mpTRAFFIC_ERR_OBJ_NAME_READ = -1065745421,
	mpTRAFFIC_ERR_OBJ_TYPE_INVALID = -1065745420,
	mpTRAFFIC_ERR_CR_OBJ_EXISTS = -1065745382,
	mpTRAFFIC_ERR_REM_OBJ_NOT_EXIST = -1065745381,
	mpTRAFFIC_ERR_CR_OBJ_NO_NAME = -1065745380,
	mpTRAFFIC_ERR_REM_TYP_NOT_MATCH = -1065745379,
	mpTRAFFIC_ERR_ACCESS_STATION = -1065744431,
	mpTRAFFIC_ERR_ACCESS_WAYPOINT = -1065744430,
	mpTRAFFIC_ERR_OBJ_INVALID = -1065736430,
	mpTRAFFIC_ERR_OBJ_CHANGED = -1065736429,
	mpTRAFFIC_ERR_OBJ_INVALID_TYPE = -1065736428,
	mpTRAFFIC_WRN_PV_HANDLE = -2139468256,
	mpTRAFFIC_WRN_PV_CONNECT = -2139468255,
	mpTRAFFIC_WRN_PV_HANDLE_TYPE = -2139468254,
	mpTRAFFIC_ERR_ASM_CONNECT = -1065726422,
	mpTRAFFIC_ERR_ASM_BASE_TYPE = -1065726421,
	mpTRAFFIC_ERR_ASM_INVALID = -1065726417,
	mpTRAFFIC_ERR_CTRL_IF_MODIFIED = -1065725932,
	mpTRAFFIC_ERR_MOVE = -1065716382,
	mpTRAFFIC_ERR_NO_RTE_FOUND = -1065716372,
	mpTRAFFIC_ERR_RTE_CMD_INVALID = -1065716362,
	mpTRAFFIC_ERR_RTE_TARGET_INVALID = -1065716352,
	mpTRAFFIC_ERR_RTE_TARGET_TYPE = -1065716347,
	mpTRAFFIC_ERR_RTE_NO_SHUTTLE = -1065716342,
	mpTRAFFIC_WRN_MON_BUFFER_FULL = -2139458156,
	mpTRAFFIC_WRN_MON_BUFFER_EMPTY = -2139458155,
	mpTRAFFIC_ERR_CONFLICT_BAR_CMDS = -1065716322,
	mpTRAFFIC_ERR_CONFLICT_ACT_CMDS = -1065716321,
	mpTRAFFIC_ERR_STATION_MEMBER = -1065716317,
	mpTRAFFIC_ERR_WAYPOINT_MEMBER = -1065716316,
	mpTRAFFIC_ERR_PATH_MEMBER = -1065716315,
	mpTRAFFIC_ERR_SH_INVALID = -1065716312,
	mpTRAFFIC_ERR_MANAGER_INVALID = -1065716311,
	mpTRAFFIC_ERR_STATION_INVALID = -1065716310,
	mpTRAFFIC_ERR_WAYPOINT_INVALID = -1065716309,
	mpTRAFFIC_ERR_PATH_INVALID = -1065716308,
	mpTRAFFIC_ERR_SH_NULL = -1065716307,
	mpTRAFFIC_ERR_MANAGER_NULL = -1065716306,
	mpTRAFFIC_ERR_STATION_NULL = -1065716305,
	mpTRAFFIC_ERR_WAYPOINT_NULL = -1065716304,
	mpTRAFFIC_ERR_PATH_NULL = -1065716303,
	mpTRAFFIC_ERR_CMD_RTE_ACT = -1065716302,
	mpTRAFFIC_ERR_SH_CONTROL_INVALID = -1065716301,
	mpTRAFFIC_ERR_ASSIGN_OBJ_TYPE = -1065716287,
	mpTRAFFIC_ERR_RECOVER_POINTS = -1065716212,
	mpTRAFFIC_ERR_RECOVER_SH = -1065716202,
	mpTRAFFIC_ERR_RECOVER_STATE = -1065716192,
	mpTRAFFIC_ERR_RECIPE_STEP = -1065716132,
	mpTRAFFIC_ERR_RECIPE_TRANSITION = -1065716131,
	mpTRAFFIC_ERR_RECIPE_BRANCH = -1065716130,
	mpTRAFFIC_ERR_RECIPE_STATION_REF = -1065716129,
	mpTRAFFIC_ERR_RECIPE_USER_DEF = -1065716128,
	mpTRAFFIC_ERR_RECIPE_NOT_EXIST = -1065716127,
	mpTRAFFIC_ERR_RECIPE_INVALID = -1065716126,
	mpTRAFFIC_ERR_RECIPE_PRODUCT = -1065716125,
	mpTRAFFIC_ERR_RECIPE_ALL_EXIST = -1065716124,
	mpTRAFFIC_ERR_RECIPE_ALL_INVALID = -1065716123,
	mpTRAFFIC_ERR_RECIPE_ALL_PRODUCT = -1065716122,
	mpTRAFFIC_ERR_RECIPE_CFG_STATE = -1065716112
} MpTrafficErrorEnum;

typedef struct MpTrafficPositionType
{	double X;
	double Y;
} MpTrafficPositionType;

typedef struct MpTrafficInternalManagerIfType
{	plcdword vtable;
} MpTrafficInternalManagerIfType;

typedef struct MpTrafficManagerType
{	struct MpTrafficInternalManagerIfType* controlif;
	struct McInternalMappLinkType mappLinkInternal;
} MpTrafficManagerType;

typedef struct MpTrafficInternalStationIfType
{	plcdword vtable;
} MpTrafficInternalStationIfType;

typedef struct MpTrafficStationType
{	struct MpTrafficInternalStationIfType* controlif;
} MpTrafficStationType;

typedef struct MpTrafficInternalWaypointIfType
{	plcdword vtable;
} MpTrafficInternalWaypointIfType;

typedef struct MpTrafficWaypointType
{	struct MpTrafficInternalWaypointIfType* controlif;
} MpTrafficWaypointType;

typedef struct MpTrafficInternalPathIfType
{	plcdword vtable;
} MpTrafficInternalPathIfType;

typedef struct MpTrafficPathType
{	struct MpTrafficInternalPathIfType* controlif;
} MpTrafficPathType;

typedef struct MpTrafficObjectInfoType
{	enum MpTrafficObjectTypeEnum Type;
	plcstring Name[33];
	struct MpTrafficStationType Station;
	struct MpTrafficWaypointType Waypoint;
	struct MpTrafficPathType Path;
} MpTrafficObjectInfoType;

typedef struct MpTrafficShuttleInfoType
{	unsigned short ShuttleID;
	struct Mc6DShuttleType Shuttle6D;
} MpTrafficShuttleInfoType;

typedef struct MpTrafficStationInfoType
{	plcstring Name[81];
	struct MpTrafficStationType Station;
} MpTrafficStationInfoType;

typedef struct MpTrafficWaypointInfoType
{	plcstring Name[81];
	struct MpTrafficWaypointType Waypoint;
} MpTrafficWaypointInfoType;

typedef struct MpTrafficPathInfoType
{	plcstring Name[81];
	struct MpTrafficPathType Path;
} MpTrafficPathInfoType;

typedef struct MpTrafficObjectType
{	enum MpTrafficObjectTypeEnum Type;
	struct MpTrafficStationInfoType Station;
	struct MpTrafficWaypointInfoType Waypoint;
	struct MpTrafficPathInfoType Path;
} MpTrafficObjectType;

typedef struct MpTrafficStatusIDType
{	enum MpTrafficErrorEnum ID;
	enum MpComSeveritiesEnum Severity;
	unsigned short Code;
} MpTrafficStatusIDType;

typedef struct MpTrafficDiagType
{	struct MpTrafficStatusIDType StatusID;
} MpTrafficDiagType;

typedef struct MpTrafficControlInfoType
{	struct MpTrafficDiagType Diag;
} MpTrafficControlInfoType;

typedef struct MpTrafficMonRecipeErrorInfoType
{	struct MpTrafficStationInfoType Station;
	struct MpTrafficShuttleInfoType Shuttle;
	signed long StatusID;
} MpTrafficMonRecipeErrorInfoType;

typedef struct MpTrafficMonRecipeInfoType
{	plcstring Name[81];
	plcstring ProductLabel[81];
	plcbit IsActive;
	unsigned short NumberOfProcessSteps;
	struct MpTrafficMonRecipeErrorInfoType RecipeError;
} MpTrafficMonRecipeInfoType;

typedef struct MpTrafficNetShuttleInfoType
{	unsigned short ShuttleCount;
	unsigned short ShuttleErrorCount;
	unsigned short ShuttleWaitingExclusivCount;
	unsigned short ShuttleWaitingClosedCount;
	unsigned short ShuttleWaitingHaltedCount;
	unsigned short ShuttleStateIdleCount;
	unsigned short ShuttleStateMotionCount;
	unsigned short ShuttleStateObstacleCount;
	unsigned short ShuttleStateStoppedCount;
	unsigned short ShuttleDeadlockCount;
} MpTrafficNetShuttleInfoType;

typedef struct MpTrafficNetInfoType
{	unsigned short StationsCount;
	unsigned short StationsOccupiedCount;
	unsigned short StationsInactiveCount;
	unsigned short StationsClosedCount;
	unsigned short WaypointsCount;
	unsigned short WaypointsOccupiedCount;
	unsigned short WaypointsInactiveCount;
	unsigned short WaypointsClosedCount;
	unsigned short PathsCount;
	unsigned short RecoveryPointsCount;
	unsigned short BranchesCount;
} MpTrafficNetInfoType;

typedef struct MpTrafficNetRecipeInfoType
{	unsigned short RecipeCount;
	unsigned short RecipeActiveCount;
	unsigned short RecipeErrorCount;
} MpTrafficNetRecipeInfoType;

typedef struct MpTrafficMonitorInfoType
{	struct MpTrafficNetShuttleInfoType ShuttleInfo;
	struct MpTrafficNetInfoType TrafficStateInfo;
	struct MpTrafficNetRecipeInfoType RecipeInfo;
	struct MpTrafficDiagType Diag;
} MpTrafficMonitorInfoType;

typedef struct MpTrafficStationShInfoType
{	struct Mc6DShuttleType Shuttle6D;
	unsigned short ShuttleID;
	unsigned short Index;
	plcbit Releasing;
	enum MpTrafficShuttleStateEnum State;
} MpTrafficStationShInfoType;

typedef struct MpTrafficTicketingType
{	plcbit Active;
	unsigned short NumberOfTickets;
	unsigned short RemainingTickets;
	unsigned short GrantedTickets;
} MpTrafficTicketingType;

typedef struct MpTrafficStationCtrlInfoType
{	plcstring Name[81];
	struct MpTrafficPositionType Position;
	plcbit Activated;
	plcbit Deactivated;
	plcbit Open;
	plcbit Closed;
	struct MpTrafficTicketingType Ticketing;
	plcbit Occupied;
	unsigned short NumOccupyingShuttles;
	struct MpTrafficShuttleInfoType LastArrivedShuttle;
	struct MpTrafficDiagType Diag;
} MpTrafficStationCtrlInfoType;

typedef struct MpTrafficStationMonInfoType
{	plcstring Name[81];
	struct MpTrafficPositionType Position;
	struct MpTrafficDiagType Diag;
} MpTrafficStationMonInfoType;

typedef struct MpTrafficWaypointCtrlInfoType
{	plcstring Name[81];
	struct MpTrafficPositionType Position;
	plcbit Activated;
	plcbit Deactivated;
	plcbit Open;
	plcbit Closed;
	struct MpTrafficTicketingType Ticketing;
	plcbit Occupied;
	enum MpTrafficWaypointOccupiedEnum OccupiedReason;
	struct MpTrafficShuttleInfoType Shuttle;
	struct MpTrafficDiagType Diag;
} MpTrafficWaypointCtrlInfoType;

typedef struct MpTrafficShRoutePositionType
{	struct MpTrafficStationInfoType FromStation;
	struct MpTrafficStationInfoType ToStation;
	struct MpTrafficObjectInfoType CurrentObject;
	struct MpTrafficObjectInfoType PreviousObject;
	struct MpTrafficObjectInfoType NextObject;
	unsigned long PassedObjectsCount;
} MpTrafficShRoutePositionType;

typedef struct MpTrafficShuttleControlInfoType
{	unsigned short ShuttleID;
	struct MpTrafficShRoutePositionType RoutePosition;
	struct MpTrafficStationInfoType AssignedStation;
	struct MpTrafficStationInfoType AssignedRecoveryStation;
	struct MpTrafficDiagType Diag;
} MpTrafficShuttleControlInfoType;

typedef struct MpTrafficWaypointMonInfoType
{	plcstring Name[81];
	struct MpTrafficPositionType Position;
	struct MpTrafficDiagType Diag;
} MpTrafficWaypointMonInfoType;

typedef struct MpTrafficStationParamInfoType
{	struct MpTrafficDiagType Diag;
} MpTrafficStationParamInfoType;

typedef struct MpTrafficObjectCreatorInfoType
{	struct MpTrafficObjectInfoType LastAddedObject;
	struct MpTrafficDiagType Diag;
} MpTrafficObjectCreatorInfoType;

typedef struct MpTrafficRecoveryPointsType
{	unsigned long ArrayAddress;
	unsigned short ArraySize;
	unsigned short NumberOfRecoveryPoints;
} MpTrafficRecoveryPointsType;

typedef struct MpTrafficRecoveryType
{	enum MpTrafficStationRecoveryModeEnum RecoveryMode;
	plcbit StationIsRecoveryPoint;
	struct MpTrafficRecoveryPointsType RecoveryPoints;
} MpTrafficRecoveryType;

typedef struct MpTrafficRecoveryPointType
{	struct MpTrafficPositionType Position;
} MpTrafficRecoveryPointType;

typedef struct MpTrafficObjMappingType
{	unsigned long ArrayAddress;
	unsigned short ArraySize;
	unsigned short NumberOfObjects;
} MpTrafficObjMappingType;

typedef struct MpTrafficMappingType
{	plcstring MappingListName[81];
	struct MpTrafficObjMappingType To;
} MpTrafficMappingType;

typedef struct MpTrafficObjectNameType
{	plcstring Name[81];
} MpTrafficObjectNameType;

typedef struct MpTrafficWaypointParamInfoType
{	struct MpTrafficDiagType Diag;
} MpTrafficWaypointParamInfoType;

typedef struct MpTrafficConfigHandlerInfoType
{	struct MpTrafficDiagType Diag;
} MpTrafficConfigHandlerInfoType;

typedef struct MpTrafficDetectedShInfoType
{	enum MpTrafficShDetectionEnum Event;
	struct MpTrafficShuttleInfoType Shuttle;
} MpTrafficDetectedShInfoType;

typedef struct MpTrafficMotionSysAcp6DType
{	plcstring AssemblyName[81];
} MpTrafficMotionSysAcp6DType;

typedef struct MpTrafficMotionSystemParType
{	enum MpTrafficMotionSystemTypeEnum Type;
	struct MpTrafficMotionSysAcp6DType Acopos6D;
} MpTrafficMotionSystemParType;

typedef struct MpTrafficObjectListsParType
{	unsigned long ArrayAddress;
	unsigned short ArraySize;
	unsigned short NumberOfLists;
} MpTrafficObjectListsParType;

typedef struct MpTrafficMappingListsParType
{	unsigned long ArrayAddress;
	unsigned short ArraySize;
	unsigned short NumberOfLists;
} MpTrafficMappingListsParType;

typedef struct MpTrafficRuleListsParType
{	unsigned long ArrayAddress;
	unsigned short ArraySize;
	unsigned short NumberOfLists;
} MpTrafficRuleListsParType;

typedef struct MpTrafficListNamesParType
{	plcstring Name[81];
} MpTrafficListNamesParType;

typedef struct MpTrafficManagerParamInfoType
{	struct MpTrafficDiagType Diag;
} MpTrafficManagerParamInfoType;

typedef struct MpTrafficRecipeControlInfoType
{	struct MpTrafficDiagType Diag;
} MpTrafficRecipeControlInfoType;

typedef struct MpTrafficControl
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	float Velocity;
	float Acceleration;
	plcstring (*Recipe);
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	enum MpTrafficManagerStateEnum State;
	struct MpTrafficControlInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Recover;
	plcbit ActivateRecipe;
	plcbit DeactivateRecipe;
	plcbit Halt;
	plcbit Resume;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit RecoverBuffered;
	plcbit RecoverAborted;
	plcbit RecoverDone;
	plcbit ActivateRecipeDone;
	plcbit DeactivateRecipeDone;
	plcbit HaltBuffered;
	plcbit HaltAborted;
	plcbit HaltDone;
	plcbit ResumeBuffered;
	plcbit ResumeAborted;
	plcbit ResumeDone;
	plcbit StopBuffered;
	plcbit StopDone;
} MpTrafficControl_typ;

typedef struct MpTrafficMonitor
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	enum MpTrafficSelectionModeEnum SelectionMode;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct MpTrafficShuttleInfoType Shuttle;
	struct MpTrafficObjectType TrafficObject;
	struct MpTrafficMonRecipeInfoType Recipe;
	struct MpTrafficMonitorInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit GetSelectedObjects;
	plcbit GetNextObject;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit SelectedObjectsValid;
} MpTrafficMonitor_typ;

typedef struct MpTrafficShuttleControl
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	struct Mc6DShuttleType* Shuttle;
	float Velocity;
	float Acceleration;
	struct MpTrafficStationType* To;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	enum MpTrafficShuttleStateEnum State;
	struct MpTrafficShuttleControlInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Move;
	plcbit AssignToStation;
	plcbit AssignToRecoveryStation;
	plcbit Halt;
	plcbit Resume;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit MoveBuffered;
	plcbit MoveAborted;
	plcbit MoveDone;
	plcbit AssignDone;
	plcbit HaltBuffered;
	plcbit HaltAborted;
	plcbit HaltDone;
	plcbit ResumeBuffered;
	plcbit ResumeAborted;
	plcbit ResumeDone;
	plcbit StopBuffered;
	plcbit StopDone;
} MpTrafficShuttleControl_typ;

typedef struct MpTrafficStationControl
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	struct MpTrafficStationType* Station;
	float ExitVelocity;
	float ExitAcceleration;
	struct MpTrafficStationType* To;
	signed long Tickets;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTrafficStationShInfoType SelectedShuttle;
	enum MpTrafficStationStateEnum State;
	struct MpTrafficStationCtrlInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit SelectNextShuttle;
	plcbit Release;
	plcbit AddTickets;
	plcbit Close;
	plcbit Open;
	plcbit Deactivate;
	plcbit Activate;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit ReleaseBuffered;
	plcbit ReleaseAborted;
	plcbit ReleaseDone;
} MpTrafficStationControl_typ;

typedef struct MpTrafficStationMonitor
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	struct MpTrafficStationType* Station;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned short RemainingShuttleCount;
	struct MpTrafficDetectedShInfoType DetectedShuttle;
	struct MpTrafficStationMonInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit GetNextShuttle;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpTrafficStationMonitor_typ;

typedef struct MpTrafficWaypointControl
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	struct MpTrafficWaypointType* Waypoint;
	signed long Tickets;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	enum MpTrafficWaypointStateEnum State;
	struct MpTrafficWaypointCtrlInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit AddTickets;
	plcbit Close;
	plcbit Open;
	plcbit Deactivate;
	plcbit Activate;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MpTrafficWaypointControl_typ;

typedef struct MpTrafficWaypointMonitor
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	struct MpTrafficWaypointType* Waypoint;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned short RemainingShuttleCount;
	struct MpTrafficDetectedShInfoType DetectedShuttle;
	struct MpTrafficWaypointMonInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit GetNextShuttle;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpTrafficWaypointMonitor_typ;

typedef struct MpTrafficConfigHandler
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTrafficConfigHandlerInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit LoadToParam;
	plcbit SaveFromParam;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpTrafficConfigHandler_typ;

typedef struct MpTrafficStationParam
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	struct MpTrafficStationType* Station;
	struct MpTrafficPositionType* Position;
	struct MpTrafficRecoveryType* Recovery;
	struct MpTrafficMappingType* Mapping;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTrafficStationParamInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Read;
	plcbit Write;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpTrafficStationParam_typ;

typedef struct MpTrafficWaypointParam
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	struct MpTrafficWaypointType* Waypoint;
	struct MpTrafficPositionType* Position;
	struct MpTrafficMappingType* Mapping;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTrafficWaypointParamInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Read;
	plcbit Write;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpTrafficWaypointParam_typ;

typedef struct MpTrafficObjectCreator
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	plcstring ObjectName[81];
	enum MpTrafficObjectTypeEnum ObjectType;
	plcstring ObjectListName[81];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTrafficObjectCreatorInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Add;
	plcbit Remove;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpTrafficObjectCreator_typ;

typedef struct MpTrafficManagerParam
{
	/* VAR_INPUT (analog) */
	struct MpTrafficManagerType* MpLink;
	struct MpTrafficMotionSystemParType* MotionSystem;
	struct MpTrafficObjectListsParType* TrafficObjects;
	struct MpTrafficMappingListsParType* Mapping;
	struct MpTrafficRuleListsParType* Rules;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTrafficManagerParamInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Read;
	plcbit Write;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpTrafficManagerParam_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpTrafficControl(struct MpTrafficControl* inst);
_BUR_PUBLIC void MpTrafficMonitor(struct MpTrafficMonitor* inst);
_BUR_PUBLIC void MpTrafficShuttleControl(struct MpTrafficShuttleControl* inst);
_BUR_PUBLIC void MpTrafficStationControl(struct MpTrafficStationControl* inst);
_BUR_PUBLIC void MpTrafficStationMonitor(struct MpTrafficStationMonitor* inst);
_BUR_PUBLIC void MpTrafficWaypointControl(struct MpTrafficWaypointControl* inst);
_BUR_PUBLIC void MpTrafficWaypointMonitor(struct MpTrafficWaypointMonitor* inst);
_BUR_PUBLIC void MpTrafficConfigHandler(struct MpTrafficConfigHandler* inst);
_BUR_PUBLIC void MpTrafficStationParam(struct MpTrafficStationParam* inst);
_BUR_PUBLIC void MpTrafficWaypointParam(struct MpTrafficWaypointParam* inst);
_BUR_PUBLIC void MpTrafficObjectCreator(struct MpTrafficObjectCreator* inst);
_BUR_PUBLIC void MpTrafficManagerParam(struct MpTrafficManagerParam* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPTRAFFIC_ */

