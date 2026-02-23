/* Automation Studio generated header file */
/* Do not edit ! */
/* MpPick 6.5.1 */

#ifndef _MPPICK_
#define _MPPICK_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpPick_VERSION
#define _MpPick_VERSION 6.5.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif

#ifdef _SG4
#include <McBase.h> 
#include <McTrkPath.h> 
#include <MpBase.h>
#endif
 
#ifdef _SG3
#include <McBase.h> 
#include <McTrkPath.h> 
#include <MpBase.h>
#endif
 
#ifdef _SGC
#include <McBase.h> 
#include <McTrkPath.h> 
#include <MpBase.h>
#endif

/* Datatypes and datatypes of function blocks */
typedef enum MpPickCoreComponentStateEnum
{	mcPICK_CORE_STARTUP,
	mcPICK_CORE_DISABLED,
	mcPICK_CORE_STANDBY,
	mcPICK_CORE_STARTED,
	mcPICK_CORE_ERRORSTOP,
	mcPICK_CORE_INVALID_CONFIG
} MpPickCoreComponentStateEnum;

typedef enum MpPickCoreProcessStateEnum
{	mpPICK_PROCSTAT_NOT_RUNNING,
	mpPICK_PROCSTAT_STARTING,
	mpPICK_PROCSTAT_WAIT_OBJ,
	mpPICK_PROCSTAT_WAIT_PLACEH,
	mpPICK_PROCSTAT_WAIT_OBJ_PLACEH,
	mpPICK_PROCSTAT_PICK_AND_PLACE,
	mpPICK_PROCSTAT_STOPPING
} MpPickCoreProcessStateEnum;

typedef enum MpPickCoreMovementStateEnum
{	mpPICK_MOVESTAT_NONE,
	mpPICK_MOVESTAT_TO_PICK,
	mpPICK_MOVESTAT_PICK_IN_SYNC,
	mpPICK_MOVESTAT_TO_PLACE,
	mpPICK_MOVESTAT_PLACE_IN_SYNC,
	mpPICK_MOVESTAT_TO_WAIT_POS,
	mpPICK_MOVESTAT_ON_WAIT_POS
} MpPickCoreMovementStateEnum;

typedef enum MpPickErrorEnum
{	mcPICK_NO_ERROR = 0,
	mcPICK_ERR_ACTIVATION = -1064239103,
	mcPICK_ERR_MPLINK_NULL = -1064239102,
	mcPICK_ERR_MPLINK_INVALID = -1064239101,
	mcPICK_ERR_MPLINK_CHANGED = -1064239100,
	mcPICK_ERR_MPLINK_CORRUPT = -1064239099,
	mcPICK_ERR_MPLINK_IN_USE = -1064239098,
	mcPICK_ERR_COMMAND_FAILED = -1066334208,
	mcPICK_ERR_PROCESS_FAILED = -1066334203
} MpPickErrorEnum;

typedef enum MpPickObjPosAddInfoEnum
{	mpPICK_INFO_SINGLEITEM,
	mpPICK_INFO_SINGLEITEM_PLACEH,
	mpPICK_INFO_CONTAINER_EMPTY,
	mpPICK_INFO_CONTAINER_FULL,
	mpPICK_INFO_CONTAINER_PART_FULL,
	mpPICK_INFO_CONTAINER_PLACEH,
	mpPICK_INFO_CONTAINED_OBJECT,
	mpPICK_INFO_CONTAINED_PLACEH
} MpPickObjPosAddInfoEnum;

typedef enum MpPickRegCreateObjModeEnum
{	mpPICK_CREATE_SINGLEITEM,
	mpPICK_CREATE_CONTAINER_FULL,
	mpPICK_CREATE_CONTAINER_EMPTY,
	mpPICK_CREATE_CONTAINER_PLACEH,
	mpPICK_CREATE_SINGLEITEM_PLACEH
} MpPickRegCreateObjModeEnum;

typedef enum MpPickRegDeleteObjModeEnum
{	mpPICK_DEL_ALL,
	mpPICK_DEL_ALL_OBJECTS_OF_TYPE,
	mpPICK_DEL_ALL_PLACEH_OF_TYPE,
	mpPICK_DEL_ALL_SINGLEITEMS,
	mpPICK_DEL_ALL_SINGLEITEM_PLACEH,
	mpPICK_DEL_ALL_CONTAINERS,
	mpPICK_DEL_ALL_CONTAINER_PLACEH,
	mpPICK_DEL_ALL_OBJECTS,
	mpPICK_DEL_ALL_PLACEHOLDERS,
	mpPICK_DEL_ALL_FULL_CONTAINERS,
	mpPICK_DEL_ALL_EMPTY_CONTAINERS,
	mpPICK_DEL_SPECIFIC_ITEM,
	mpPICK_DEL_CONTAINER_CONTENT
} MpPickRegDeleteObjModeEnum;

typedef enum MpPickRegGetObjModeEnum
{	mpPICK_GET_ALL,
	mpPICK_GET_ALL_OBJECTS_OF_TYPE,
	mpPICK_GET_ALL_PLACEH_OF_TYPE,
	mpPICK_GET_ALL_SINGLEITEMS,
	mpPICK_GET_ALL_SINGLEITEM_PLACEH,
	mpPICK_GET_ALL_CONTAINERS,
	mpPICK_GET_ALL_CONTAINER_PLACEH,
	mpPICK_GET_ALL_OBJECTS,
	mpPICK_GET_ALL_PLACEHOLDERS,
	mpPICK_GET_ALL_FULL_CONTAINERS,
	mpPICK_GET_ALL_EMPTY_CONTAINERS,
	mpPICK_GET_SPECIFIC_ITEM,
	mpPICK_GET_CONTAINER_CONTENT
} MpPickRegGetObjModeEnum;

typedef enum MpPickRegisterComponentStateEnum
{	mcPICK_REGISTER_STARTUP,
	mcPICK_REGISTER_DISABLED,
	mcPICK_REGISTER_READY,
	mcPICK_REGISTER_ERRORSTOP,
	mcPICK_REGISTER_INVALID_CONFIG
} MpPickRegisterComponentStateEnum;

typedef enum MpPCGripEnum
{	mcPCG_STD = 0
} MpPCGripEnum;

typedef enum MpPCGripStdToolEnum
{	mcPCGST_AX_GRP = 0
} MpPCGripStdToolEnum;

typedef enum MpPCGripStdBxEnum
{	mcPCGSB_BASIC = 0
} MpPCGripStdBxEnum;

typedef enum MpPCJobMoveEnum
{	mcPCJM_BASIC = 0
} MpPCJobMoveEnum;

typedef enum MpPCJobLimEnum
{	mcPCJL_NOT_USE = 0,
	mcPCJL_BASIC = 1
} MpPCJobLimEnum;

typedef enum MpPCOMAJProcEnum
{	mcPCOMAJP_FIFO = 0,
	mcPCOMAJP_INFEED_OUTFEED = 1
} MpPCOMAJProcEnum;

typedef enum MpPCOMAJPInFirstRegisteredEnum
{	mcPCOMAJProcIPFR_NOT_USE = 0,
	mcPCOMAJProcIPFR_USE = 1
} MpPCOMAJPInFirstRegisteredEnum;

typedef enum MpPCOMAJPInFirstLeavingWsEnum
{	mcPCOMAJProcIPFLW_NOT_USE = 0,
	mcPCOMAJProcIPFLW_USE = 1
} MpPCOMAJPInFirstLeavingWsEnum;

typedef enum MpPCOMAJPInSDEnum
{	mcPCOMAJProcIPSD_NOT_USE = 0,
	mcPCOMAJProcIPSD_TO_FIX_PT = 1
} MpPCOMAJPInSDEnum;

typedef enum MpPCOMAJPOutFirstRegisteredEnum
{	mcPCOMAJProcOPFR_NOT_USE = 0,
	mcPCOMAJProcOPFR_USE = 1
} MpPCOMAJPOutFirstRegisteredEnum;

typedef enum MpPCOMAJPOutFirstLeavingWsEnum
{	mcPCOMAJProcOPFLW_NOT_USE = 0,
	mcPCOMAJProcOPFLW_USE = 1
} MpPCOMAJPOutFirstLeavingWsEnum;

typedef enum MpPCOMAJPOutSDEnum
{	mcPCOMAJProcOPSD_NOT_USE = 0,
	mcPCOMAJProcOPSD_TO_FIX_PT = 1
} MpPCOMAJPOutSDEnum;

typedef enum MpPCOMAJExeBxEnum
{	mcPCOMAJJEB_WAIT_PLH = 0,
	mcPCOMAJJEB_ALW_PICK = 1
} MpPCOMAJExeBxEnum;

typedef enum MpPCOpModIdleBxEnum
{	mcPCOMIB_FIX_WAIT_POS = 0
} MpPCOpModIdleBxEnum;

typedef enum MpPCOMIBSFWPEnum
{	mcPCOMIBSFWP_STD = 0
} MpPCOMIBSFWPEnum;

typedef enum MpPRTypEnum
{	mcPRT_STAT_POS = 0,
	mcPRT_LIN_CNVR = 1
} MpPRTypEnum;

typedef enum MpPRLinMotSrcEnum
{	mcPRLinMotSrc_POS_PROC_VAR = 0,
	mcPRLinMotSrc_AX = 1
} MpPRLinMotSrcEnum;

typedef enum MpPRLinMotSrcPosPVMoveLimEnum
{	mcPRLinMotSrcPPVML_INT = 0
} MpPRLinMotSrcPosPVMoveLimEnum;

typedef enum MpPRTLCMSPPVMLIVelEnum
{	mcPRLinMotSrcPPVMLIV_BASIC = 0
} MpPRTLCMSPPVMLIVelEnum;

typedef enum MpPRTLCMSPPVMLIAccEnum
{	mcPRLinMotSrcPPVMLIA_BASIC = 0
} MpPRTLCMSPPVMLIAccEnum;

typedef enum MpPRTLCMSPPVMLIDirEnum
{	mcPRLinMotSrcPPVMLID_BIDIR = 0,
	mcPRLinMotSrcPPVMLID_POS_ONLY = 1
} MpPRTLCMSPPVMLIDirEnum;

typedef enum MpPRLinMotSrcPosPVPrepEnum
{	mcPRLinMotSrcPPVP_NO_PREP = 0,
	mcPRLinMotSrcPPVP_LIN_REG = 1
} MpPRLinMotSrcPosPVPrepEnum;

typedef enum MpPRLinMotSrcAxAxUseEnum
{	mcPRLinMotSrcAAU_ACT = 0,
	mcPRLinMotSrcAAU_PASS = 1
} MpPRLinMotSrcAxAxUseEnum;

typedef enum MpPRLinMotSrcAxisCCEnum
{	mcPRLinMotSrcAxisCC_NOT_USE = 0,
	mcPRLinMotSrcAxisCC_BASIC = 1
} MpPRLinMotSrcAxisCCEnum;

typedef enum MpPRLinMotSrcAxMoveLimEnum
{	mcPRLinMotSrcAML_USE_AX_LIM = 0,
	mcPRLinMotSrcAML_INT = 1
} MpPRLinMotSrcAxMoveLimEnum;

typedef enum MpPRTLCMSAMLUALDirEnum
{	mcPRLinMotSrcAMLUALD_BIDIR = 0,
	mcPRLinMotSrcAMLUALD_POS_ONLY = 1
} MpPRTLCMSAMLUALDirEnum;

typedef enum MpPRTLCMSAMLIVelEnum
{	mcPRLinMotSrcAMLIV_BASIC = 0
} MpPRTLCMSAMLIVelEnum;

typedef enum MpPRTLCMSAMLIAccEnum
{	mcPRLinMotSrcAMLIA_BASIC = 0
} MpPRTLCMSAMLIAccEnum;

typedef enum MpPRTLCMSAMLIDirEnum
{	mcPRLinMotSrcAMLID_BIDIR = 0,
	mcPRLinMotSrcAMLID_POS_ONLY = 1
} MpPRTLCMSAMLIDirEnum;

typedef enum MpPRLinMotSrcAxPrepEnum
{	mcPRLinMotSrcAP_NO_PREP = 0,
	mcPRLinMotSrcAP_LIN_REG = 1
} MpPRLinMotSrcAxPrepEnum;

typedef enum MpPRSVEnum
{	mcPRSSVO_USE = 0,
	mcPRSSVO_NOT_USE = 1
} MpPRSVEnum;

typedef enum MpPRSVUseNameEnum
{	mcPRSSVOUN_VIS = 0,
	mcPRSSVOUN_INVIS = 1
} MpPRSVUseNameEnum;

typedef enum MpPRSVUseFrmEnum
{	mcPRSSVOUF_VIS = 0,
	mcPRSSVOUF_INVIS = 1
} MpPRSVUseFrmEnum;

typedef enum MpPRSVUseDimEnum
{	mcPRSSVOUD_VIS = 0,
	mcPRSSVOUD_INVIS = 1
} MpPRSVUseDimEnum;

typedef enum MpPRSVUseVREnum
{	mcPRSSVOUVR_NOT_USE = 0,
	mcPRSSVOUVR_CUBE = 1,
	mcPRSSVOUVR_CNVR_BELT = 2
} MpPRSVUseVREnum;

typedef enum MpPRSVUseContEnum
{	mcPRSSVOUC_NOT_USE = 0,
	mcPRSSVOUC_VIS = 1
} MpPRSVUseContEnum;

typedef enum MpPRSVTmplVREnum
{	mcPRSSVOUCVTVR_NOT_USE = 0,
	mcPRSSVOUCVTVR_FRM = 1,
	mcPRSSVOUCVTVR_SHP_2D = 2,
	mcPRSSVOUCVTVR_SHP_3D = 3,
	mcPRSSVOUCVTVR_MESH_3D = 4
} MpPRSVTmplVREnum;

typedef enum MpPRSVCont2DShpTypEnum
{	mcPRSSVOUCVTVRS2ST_CIR = 0,
	mcPRSSVOUCVTVRS2ST_RECT = 1,
	mcPRSSVOUCVTVRS2ST_TRPZ = 2
} MpPRSVCont2DShpTypEnum;

typedef enum MpPRSVCont2DShpTypCirStyleEnum
{	mcPRSSVOUCVTVRS2STCS_FILL = 0,
	mcPRSSVOUCVTVRS2STCS_BORDER = 1
} MpPRSVCont2DShpTypCirStyleEnum;

typedef enum MpPRSVCont2DShpTypRectStyleEnum
{	mcPRSSVOUCVTVRS2STRS_FILL = 0,
	mcPRSSVOUCVTVRS2STRS_BORDER = 1
} MpPRSVCont2DShpTypRectStyleEnum;

typedef enum MpPRSVCont2DShpTypTrpzStyleEnum
{	mcPRSSVOUCVTVRS2STTS_FILL = 0,
	mcPRSSVOUCVTVRS2STTS_BORDER = 1
} MpPRSVCont2DShpTypTrpzStyleEnum;

typedef enum MpPRSVCont3DTypEnum
{	mcPRSSVOUCVTVRS3T_CUBE = 0,
	mcPRSSVOUCVTVRS3T_CYLINDER = 1,
	mcPRSSVOUCVTVRS3T_TRPZ_PRSM = 2
} MpPRSVCont3DTypEnum;

typedef enum MpPRSVCont3DTypCubeStyleEnum
{	mcPRSSVOUCVTVRS3TCS_FILL = 0,
	mcPRSSVOUCVTVRS3TCS_BORDER = 1
} MpPRSVCont3DTypCubeStyleEnum;

typedef enum MpPRSVCont3DTypCylinderStyleEnum
{	mcPRSSVOUCVTVRS3TCySS_FILL = 0,
	mcPRSSVOUCVTVRS3TCySS_BORDER = 1
} MpPRSVCont3DTypCylinderStyleEnum;

typedef enum MpPRSVCont3DTypTrpzPrsmStyleEnum
{	mcPRSSVOUCVTVRS3TTPS_FILL = 0,
	mcPRSSVOUCVTVRS3TTPS_BORDER = 1
} MpPRSVCont3DTypTrpzPrsmStyleEnum;

typedef enum MpPRSVOBJSTStatEnum
{	mcPRSVOBJS_NOT_USE = 0,
	mcPRSVOBJS_SNG_ITEM_OBJ = 1,
	mcPRSVOBJS_SNG_ITEM_PLH = 2,
	mcPRSVOBJS_EMPTY_CNTR = 3,
	mcPRSVOBJS_FULLY_FILL_CNTR = 4,
	mcPRSVOBJS_PART_FILL_CNTR = 5,
	mcPRSVOBJS_CNTR_PLH = 6,
	mcPRSVOBJS_OBJ_IN_CNTR = 7,
	mcPRSVOBJS_PLH_IN_CNTR = 8
} MpPRSVOBJSTStatEnum;

typedef enum MpPOLObjEnum
{	mcPOLO_SNG_ITEM = 0,
	mcPOLO_CNTR = 1
} MpPOLObjEnum;

typedef enum MpPOLObjSngItemLdEnum
{	mcPOLOSIL_NOT_USE = 0,
	mcPOLOSIL_TBL = 1,
	mcPOLOSIL_BASIC = 2
} MpPOLObjSngItemLdEnum;

typedef enum MpPOLObjCntrLdEnum
{	mcPOLOCL_NOT_USE = 0,
	mcPOLOCL_TBL = 1,
	mcPOLOCL_BASIC = 2
} MpPOLObjCntrLdEnum;

typedef struct MpPickStatusIDType
{	enum MpPickErrorEnum ID;
	enum MpComSeveritiesEnum Severity;
} MpPickStatusIDType;

typedef struct MpPickDiagType
{	struct MpPickStatusIDType StatusID;
} MpPickDiagType;

typedef struct MpPickCoreInfoType
{	enum MpPickCoreComponentStateEnum ComponentState;
	enum MpPickCoreProcessStateEnum ProcessState;
	enum MpPickCoreMovementStateEnum MovementState;
	unsigned long ProcessedObjects;
	struct MpPickDiagType Diag;
} MpPickCoreInfoType;

typedef struct MpPickCoreParType
{	plcstring OperationMode[81];
} MpPickCoreParType;

typedef struct MpPickObjLatchedConvType
{	double Position;
} MpPickObjLatchedConvType;

typedef unsigned long MpPickRegObjPosIdType;

typedef unsigned long MpPickObjectTypeIdentType;

typedef struct MpPickObjPosInfoType
{	MpPickRegObjPosIdType ObjectPositionId;
	struct McPosType Translation;
	struct McOrientType Orientation;
	MpPickObjectTypeIdentType ObjectTypeIdent;
	unsigned long ObjectAttachment;
	enum MpPickObjPosAddInfoEnum ObjectPositionInfo;
} MpPickObjPosInfoType;

typedef struct MpPickRegCreateObjectsParType
{	unsigned long DataAddress;
	unsigned short NumberOfObjects;
} MpPickRegCreateObjectsParType;

typedef struct MpPickRegCreateObjectParType
{	enum MpPickRegCreateObjModeEnum Mode;
	plcstring ObjectTypeName[251];
	struct MpPickObjLatchedConvType LatchedConveyor;
	struct McPosType Translation;
	struct McOrientType Orientation;
	unsigned long ObjectAttachment;
} MpPickRegCreateObjectParType;

typedef struct MpPickRegDeleteObjectsParType
{	enum MpPickRegDeleteObjModeEnum Mode;
	MpPickRegObjPosIdType ObjectPositionId;
	plcstring ObjectTypeName[251];
} MpPickRegDeleteObjectsParType;

typedef struct MpPickRegGetObjectsParType
{	enum MpPickRegGetObjModeEnum GetMode;
	MpPickRegObjPosIdType ObjectPositionId;
	plcstring ObjectTypeName[251];
	unsigned long CoordSystem;
	unsigned long DataAddress;
	unsigned short NumberOfObjectPositions;
} MpPickRegGetObjectsParType;

typedef struct MpPickRegisterInfoType
{	enum MpPickRegisterComponentStateEnum ComponentState;
	unsigned short NumberOfObjects;
	struct MpPickDiagType Diag;
} MpPickRegisterInfoType;

typedef struct MpPickRegSetObjectParType
{	MpPickRegObjPosIdType ObjectPositionId;
	unsigned long ObjectAttachment;
} MpPickRegSetObjectParType;

typedef struct MpPickRegisterType
{	struct MpInternalPickRegisterIfType* controlif;
	struct McInternalMappLinkType mappLinkInternal;
} MpPickRegisterType;

typedef struct MpPickCoreType
{	struct MpInternalPickCoreIfType* controlif;
	struct McInternalMappLinkType mappLinkInternal;
} MpPickCoreType;

typedef struct MpPickObjectListType
{	struct MpInternalPickObjectListIfType* controlif;
	struct McInternalMappLinkType mappLinkInternal;
} MpPickObjectListType;

typedef struct MpInternalPickCoreIfType
{	plcdword vtable;
} MpInternalPickCoreIfType;

typedef struct MpInternalPickRegisterIfType
{	plcdword vtable;
} MpInternalPickRegisterIfType;

typedef struct MpInternalPickObjectListIfType
{	plcdword vtable;
} MpInternalPickObjectListIfType;

typedef struct MpPCGripStdToolType
{	enum MpPCGripStdToolEnum Type;
} MpPCGripStdToolType;

typedef struct MpPCGripStdBxBasicPickType
{	float TriggerTime;
	float SyncTime;
} MpPCGripStdBxBasicPickType;

typedef struct MpPCGripStdBxBasicPlType
{	float TriggerTime;
	float SyncTime;
} MpPCGripStdBxBasicPlType;

typedef struct MpPCGripStdBxBasicType
{	struct MpPCGripStdBxBasicPickType Pick;
	struct MpPCGripStdBxBasicPlType Place;
	plcstring ProcessVariableName[251];
} MpPCGripStdBxBasicType;

typedef struct MpPCGripStdBxType
{	enum MpPCGripStdBxEnum Type;
	struct MpPCGripStdBxBasicType Basic;
} MpPCGripStdBxType;

typedef struct MpPCGripStdType
{	struct MpPCGripStdToolType Tool;
	struct MpPCGripStdBxType Behavior;
} MpPCGripStdType;

typedef struct MpPCGripType
{	enum MpPCGripEnum Type;
	struct MpPCGripStdType Standard;
} MpPCGripType;

typedef struct MpPCJobMoveBasicType
{	double PickOffsetZ;
	double PickRounding;
	double PlaceOffsetZ;
	double PlaceRounding;
} MpPCJobMoveBasicType;

typedef struct MpPCJobMoveType
{	enum MpPCJobMoveEnum Type;
	struct MpPCJobMoveBasicType Basic;
} MpPCJobMoveType;

typedef struct MpPCJobLimBasicLimType
{	double Velocity;
	double Acceleration;
	double Deceleration;
} MpPCJobLimBasicLimType;

typedef struct MpPCJobLimBasicType
{	struct MpPCJobLimBasicLimType WithObject;
	struct MpPCJobLimBasicLimType WithoutObject;
} MpPCJobLimBasicType;

typedef struct MpPCJobLimType
{	enum MpPCJobLimEnum Type;
	struct MpPCJobLimBasicType Basic;
} MpPCJobLimType;

typedef struct MpCfgPickJobType
{	plcstring Name[251];
	plcstring ObjectName[251];
	struct McCfgReferenceType InfeedRegisterReference;
	struct McCfgReferenceType OutfeedRegisterReference;
	struct MpPCJobMoveType Movement;
	struct MpPCJobLimType Limits;
} MpCfgPickJobType;

typedef struct MpPCOMAJPInFirstRegisteredType
{	enum MpPCOMAJPInFirstRegisteredEnum Type;
} MpPCOMAJPInFirstRegisteredType;

typedef struct MpPCOMAJPInFirstLeavingWsType
{	enum MpPCOMAJPInFirstLeavingWsEnum Type;
} MpPCOMAJPInFirstLeavingWsType;

typedef struct MpPCOMAJPInSDToFixPtType
{	plcstring FrameName[251];
	struct McCfgTransXYZType Translation;
} MpPCOMAJPInSDToFixPtType;

typedef struct MpPCOMAJPInSDType
{	enum MpPCOMAJPInSDEnum Type;
	struct MpPCOMAJPInSDToFixPtType ToFixedPoint;
} MpPCOMAJPInSDType;

typedef struct MpPCOMAJPInType
{	struct MpPCOMAJPInFirstRegisteredType FirstRegistered;
	struct MpPCOMAJPInFirstLeavingWsType FirstLeavingWorkspace;
	struct MpPCOMAJPInSDType ShortestDistance;
} MpPCOMAJPInType;

typedef struct MpPCOMAJPOutFirstRegisteredType
{	enum MpPCOMAJPOutFirstRegisteredEnum Type;
} MpPCOMAJPOutFirstRegisteredType;

typedef struct MpPCOMAJPOutFirstLeavingWsType
{	enum MpPCOMAJPOutFirstLeavingWsEnum Type;
} MpPCOMAJPOutFirstLeavingWsType;

typedef struct MpPCOMAJPOutSDToFixPtType
{	plcstring FrameName[251];
	struct McCfgTransXYZType Translation;
} MpPCOMAJPOutSDToFixPtType;

typedef struct MpPCOMAJPOutSDType
{	enum MpPCOMAJPOutSDEnum Type;
	struct MpPCOMAJPOutSDToFixPtType ToFixedPoint;
} MpPCOMAJPOutSDType;

typedef struct MpPCOMAJPOutType
{	struct MpPCOMAJPOutFirstRegisteredType FirstRegistered;
	struct MpPCOMAJPOutFirstLeavingWsType FirstLeavingWorkspace;
	struct MpPCOMAJPOutSDType ShortestDistance;
} MpPCOMAJPOutType;

typedef struct MpPCOMAJPInOutType
{	struct MpPCOMAJPInType InfeedPreferences;
	struct MpPCOMAJPOutType OutfeedPreferences;
} MpPCOMAJPInOutType;

typedef struct MpPCOMAJProcType
{	enum MpPCOMAJProcEnum Type;
	struct MpPCOMAJPInOutType InfeedOutfeed;
} MpPCOMAJProcType;

typedef struct MpPCOMAJExeBxType
{	enum MpPCOMAJExeBxEnum Type;
} MpPCOMAJExeBxType;

typedef struct MpPCOpModAsgJobType
{	McCfgString250Type Name;
	struct MpPCOMAJProcType Processing;
	struct MpPCOMAJExeBxType JobExecutionBehaviour;
} MpPCOpModAsgJobType;

typedef struct MpPCOMIBSFWPStdType
{	plcstring FrameName[251];
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
} MpPCOMIBSFWPStdType;

typedef struct MpPCOMIBSFWPType
{	enum MpPCOMIBSFWPEnum Type;
	struct MpPCOMIBSFWPStdType Standard;
} MpPCOMIBSFWPType;

typedef struct MpPCOpModIdleBxFixWaitPosType
{	struct MpPCOMIBSFWPType Position;
} MpPCOpModIdleBxFixWaitPosType;

typedef struct MpPCOpModIdleBxType
{	enum MpPCOpModIdleBxEnum Type;
	struct MpPCOpModIdleBxFixWaitPosType FixedWaitingPosition;
} MpPCOpModIdleBxType;

typedef struct MpCfgPickOpModType
{	plcstring Name[251];
	struct MpPCOpModAsgJobType AssignedJob[10];
	struct MpPCOpModIdleBxType IdleBehavior;
} MpCfgPickOpModType;

typedef struct MpCfgPickCoreType
{	struct McCfgReferenceType AxesgroupReference;
	struct MpPCGripType Gripper;
	struct McCfgUnboundedArrayType Job;
	struct McCfgUnboundedArrayType OperationMode;
} MpCfgPickCoreType;

typedef struct MpPRStatType
{	plcstring FrameName[251];
} MpPRStatType;

typedef struct MpPRTLCMSPPVMLIVelBasicType
{	float Velocity;
} MpPRTLCMSPPVMLIVelBasicType;

typedef struct MpPRTLCMSPPVMLIVelType
{	enum MpPRTLCMSPPVMLIVelEnum Type;
	struct MpPRTLCMSPPVMLIVelBasicType Basic;
} MpPRTLCMSPPVMLIVelType;

typedef struct MpPRTLCMSPPVMLIAccBasicType
{	float Acceleration;
} MpPRTLCMSPPVMLIAccBasicType;

typedef struct MpPRTLCMSPPVMLIAccType
{	enum MpPRTLCMSPPVMLIAccEnum Type;
	struct MpPRTLCMSPPVMLIAccBasicType Basic;
} MpPRTLCMSPPVMLIAccType;

typedef struct MpPRTLCMSPPVMLIDirType
{	enum MpPRTLCMSPPVMLIDirEnum Type;
} MpPRTLCMSPPVMLIDirType;

typedef struct MpPRTLCMSPPVMLIType
{	struct MpPRTLCMSPPVMLIVelType Velocity;
	struct MpPRTLCMSPPVMLIAccType Acceleration;
	struct MpPRTLCMSPPVMLIDirType Direction;
} MpPRTLCMSPPVMLIType;

typedef struct MpPRLinMotSrcPosPVMoveLimType
{	enum MpPRLinMotSrcPosPVMoveLimEnum Type;
	struct MpPRTLCMSPPVMLIType Internal;
} MpPRLinMotSrcPosPVMoveLimType;

typedef struct MpPRLinMotSrcPosPVPrepLinRegType
{	signed long ConsideredSamples;
	double PositionDisturbance;
} MpPRLinMotSrcPosPVPrepLinRegType;

typedef struct MpPRLinMotSrcPosPVPrepType
{	enum MpPRLinMotSrcPosPVPrepEnum Type;
	struct MpPRLinMotSrcPosPVPrepLinRegType LinearRegression;
} MpPRLinMotSrcPosPVPrepType;

typedef struct MpPRLinMotSrcPosPVType
{	plcstring ProcessVariableName[251];
	double NegativeOverflow;
	double PositiveOverflow;
	double DelayTime;
	struct MpPRLinMotSrcPosPVMoveLimType MovementLimits;
	struct MpPRLinMotSrcPosPVPrepType Preparation;
} MpPRLinMotSrcPosPVType;

typedef struct MpPRLinMotSrcAxisCCType
{	enum MpPRLinMotSrcAxisCCEnum Type;
} MpPRLinMotSrcAxisCCType;

typedef struct MpPRLinMotSrcAxAxUseActType
{	struct MpPRLinMotSrcAxisCCType CommandConsideration;
} MpPRLinMotSrcAxAxUseActType;

typedef struct MpPRLinMotSrcAxAxUseType
{	enum MpPRLinMotSrcAxAxUseEnum Type;
	struct MpPRLinMotSrcAxAxUseActType Active;
} MpPRLinMotSrcAxAxUseType;

typedef struct MpPRTLCMSAMLUALDirType
{	enum MpPRTLCMSAMLUALDirEnum Type;
} MpPRTLCMSAMLUALDirType;

typedef struct MpPRTLCMSAMLUALType
{	struct MpPRTLCMSAMLUALDirType Direction;
} MpPRTLCMSAMLUALType;

typedef struct MpPRTLCMSAMLIVelBasicType
{	float Velocity;
} MpPRTLCMSAMLIVelBasicType;

typedef struct MpPRTLCMSAMLIVelType
{	enum MpPRTLCMSAMLIVelEnum Type;
	struct MpPRTLCMSAMLIVelBasicType Basic;
} MpPRTLCMSAMLIVelType;

typedef struct MpPRTLCMSAMLIAccBasicType
{	float Acceleration;
} MpPRTLCMSAMLIAccBasicType;

typedef struct MpPRTLCMSAMLIAccType
{	enum MpPRTLCMSAMLIAccEnum Type;
	struct MpPRTLCMSAMLIAccBasicType Basic;
} MpPRTLCMSAMLIAccType;

typedef struct MpPRTLCMSAMLIDirType
{	enum MpPRTLCMSAMLIDirEnum Type;
} MpPRTLCMSAMLIDirType;

typedef struct MpPRTLCMSAMLIType
{	struct MpPRTLCMSAMLIVelType Velocity;
	struct MpPRTLCMSAMLIAccType Acceleration;
	struct MpPRTLCMSAMLIDirType Direction;
} MpPRTLCMSAMLIType;

typedef struct MpPRLinMotSrcAxMoveLimType
{	enum MpPRLinMotSrcAxMoveLimEnum Type;
	struct MpPRTLCMSAMLUALType UseAxisLimits;
	struct MpPRTLCMSAMLIType Internal;
} MpPRLinMotSrcAxMoveLimType;

typedef struct MpPRLinMotSrcAxPrepLinRegType
{	signed long ConsideredSamples;
	double PositionDisturbance;
} MpPRLinMotSrcAxPrepLinRegType;

typedef struct MpPRLinMotSrcAxPrepType
{	enum MpPRLinMotSrcAxPrepEnum Type;
	struct MpPRLinMotSrcAxPrepLinRegType LinearRegression;
} MpPRLinMotSrcAxPrepType;

typedef struct MpPRLinMotSrcAxType
{	struct McCfgReferenceType AxisReference;
	struct MpPRLinMotSrcAxAxUseType AxisUsage;
	double DelayTime;
	struct MpPRLinMotSrcAxMoveLimType MovementLimits;
	struct MpPRLinMotSrcAxPrepType Preparation;
} MpPRLinMotSrcAxType;

typedef struct MpPRLinMotSrcType
{	enum MpPRLinMotSrcEnum Type;
	struct MpPRLinMotSrcPosPVType PositionProcessVariable;
	struct MpPRLinMotSrcAxType Axis;
} MpPRLinMotSrcType;

typedef struct MpPRLinType
{	plcstring FrameName[251];
	double Length;
	double Width;
	double Height;
	unsigned long ObjectCount;
	double MaxPositionError;
	struct MpPRLinMotSrcType MotionSource;
} MpPRLinType;

typedef struct MpPRTypType
{	enum MpPRTypEnum Type;
	struct MpPRStatType StaticPosition;
	struct MpPRLinType LinearConveyor;
} MpPRTypType;

typedef struct MpCfgPickRegType
{	struct MpPRTypType Type;
} MpCfgPickRegType;

typedef struct MpPRSVUseNameType
{	enum MpPRSVUseNameEnum Type;
} MpPRSVUseNameType;

typedef struct MpPRSVUseFrmType
{	enum MpPRSVUseFrmEnum Type;
} MpPRSVUseFrmType;

typedef struct MpPRSVUseDimVisType
{	enum McScnSurfaceEnum Material;
	float Opacitiy;
} MpPRSVUseDimVisType;

typedef struct MpPRSVUseDimInvisType
{	enum McScnSurfaceEnum Material;
	float Opacitiy;
} MpPRSVUseDimInvisType;

typedef struct MpPRSVUseDimType
{	enum MpPRSVUseDimEnum Type;
	struct MpPRSVUseDimVisType Visible;
	struct MpPRSVUseDimInvisType Invisible;
} MpPRSVUseDimType;

typedef struct MpPRSVUseVRCubeDimType
{	double Length;
	double Width;
	double Height;
} MpPRSVUseVRCubeDimType;

typedef struct MpPRSVUseVRCubeType
{	struct MpPRSVUseVRCubeDimType Dimensions;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
	enum McScnSurfaceEnum Material;
} MpPRSVUseVRCubeType;

typedef struct MpPRSVUseVRCnvrBeltDimType
{	double Length;
	double Width;
	double Height;
} MpPRSVUseVRCnvrBeltDimType;

typedef struct MpPRSVUseVRCnvrBeltType
{	struct MpPRSVUseVRCnvrBeltDimType Dimensions;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
	enum McScnSurfaceEnum Material;
} MpPRSVUseVRCnvrBeltType;

typedef struct MpPRSVUseVRType
{	enum MpPRSVUseVREnum Type;
	struct MpPRSVUseVRCubeType Cuboid;
	struct MpPRSVUseVRCnvrBeltType ConveyorBelt;
} MpPRSVUseVRType;

typedef struct MpPRSVContFrmType
{	double Size;
} MpPRSVContFrmType;

typedef struct MpPRSVCont2DShpTypCirDimType
{	double Radius;
} MpPRSVCont2DShpTypCirDimType;

typedef struct MpPRSVCont2DShpTypCirStyleType
{	enum MpPRSVCont2DShpTypCirStyleEnum Type;
} MpPRSVCont2DShpTypCirStyleType;

typedef struct MpPRSVCont2DShpTypCirType
{	struct MpPRSVCont2DShpTypCirDimType Dimensions;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
	struct MpPRSVCont2DShpTypCirStyleType Style;
	enum McScnSurfaceEnum Material;
} MpPRSVCont2DShpTypCirType;

typedef struct MpPRSVCont2DShpTypRectDimType
{	double Length;
	double Width;
} MpPRSVCont2DShpTypRectDimType;

typedef struct MpPRSVCont2DShpTypRectStyleType
{	enum MpPRSVCont2DShpTypRectStyleEnum Type;
} MpPRSVCont2DShpTypRectStyleType;

typedef struct MpPRSVCont2DShpTypRectType
{	struct MpPRSVCont2DShpTypRectDimType Dimensions;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
	struct MpPRSVCont2DShpTypRectStyleType Style;
	enum McScnSurfaceEnum Material;
} MpPRSVCont2DShpTypRectType;

typedef struct MpPRSVCont2DShpTypTrpzDimType
{	double Length;
	double Width;
} MpPRSVCont2DShpTypTrpzDimType;

typedef struct MpPRSVCont2DShpTypTrpzStyleType
{	enum MpPRSVCont2DShpTypTrpzStyleEnum Type;
} MpPRSVCont2DShpTypTrpzStyleType;

typedef struct MpPRSVCont2DShpTypTrpzType
{	struct MpPRSVCont2DShpTypTrpzDimType Dimensions;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
	struct MpPRSVCont2DShpTypTrpzStyleType Style;
	enum McScnSurfaceEnum Material;
} MpPRSVCont2DShpTypTrpzType;

typedef struct MpPRSVCont2DShpTypType
{	enum MpPRSVCont2DShpTypEnum Type;
	struct MpPRSVCont2DShpTypCirType Circle;
	struct MpPRSVCont2DShpTypRectType Rectangle;
	struct MpPRSVCont2DShpTypTrpzType Trapezoid;
} MpPRSVCont2DShpTypType;

typedef struct MpPRSVCont2DType
{	struct MpPRSVCont2DShpTypType ShapeType;
} MpPRSVCont2DType;

typedef struct MpPRSVCont3DTypCubeDimType
{	double Length;
	double Width;
	double Height;
} MpPRSVCont3DTypCubeDimType;

typedef struct MpPRSVCont3DTypCubeStyleType
{	enum MpPRSVCont3DTypCubeStyleEnum Type;
} MpPRSVCont3DTypCubeStyleType;

typedef struct MpPRSVCont3DTypCubeType
{	struct MpPRSVCont3DTypCubeDimType Dimensions;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
	struct MpPRSVCont3DTypCubeStyleType Style;
	enum McScnSurfaceEnum Material;
} MpPRSVCont3DTypCubeType;

typedef struct MpPRSVCont3DTypCylinderDimType
{	double Radius;
	double Height;
} MpPRSVCont3DTypCylinderDimType;

typedef struct MpPRSVCont3DTypCylinderStyleType
{	enum MpPRSVCont3DTypCylinderStyleEnum Type;
} MpPRSVCont3DTypCylinderStyleType;

typedef struct MpPRSVCont3DTypCylinderType
{	struct MpPRSVCont3DTypCylinderDimType Dimensions;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
	struct MpPRSVCont3DTypCylinderStyleType Style;
	enum McScnSurfaceEnum Material;
} MpPRSVCont3DTypCylinderType;

typedef struct MpPRSVCont3DTypTrpzPrsmDimType
{	double Length;
	double Width;
	double Height;
} MpPRSVCont3DTypTrpzPrsmDimType;

typedef struct MpPRSVCont3DTypTrpzPrsmStyleType
{	enum MpPRSVCont3DTypTrpzPrsmStyleEnum Type;
} MpPRSVCont3DTypTrpzPrsmStyleType;

typedef struct MpPRSVCont3DTypTrpzPrsmType
{	struct MpPRSVCont3DTypTrpzPrsmDimType Dimensions;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
	struct MpPRSVCont3DTypTrpzPrsmStyleType Style;
	enum McScnSurfaceEnum Material;
} MpPRSVCont3DTypTrpzPrsmType;

typedef struct MpPRSVCont3DTypType
{	enum MpPRSVCont3DTypEnum Type;
	struct MpPRSVCont3DTypCubeType Cuboid;
	struct MpPRSVCont3DTypCylinderType Cylinder;
	struct MpPRSVCont3DTypTrpzPrsmType TrapezoidalPrism;
} MpPRSVCont3DTypType;

typedef struct MpPRSVCont3DType
{	struct MpPRSVCont3DTypType Type;
} MpPRSVCont3DType;

typedef struct MpPRSVContMeshType
{	plcstring FileName[251];
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
	enum McScnSurfaceEnum Material;
} MpPRSVContMeshType;

typedef struct MpPRSVTmplVRType
{	enum MpPRSVTmplVREnum Type;
	struct MpPRSVContFrmType Frame;
	struct MpPRSVCont2DType Shape2D;
	struct MpPRSVCont3DType Shape3D;
	struct MpPRSVContMeshType Mesh3D;
} MpPRSVTmplVRType;

typedef struct MpPRSVOBJSTType
{	struct McCfgUnboundedArrayType State;
} MpPRSVOBJSTType;

typedef struct MpPRSVTmplFltrObjTypNameType
{	struct McCfgUnboundedArrayType Name;
} MpPRSVTmplFltrObjTypNameType;

typedef struct MpPRSVTmplFltrType
{	struct MpPRSVOBJSTType ObjectState;
	struct MpPRSVTmplFltrObjTypNameType ObjectTypeName;
} MpPRSVTmplFltrType;

typedef struct MpPRSVTmplType
{	struct MpPRSVTmplVRType VisualRepresentation;
	struct MpPRSVTmplFltrType Filter;
} MpPRSVTmplType;

typedef struct MpPRSVUseContVisType
{	struct McCfgUnboundedArrayType Template;
} MpPRSVUseContVisType;

typedef struct MpPRSVUseContType
{	enum MpPRSVUseContEnum Type;
	struct MpPRSVUseContVisType Visible;
} MpPRSVUseContType;

typedef struct MpPRSVUseType
{	struct MpPRSVUseNameType Name;
	struct MpPRSVUseFrmType Frame;
	struct MpPRSVUseDimType Dimensions;
	struct MpPRSVUseVRType VisualRepresentation;
	struct MpPRSVUseContType Content;
} MpPRSVUseType;

typedef struct MpPRSVType
{	enum MpPRSVEnum Type;
	struct MpPRSVUseType Used;
} MpPRSVType;

typedef struct MpCfgPickRegScnType
{	struct MpPRSVType SceneViewerObject;
} MpCfgPickRegScnType;

typedef struct MpPOLObjSngItemLdTblType
{	struct McCfgReferenceType ProductLoadTable;
} MpPOLObjSngItemLdTblType;

typedef struct MpPOLObjSngItemLdType
{	enum MpPOLObjSngItemLdEnum Type;
	struct MpPOLObjSngItemLdTblType Table;
} MpPOLObjSngItemLdType;

typedef struct MpPOLObjSngItemType
{	plcstring Name[251];
	struct MpPOLObjSngItemLdType Load;
} MpPOLObjSngItemType;

typedef struct MpPOLObjCntrLdTblType
{	struct McCfgReferenceType ProductLoadTable;
} MpPOLObjCntrLdTblType;

typedef struct MpPOLObjCntrLdType
{	enum MpPOLObjCntrLdEnum Type;
	struct MpPOLObjCntrLdTblType Table;
} MpPOLObjCntrLdType;

typedef struct MpPOLObjCntrLyrPosType
{	McCfgString250Type Object;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
} MpPOLObjCntrLyrPosType;

typedef struct MpPOLObjCntrLyrType
{	struct McCfgUnboundedArrayType Position;
} MpPOLObjCntrLyrType;

typedef struct MpPOLObjCntrType
{	plcstring Name[251];
	struct MpPOLObjCntrLdType Load;
	struct McCfgUnboundedArrayType Layer;
} MpPOLObjCntrType;

typedef struct MpPOLObjType
{	enum MpPOLObjEnum Type;
	struct MpPOLObjSngItemType SingleItem;
	struct MpPOLObjCntrType Container;
} MpPOLObjType;

typedef struct MpCfgPickObjLstType
{	struct McCfgUnboundedArrayType Object;
} MpCfgPickObjLstType;

typedef struct MpPickCore
{
	/* VAR_INPUT (analog) */
	struct MpPickCoreType* MpLink;
	struct MpPickCoreParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpPickCoreInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit ProcessEnable;
	plcbit ProcessStart;
	plcbit ProcessStop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit ProcessActive;
	plcbit ProcessRunning;
} MpPickCore_typ;

typedef struct MpPickRegister
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpPickRegisterInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit RegisterEnable;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit RegisterActive;
} MpPickRegister_typ;

typedef struct MpPickRegCreateObjects
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegCreateObjectsParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Create;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegCreateObjects_typ;

typedef struct MpPickRegCreateObject
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegCreateObjectParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	MpPickRegObjPosIdType ObjectPositionId;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Create;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegCreateObject_typ;

typedef struct MpPickRegDeleteObjects
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegDeleteObjectsParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Delete;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegDeleteObjects_typ;

typedef struct MpPickRegGetObjects
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegGetObjectsParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned short ObjectPositionsFound;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Get;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegGetObjects_typ;

typedef struct MpPickRegSetObject
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegSetObjectParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Set;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegSetObject_typ;

typedef struct MpPickGetObjectTypeIdent
{
	/* VAR_INPUT (analog) */
	struct MpPickObjectListType* MpLink;
	plcstring ObjectTypeName[251];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	MpPickObjectTypeIdentType ObjectTypeIdent;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Get;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickGetObjectTypeIdent_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpPickCore(struct MpPickCore* inst);
_BUR_PUBLIC void MpPickRegister(struct MpPickRegister* inst);
_BUR_PUBLIC void MpPickRegCreateObjects(struct MpPickRegCreateObjects* inst);
_BUR_PUBLIC void MpPickRegCreateObject(struct MpPickRegCreateObject* inst);
_BUR_PUBLIC void MpPickRegDeleteObjects(struct MpPickRegDeleteObjects* inst);
_BUR_PUBLIC void MpPickRegGetObjects(struct MpPickRegGetObjects* inst);
_BUR_PUBLIC void MpPickRegSetObject(struct MpPickRegSetObject* inst);
_BUR_PUBLIC void MpPickGetObjectTypeIdent(struct MpPickGetObjectTypeIdent* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPPICK_ */

