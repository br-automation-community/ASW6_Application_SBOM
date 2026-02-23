/* Automation Studio generated header file */
/* Do not edit ! */
/* McAcpTrak 6.5.1 */

#ifndef _MCACPTRAK_
#define _MCACPTRAK_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _McAcpTrak_VERSION
#define _McAcpTrak_VERSION 6.5.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif

#ifdef _SG4
#include <McBase.h> 
#include <McAxis.h> 
#include <MpBase.h>
#endif
 
#ifdef _SG3
#include <McBase.h> 
#include <McAxis.h> 
#include <MpBase.h>
#endif
 
#ifdef _SGC
#include <McBase.h> 
#include <McAxis.h> 
#include <MpBase.h>
#endif

/* Datatypes and datatypes of function blocks */
typedef enum McAcpTrakDataBlockModeEnum
{	mcACPTRAK_DATA_BLOCK_GET,
	mcACPTRAK_DATA_BLOCK_SET
} McAcpTrakDataBlockModeEnum;

typedef enum McAcpTrakAdvRouteInfoValidEnum
{	mcACPTRAK_ROUTE_VALID,
	mcACPTRAK_ROUTE_DIFF_WORKSPACES,
	mcACPTRAK_ROUTE_OPTS_NOT_SATISF,
	mcACPTRAK_ROUTE_DST_NOT_IN_INT,
	mcACPTRAK_ROUTE_TP_NOT_IN_INT,
	mcACPTRAK_ROUTE_NO_ROUTE,
	mcACPTRAK_ROUTE_CON_LONG_SRC,
	mcACPTRAK_ROUTE_CON_LONG_DST,
	mcACPTRAK_ROUTE_CON_EXTR_DSTPOS
} McAcpTrakAdvRouteInfoValidEnum;

typedef enum McAcpTrakAsmDeleteShCmdEnum
{	mcACPTRAK_SH_DELETE_SPECIFIC,
	mcACPTRAK_SH_DELETE_ALL,
	mcACPTRAK_SH_DELETE_VIRTUAL,
	mcACPTRAK_SH_DELETE_NONVIRTUAL
} McAcpTrakAsmDeleteShCmdEnum;

typedef enum McAcpTrakAsmErrorReasonEnum
{	mcACPTRAK_ASM_ERROR_NONE,
	mcACPTRAK_ASM_ERROR_UNSPECIFIED,
	mcACPTRAK_ASM_ERROR_ENCDIFF,
	mcACPTRAK_ASM_ERROR_COMMAND,
	mcACPTRAK_ASM_ERROR_SEGMENT,
	mcACPTRAK_ASM_ERROR_UNOBSERVABLE
} McAcpTrakAsmErrorReasonEnum;

typedef enum McAcpTrakBarrierCmdEnum
{	mcACPTRAK_BARRIER_OPEN,
	mcACPTRAK_BARRIER_CLOSE,
	mcACPTRAK_BARRIER_ADD_TICKETS,
	mcACPTRAK_BARRIER_CLEAR_TICKETS
} McAcpTrakBarrierCmdEnum;

typedef enum McAcpTrakBarrierGetShModeEnum
{	mcACPTRAK_BARR_GET_SH_ALL = 0,
	mcACPTRAK_BARR_GET_SH_STANDSTILL,
	mcACPTRAK_BARR_GET_SH_CLOSEST
} McAcpTrakBarrierGetShModeEnum;

typedef enum McAcpTrakBarrierStatusEnum
{	mcACPTRAK_BARRIER_OPENED,
	mcACPTRAK_BARRIER_CLOSED,
	mcACPTRAK_BARRIER_TICKETING
} McAcpTrakBarrierStatusEnum;

typedef enum McAcpTrakBarrierTypeEnum
{	mcACPTRAK_BARRIER_USER = 0,
	mcACPTRAK_BARRIER_CONFLICTZONE = 1,
	mcACPTRAK_BARRIER_SEGMENT = 2
} McAcpTrakBarrierTypeEnum;

typedef enum McAcpTrakCenterPointEnum
{	mcACPTRAK_PNT_SCP = 0,
	mcACPTRAK_PNT_TCP
} McAcpTrakCenterPointEnum;

typedef enum McAcpTrakConDeleteModeEnum
{	mcACPTRAK_CON_DELETE_ANY_CASE,
	mcACPTRAK_CON_DELETE_EMPTY
} McAcpTrakConDeleteModeEnum;

typedef enum McAcpTrakConGetShSelectModeEnum
{	mcACPTRAK_CON_GET_SH_MEMBERS,
	mcACPTRAK_CON_GET_SH_SHUTTLES
} McAcpTrakConGetShSelectModeEnum;

typedef enum McAcpTrakConGetShuttleModeEnum
{	mcACPTRAK_CON_GET_SH_SECPOS_ASC,
	mcACPTRAK_CON_GET_SH_SECPOS_DESC
} McAcpTrakConGetShuttleModeEnum;

typedef enum McAcpTrakCopySegDataModeEnum
{	mcACPTRAK_SEG_DATA_ALL,
	mcACPTRAK_SEG_DATA_SPECIFIC
} McAcpTrakCopySegDataModeEnum;

typedef enum McAcpTrakCopySegDataTriggerEnum
{	mcACPTRAK_SEG_DATA_TRIGGER_IMM
} McAcpTrakCopySegDataTriggerEnum;

typedef enum McAcpTrakCopyShDataModeEnum
{	mcACPTRAK_SH_DATA_ALL,
	mcACPTRAK_SH_DATA_SPECIFIC
} McAcpTrakCopyShDataModeEnum;

typedef enum McAcpTrakCopyShDataTriggerEnum
{	mcACPTRAK_TRIGGER_IMMEDIATELY
} McAcpTrakCopyShDataTriggerEnum;

typedef enum McAcpTrakCopyUserDataModeEnum
{	mcACPTRAK_USERDATA_GET,
	mcACPTRAK_USERDATA_SET
} McAcpTrakCopyUserDataModeEnum;

typedef enum McAcpTrakCouplingModeEnum
{	mcACPTRAK_COUPL_DIST,
	mcACPTRAK_COUPL_TCP_DIST
} McAcpTrakCouplingModeEnum;

typedef enum McAcpTrakCouplingObjCmdEnum
{	mcACPTRAK_COUPLE_OBJ_SET,
	mcACPTRAK_COUPLE_OBJ_REMOVE,
	mcACPTRAK_COUPLE_OBJ_RESET
} McAcpTrakCouplingObjCmdEnum;

typedef enum McAcpTrakFieldModeEnum
{	mcACPTRAK_FIELD_NORMAL,
	mcACPTRAK_FIELD_WEAKENING,
	mcACPTRAK_FIELD_STRENGTHENING
} McAcpTrakFieldModeEnum;

typedef enum McAcpTrakGetSectorModeEnum
{	mcACPTRAK_GET_SEC_ALL = 0,
	mcACPTRAK_GET_SEC_CLOSED,
	mcACPTRAK_GET_SEC_NONCLOSED
} McAcpTrakGetSectorModeEnum;

typedef enum McAcpTrakGetSegmentModeEnum
{	mcACPTRAK_GET_SEG_ALL = 0,
	mcACPTRAK_GET_SEG_DISABLED,
	mcACPTRAK_GET_SEG_STOPPING,
	mcACPTRAK_GET_SEG_ERRORSTOP
} McAcpTrakGetSegmentModeEnum;

typedef enum McAcpTrakGetShuttleModeEnum
{	mcACPTRAK_GET_SH_ALL = 0,
	mcACPTRAK_GET_SH_STANDSTILL,
	mcACPTRAK_GET_SH_DISABLED,
	mcACPTRAK_GET_SH_STOPPING,
	mcACPTRAK_GET_SH_ERRORSTOP,
	mcACPTRAK_GET_SH_ERROR_MANEUVER,
	mcACPTRAK_GET_SH_ERROR_ENCDIFF,
	mcACPTRAK_GET_SH_ERROR_NOGRIPPER,
	mcACPTRAK_GET_SH_ERROR_COMMAND,
	mcACPTRAK_GET_SH_ERROR_SEGMENT,
	mcACPTRAK_GET_SH_ERROR_ASSEMBLY,
	mcACPTRAK_GET_SH_ERROR_INVMOV,
	mcACPTRAK_GET_SH_ERROR_COUPLING,
	mcACPTRAK_GET_SH_CONVOYMASTER,
	mcACPTRAK_GET_SH_ERROR_CHANNEL
} McAcpTrakGetShuttleModeEnum;

typedef enum McAcpTrakGetShuttleVirtModeEnum
{	mcACPTRAK_GET_SH_VIRT_ALL = 0,
	mcACPTRAK_GET_SH_VIRT_VIRTUAL,
	mcACPTRAK_GET_SH_VIRT_NONVIRTUAL
} McAcpTrakGetShuttleVirtModeEnum;

typedef enum McAcpTrakAsmHomingModeEnum
{	mcACPTRAK_HOME_DISABLED = 0,
	mcACPTRAK_HOME_ALL
} McAcpTrakAsmHomingModeEnum;

typedef enum McAcpTrakMoveCmdEnum
{	mcACPTRAK_MOV_CMD_HALT,
	mcACPTRAK_MOV_CMD_MOVEABS,
	mcACPTRAK_MOV_CMD_ELASTICMOVEABS,
	mcACPTRAK_MOV_CMD_MOVEVEL,
	mcACPTRAK_MOV_CMD_ELASTICMOVEVEL
} McAcpTrakMoveCmdEnum;

typedef enum McAcpTrakMovRestrModeEnum
{	mcACPTRAK_NONE,
	mcACPTRAK_TOWARDS_REF
} McAcpTrakMovRestrModeEnum;

typedef enum McAcpTrakObjectTypeEnum
{	mcACPTRAK_OBJECT_SHUTTLE,
	mcACPTRAK_OBJECT_CONVOY
} McAcpTrakObjectTypeEnum;

typedef enum McAcpTrakOverrideEnum
{	mcACPTRAK_OVERRIDE_VELOCITY
} McAcpTrakOverrideEnum;

typedef enum McAcpTrakPLCopenStateEnum
{	mcACPTRAK_DISABLED,
	mcACPTRAK_HOMING,
	mcACPTRAK_READY,
	mcACPTRAK_STOPPING,
	mcACPTRAK_ERRORSTOP,
	mcACPTRAK_STARTUP,
	mcACPTRAK_INVALID_CONFIGURATION
} McAcpTrakPLCopenStateEnum;

typedef enum McAcpTrakRoutePosRelToEnum
{	mcACPTRAK_SEC_START,
	mcACPTRAK_SEC_END
} McAcpTrakRoutePosRelToEnum;

typedef enum McAcpTrakSearchModeEnum
{	mcACPTRAK_SEARCH_FORWARD,
	mcACPTRAK_SEARCH_BACKWARD
} McAcpTrakSearchModeEnum;

typedef enum McAcpTrakSecTypeEnum
{	mcACPTRAK_SEC_USER_DEFINED,
	mcACPTRAK_SEC_SEGMENT,
	mcACPTRAK_SEC_INTERNAL
} McAcpTrakSecTypeEnum;

typedef enum McAcpTrakSegAppearanceEnum
{	mcACPTRAK_SEG_APPEAR_PHYSICAL,
	mcACPTRAK_SEG_APPEAR_VIRTUAL,
	mcACPTRAK_SEG_APPEAR_EMULATED
} McAcpTrakSegAppearanceEnum;

typedef enum McAcpTrakSegDataTypeEnum
{	mcACPTRAK_SEG_PARTYPE_BOOL = 1,
	mcACPTRAK_SEG_PARTYPE_SINT,
	mcACPTRAK_SEG_PARTYPE_INT,
	mcACPTRAK_SEG_PARTYPE_DINT,
	mcACPTRAK_SEG_PARTYPE_USINT,
	mcACPTRAK_SEG_PARTYPE_UINT,
	mcACPTRAK_SEG_PARTYPE_UDINT,
	mcACPTRAK_SEG_PARTYPE_REAL,
	mcACPTRAK_SEG_PARTYPE_LREAL = 17,
	mcACPTRAK_SEG_PARTYPE_VOID = 65535
} McAcpTrakSegDataTypeEnum;

typedef enum McAcpTrakSegErrorReasonEnum
{	mcACPTRAK_SEG_ERROR_NONE,
	mcACPTRAK_SEG_ERROR_UNSPECIFIED,
	mcACPTRAK_SEG_ERROR_COMMAND,
	mcACPTRAK_SEG_ERROR_SEGMENT,
	mcACPTRAK_SEG_ERROR_ASSEMBLY,
	mcACPTRAK_SEG_ERROR_CHANNEL,
	mcACPTRAK_SEG_ERROR_UNOBSERVABLE,
	mcACPTRAK_SEG_ERROR_ENCDIFF
} McAcpTrakSegErrorReasonEnum;

typedef enum McAcpTrakSegLimitErrorScopeMode
{	mcACPTRAK_UNOBSERV_SH_ACTIVATE,
	mcACPTRAK_UNOBSERV_SH_DEACTIVATE
} McAcpTrakSegLimitErrorScopeMode;

typedef enum McAcpTrakSegProcessParIDModeEnum
{	mcACPTRAK_SEG_PARID_GET = 0,
	mcACPTRAK_SEG_PARID_SET,
	mcACPTRAK_SEG_PARID_GET_NO_NCT,
	mcACPTRAK_SEG_PARID_GET_NO_LOG
} McAcpTrakSegProcessParIDModeEnum;

typedef enum McAcpTrakSegTypeEnum
{	mcACPTRAK_SEG_CIRC,
	mcACPTRAK_SEG_STR_660,
	mcACPTRAK_SEG_STR_105_TO_CIRC,
	mcACPTRAK_SEG_CIRC_TO_STR_105,
	mcACPTRAK_SEG_COMPACT_CURVE_180
} McAcpTrakSegTypeEnum;

typedef enum McAcpTrakSelectShSideEnum
{	mcACPTRAK_SIDE_BOTH = 0
} McAcpTrakSelectShSideEnum;

typedef enum McAcpTrakShAddModeEnum
{	mcACPTRAK_ADD_IMMEDIATE,
	mcACPTRAK_ADD_CATCH,
	mcACPTRAK_ABORT_CATCH
} McAcpTrakShAddModeEnum;

typedef enum McAcpTrakShErrorReasonEnum
{	mcACPTRAK_SH_ERROR_NONE,
	mcACPTRAK_SH_ERROR_UNSPECIFIED,
	mcACPTRAK_SH_ERROR_MANEUVER,
	mcACPTRAK_SH_ERROR_ENCDIFF,
	mcACPTRAK_SH_ERROR_NOGRIPPER,
	mcACPTRAK_SH_ERROR_COMMAND,
	mcACPTRAK_SH_ERROR_SEGMENT,
	mcACPTRAK_SH_ERROR_ASSEMBLY,
	mcACPTRAK_SH_ERROR_INVALIDMOVE,
	mcACPTRAK_SH_ERROR_COUPLING,
	mcACPTRAK_SH_ERROR_CHANNEL
} McAcpTrakShErrorReasonEnum;

typedef enum McAcpTrakShFilterModeEnum
{	mcACPTRAK_SET_IMMEDIATE,
	mcACPTRAK_SET_AVOID_ERRORSTOP
} McAcpTrakShFilterModeEnum;

typedef enum McAcpTrakShInteractCmdEnum
{	mcACPTRAK_SH_ACT_COLLAVOID,
	mcACPTRAK_SH_DEACT_COLLAVOID
} McAcpTrakShInteractCmdEnum;

typedef enum McAcpTrakShLocalLimitCmdEnum
{	mcACPTRAK_LL_ADD_SHUTTLE,
	mcACPTRAK_LL_REMOVE_SHUTTLE,
	mcACPTRAK_LL_ADD_CONVOY,
	mcACPTRAK_LL_REMOVE_CONVOY
} McAcpTrakShLocalLimitCmdEnum;

typedef enum McAcpTrakShManeuverReasonEnum
{	mcACPTRAK_REASON_UNSPECIFIED = 0,
	mcACPTRAK_REASON_SHUTTLE = 1,
	mcACPTRAK_REASON_LOCAL_VEL_LIMIT = 2,
	mcACPTRAK_REASON_BARRIER = 3,
	mcACPTRAK_REASON_SECTOREND = 4,
	mcACPTRAK_REASON_SECTORSWITCH = 5,
	mcACPTRAK_REASON_LOGISTICS = 6,
	mcACPTRAK_REASON_NONE = 7,
	mcACPTRAK_REASON_LOCAL_ACC_LIMIT = 8,
	mcACPTRAK_REASON_UNCONTROLLED = 9,
	mcACPTRAK_REASON_RECONTROLLED = 10,
	mcACPTRAK_REASON_CONVOY = 11,
	mcACPTRAK_REASON_CON_DIFF_SECTOR = 12,
	mcACPTRAK_REASON_CON_INV_REF = 13,
	mcACPTRAK_REASON_CON_SECSWITCH = 14,
	mcACPTRAK_REASON_CON_UNCONTR = 15,
	mcACPTRAK_REASON_CON_RIGID_MOVE = 16,
	mcACPTRAK_REASON_CON_TCP = 17,
	mcACPTRAK_REASON_LOCAL_DEC_LIMIT = 18
} McAcpTrakShManeuverReasonEnum;

typedef enum McAcpTrakShManeuverTypeEnum
{	mcACPTRAK_MANEUVER_NONE = 0,
	mcACPTRAK_MANEUVER_ADJUSTMENT = 1,
	mcACPTRAK_MANEUVER_STANDSTILL = 2,
	mcACPTRAK_MANEUVER_EMERGENCY = 3
} McAcpTrakShManeuverTypeEnum;

typedef enum McAcpTrakShMovementTypeEnum
{	mcACPTRAK_MOVEMENT_STANDSTILL,
	mcACPTRAK_MOVEMENT_ELASTIC,
	mcACPTRAK_MOVEMENT_RIGID
} McAcpTrakShMovementTypeEnum;

typedef enum McAcpTrakShReadRecInfoTrigEnum
{	mcACPTRAK_UNCONTROLLEDERRORSTOP,
	mcACPTRAK_UNCONTROLLED
} McAcpTrakShReadRecInfoTrigEnum;

typedef enum McAcpTrakShRelativeAlignmentEnum
{	mcACPTRAK_ALIGNED_FRONT_TO_BACK,
	mcACPTRAK_ALIGNED_BACK_TO_FRONT,
	mcACPTRAK_ALIGNED_FRONT_TO_FRONT,
	mcACPTRAK_ALIGNED_BACK_TO_BACK
} McAcpTrakShRelativeAlignmentEnum;

typedef enum McAcpTrakShRelativeRefPointEnum
{	mcACPTRAK_DIST_CENTER_TO_CENTER,
	mcACPTRAK_DIST_CENTER_TO_EXTENT,
	mcACPTRAK_DIST_EXTENT_TO_CENTER,
	mcACPTRAK_DIST_EXTENT_TO_EXTENT
} McAcpTrakShRelativeRefPointEnum;

typedef enum McAcpTrakShResizeCmdEnum
{	mcACPTRAK_RESIZE_DIMENSIONS
} McAcpTrakShResizeCmdEnum;

typedef enum McAcpTrakShResizeModeEnum
{	mcACPTRAK_RESIZE_IMMEDIATE,
	mcACPTRAK_RESIZE_AVOID_ERRORSTOP
} McAcpTrakShResizeModeEnum;

typedef enum McAcpTrakSimulationOnPlcEnum
{	mcACPTRAK_SIM_STATE_OFF,
	mcACPTRAK_SIM_STATE_ON
} McAcpTrakSimulationOnPlcEnum;

typedef enum McAcpTrakTrgPointEventEnum
{	mcACPTRAK_TP_PASSED_NEGATIVE,
	mcACPTRAK_TP_PASSED_POSITIVE
} McAcpTrakTrgPointEventEnum;

typedef enum McAcpTrakMoveCycTcpVelModeEnum
{	mcACPTRAK_TCP_COORDSYS_X_VEL,
	mcACPTRAK_TCP_ABS_VEL
} McAcpTrakMoveCycTcpVelModeEnum;

typedef enum McASMTrkPosEnum
{	mcASMTP_ABS = 0,
	mcASMTP_REL_TO_ONE_SEG = 1,
	mcASMTP_REL_TO_TWO_SEG = 2
} McASMTrkPosEnum;

typedef enum McASMTrkPosAbsSegCntDirEnum
{	mcASMTPASCD_RIGHT_TO_LFT = 0,
	mcASMTPASCD_LFT_TO_RIGHT = 1
} McASMTrkPosAbsSegCntDirEnum;

typedef enum McASMSegPosRelToEnum
{	mcASMSPRT_ST_OF_SEG = 0,
	mcASMSPRT_END_OF_SEG = 1
} McASMSegPosRelToEnum;

typedef enum McASMCSSActSegSimOnPLCEnum
{	mcASMCSSASSOP_OFF = 0,
	mcASMCSSASSOP_ON = 1
} McASMCSSActSegSimOnPLCEnum;

typedef enum McASMCSSStopReacEnum
{	mcASMCSSSR_INDUCT_HALT = 0,
	mcASMCSSSR_COAST_TO_STANDSTILL = 1,
	mcASMCSSSR_SSMAN = 2
} McASMCSSStopReacEnum;

typedef enum McASMCSSStopReacSsmanFbEnum
{	mcASMCSSSRSF_INDUCT_HALT = 0,
	mcASMCSSSRSF_COAST_TO_STANDSTILL = 1
} McASMCSSStopReacSsmanFbEnum;

typedef enum McASMCSSSpdFltrEnum
{	mcASMCSSSF_NOT_USE = 0,
	mcASMCSSSF_LP_1ST_ORD = 1
} McASMCSSSpdFltrEnum;

typedef enum McASMCSSCPDPSForLimEnum
{	mcASMCSSCPDPSFL_INACT = 0,
	mcASMCSSCPDPSFL_CTRL = 1,
	mcASMCSSCPDPSFL_CTRL_W_F_FWD = 2
} McASMCSSCPDPSForLimEnum;

typedef enum McASMCSSCPAPSEnum
{	mcASMCSSCPAPS_NOT_USE = 0,
	mcASMCSSCPAPS_USE = 1
} McASMCSSCPAPSEnum;

typedef enum McASMCSSCPAPSUseParSetCtrlEnum
{	mcASMCSSCPAPSUPSC_USE_DEF_VAL = 0,
	mcASMCSSCPAPSUPSC_USE_EXP_VAL = 1
} McASMCSSCPAPSUseParSetCtrlEnum;

typedef enum McASMCSSCPAPSUseParSetForLimEnum
{	mcASMCSSCPAPSUPSFL_USE_DEF_VAL = 0,
	mcASMCSSCPAPSUPSFL_INACT = 1,
	mcASMCSSCPAPSUPSFL_CTRL = 2,
	mcASMCSSCPAPSUPSFL_CTRL_W_F_FWD = 3
} McASMCSSCPAPSUseParSetForLimEnum;

typedef enum McASMCSSCPAPSUPSMoveErrLimEnum
{	mcASMCSSCPAPSUPSMEL_USE_DEF_VAL = 0,
	mcASMCSSCPAPSUPSMEL_USE_EXP_VAL = 1
} McASMCSSCPAPSUPSMoveErrLimEnum;

typedef enum McASMCSSCPAPSUPSDivEnum
{	mcASMCSSCPAPSUPSDIV_USE_DEF_VAL = 0,
	mcASMCSSCPAPSUPSDIV_USE_EXP_VAL = 1
} McASMCSSCPAPSUPSDivEnum;

typedef enum McASMCSSCoggingCompEnum
{	mcASMCSSCCC_INACT = 0,
	mcASMCSSCCC_ACT = 1
} McASMCSSCoggingCompEnum;

typedef enum McASMCSSElongationCompEnum
{	mcASMCSSCEC_INACT = 0,
	mcASMCSSCEC_ACT = 1
} McASMCSSElongationCompEnum;

typedef enum McASMCSSScpErrReacEnum
{	mcASMCSSSER_ASM = 0,
	mcASMCSSSER_SEG = 1,
	mcASMCSSSER_SEGMENTADVANCED = 2
} McASMCSSScpErrReacEnum;

typedef enum McASMCSSPosCtrlLagMonEnum
{	mcASMCSSPCLM_INACT = 0,
	mcASMCSSPCLM_ACT = 1
} McASMCSSPosCtrlLagMonEnum;

typedef enum McASMShConFunEnum
{	mcASMSCF_INACT = 0,
	mcASMSCF_ACT = 1
} McASMShConFunEnum;

typedef enum McASMShSSASEnum
{	mcASMSSSAS_SW_ONTO_SEG_SEC = 0,
	mcASMSSSAS_AUT_ATT = 1,
	mcASMSSSAS_RMN_ON_INT_SEC = 2
} McASMShSSASEnum;

typedef enum McASMShSSASSwOntoSegSecScpEnum
{	mcASMSSSASSOSSS_SH_ONLY = 0,
	mcASMSSSASSOSSS_ALL = 1
} McASMShSSASSwOntoSegSecScpEnum;

typedef enum McASMShSSASAutAttFallbackEnum
{	mcASMSSSASAAF_SEG_SEC = 0,
	mcASMSSSASAAF_INT_SEC = 1
} McASMShSSASAutAttFallbackEnum;

typedef enum McASMShSSASRmnOnIntSecScpEnum
{	mcASMSSSASROISS_CON_ONLY = 0,
	mcASMSSSASROISS_ALL = 1
} McASMShSSASRmnOnIntSecScpEnum;

typedef enum McASMShMagnPltCfgShTypEnum
{	mcASMSMPCST_ST8F1SX100 = 0,
	mcASMSMPCST_ST8F1SX102 = 1,
	mcASMSMPCST_ST8F1SA104 = 2,
	mcASMSMPCST_ST8F1SA106 = 3,
	mcASMSMPCST_ST8F1SA201 = 4,
	mcASMSMPCST_ST8F1SC201 = 7,
	mcASMSMPCST_ST8F1SA203 = 5,
	mcASMSMPCST_ST8F1SC203 = 8,
	mcASMSMPCST_ST8F1SB308 = 6
} McASMShMagnPltCfgShTypEnum;

typedef enum McASMShColAvStratEnum
{	mcASMSCAS_CONST = 0,
	mcASMSCAS_VAR = 1,
	mcASMSCAS_ADV_CONST = 2,
	mcASMSCAS_ADV_VAR = 3
} McASMShColAvStratEnum;

typedef enum McASMShColAvAdjModEnum
{	mcASMSCAAM_BASIC = 0,
	mcASMSCAAM_DENSE = 1
} McASMShColAvAdjModEnum;

typedef enum McASMShVSCASEnum
{	mcASMShVSCAS_ALL_SH = 0,
	mcASMShVSCAS_NO_SH = 1,
	mcASMShVSCAS_NON_VIRT_SH_ONLY = 2
} McASMShVSCASEnum;

typedef enum McASMVisProcTskCEnum
{	mcASMVPTC_CYC_1 = 1,
	mcASMVPTC_CYC_2 = 2,
	mcASMVPTC_CYC_3 = 3,
	mcASMVPTC_CYC_4 = 4,
	mcASMVPTC_CYC_5 = 5,
	mcASMVPTC_CYC_6 = 6,
	mcASMVPTC_CYC_7 = 7,
	mcASMVPTC_CYC_8 = 8
} McASMVisProcTskCEnum;

typedef enum McAFSSDShOnSecOrientEnum
{	mcAFSSDSOSO_POS = 0,
	mcAFSSDSOSO_NEG = 1
} McAFSSDShOnSecOrientEnum;

typedef enum McAFSSDShOnSecDefEnum
{	mcAFSSDSOSD_SNG_SH = 0,
	mcAFSSDSOSD_SET_OF_SH = 1
} McAFSSDShOnSecDefEnum;

typedef enum McAFSTSecTrcCfgSecRstEnum
{	mcAFSTSTCSR_ON = 0,
	mcAFSTSTCSR_OFF = 1
} McAFSTSecTrcCfgSecRstEnum;

typedef enum McAFSAAPrioOrientEnum
{	mcAFSAAPO_KEEP_SEG_ORIENT = 0,
	mcAFSAAPO_POS = 1,
	mcAFSAAPO_NEG = 2
} McAFSAAPrioOrientEnum;

typedef enum McAFLLScpEnum
{	mcAFLLS_ALL_SH = 0,
	mcAFLLS_SNG_SH = 1
} McAFLLScpEnum;

typedef enum McAFLLLocEnum
{	mcAFLLL_SEC = 0,
	mcAFLLL_CRV_AREA = 1,
	mcAFLLL_DUALTRK_AREA = 2
} McAFLLLocEnum;

typedef enum McAFLLMotLimVelEnum
{	mcAFLLMLV_NOT_USE = 0,
	mcAFLLMLV_BASIC = 1,
	mcAFLLMLV_ADV = 2
} McAFLLMotLimVelEnum;

typedef enum McAFLLMotLimAccEnum
{	mcAFLLMLA_NOT_USE = 0,
	mcAFLLMLA_BASIC = 1,
	mcAFLLMLA_ADV = 2
} McAFLLMotLimAccEnum;

typedef enum McAFESExFromEnum
{	mcAFESEF_ASM_PWR_ON = 0
} McAFESExFromEnum;

typedef enum McSTypEnum
{	mcST_COMP_SEC = 0,
	mcST_SUB_SEC = 1
} McSTypEnum;

typedef enum McSCSegPosRelToEnum
{	mcSCSPRT_ST_OF_SEG = 0,
	mcSCSPRT_END_OF_SEG = 1
} McSCSegPosRelToEnum;

typedef enum McSSStPosRelToEnum
{	mcSSSPRT_ST_OF_SEC = 0,
	mcSSSPRT_END_OF_SEC = 1
} McSSStPosRelToEnum;

typedef enum McSSDirEnum
{	mcSSD_POS = 0,
	mcSSD_NEG = 1
} McSSDirEnum;

typedef enum McSSTMeasUnitEnum
{	mcSSTMU_M = 5067858
} McSSTMeasUnitEnum;

typedef enum McSSTMoveLimEnum
{	mcSSTML_INT = 0
} McSSTMoveLimEnum;

typedef enum McSSTMoveLimIntVelEnum
{	mcSSTMLIV_BASIC = 0
} McSSTMoveLimIntVelEnum;

typedef enum McSSTMoveLimIntAccEnum
{	mcSSTMLIA_BASIC = 0
} McSSTMoveLimIntAccEnum;

typedef enum McSSTMoveLimIntDecEnum
{	mcSSTMLID_BASIC = 0
} McSSTMoveLimIntDecEnum;

typedef enum McSSTMoveLimIntUpdModEnum
{	mcSSTMLIUM_IMMED = 0,
	mcSSTMLIUM_AVOID_ERR_STOP = 1
} McSSTMoveLimIntUpdModEnum;

typedef enum McSSTJerkFltrEnum
{	mcSSTJF_USE = 0,
	mcSSTJF_NOT_USE = 1
} McSSTJerkFltrEnum;

typedef enum McSSTZVFEnum
{	mcSSTZVF_NOT_USE = 0,
	mcSSTZVF_USE = 1
} McSSTZVFEnum;

typedef enum McSSTCAIMDEnum
{	mcSSTCAIMD_USE_MAX_DIM = 0,
	mcSSTCAIMD_USE_EXP_VAL = 1
} McSSTCAIMDEnum;

typedef enum McSSTStatTransAutReCtrlEnum
{	mcSSTSTARC_INACT = 0,
	mcSSTSTARC_ACT = 1
} McSSTStatTransAutReCtrlEnum;

typedef enum McSEGSegSecDirEnum
{	mcSEGSSD_POS = 0,
	mcSEGSSD_NEG = 1
} McSEGSegSecDirEnum;

typedef enum McSEGAppearEnum
{	mcSEGA_PHS = 0,
	mcSEGA_VIRT = 1,
	mcSEGA_EMU = 2
} McSEGAppearEnum;

typedef enum McSEGElongationCompEnum
{	mcSEGCEC_USE_ASM_SET = 0,
	mcSEGCEC_INACT = 1,
	mcSEGCEC_ACT = 2
} McSEGElongationCompEnum;

typedef enum McSEGAsymmetricCurCompEnum
{	mcSEGCACC_INACT = 0,
	mcSEGCACC_ACT = 1
} McSEGAsymmetricCurCompEnum;

typedef enum McSEGStopReacEnum
{	mcSEGSR_USE_ASM_SET = 0,
	mcSEGSR_INDUCT_HALT = 1,
	mcSEGSR_COAST_TO_STANDSTILL = 2,
	mcSEGSR_SSMAN = 3
} McSEGStopReacEnum;

typedef enum McSEGStopReacSsmanFbEnum
{	mcSEGSRSF_INDUCT_HALT = 0,
	mcSEGSRSF_COAST_TO_STANDSTILL = 1
} McSEGStopReacSsmanFbEnum;

typedef enum McSEGSpdFltrEnum
{	mcSEGSF_USE_ASM_SET = 0,
	mcSEGSF_NOT_USE = 1,
	mcSEGSF_LP_1ST_ORD = 2
} McSEGSpdFltrEnum;

typedef enum McSEGPosLagMonEnum
{	mcSEGPCLM_USE_ASM_SET = 0,
	mcSEGPCLM_INACT = 1,
	mcSEGPCLM_ACT = 2
} McSEGPosLagMonEnum;

typedef enum McVIRTSEGSegShpEnum
{	mcVIRTSEGSS_STR = 0,
	mcVIRTSEGSS_CRV_AB = 1,
	mcVIRTSEGSS_CRV_BA = 2,
	mcVIRTSEGSS_CIR = 3,
	mcVIRTSEGSS_CMPCT_CRV_180 = 4
} McVIRTSEGSegShpEnum;

typedef enum McVIRTSEGEmuEnum
{	mcVIRTSEGE_INACT = 0,
	mcVIRTSEGE_ACT = 1
} McVIRTSEGEmuEnum;

typedef struct McAcpTrakForceControlParameter
{	plcbit Enable;
	float Force;
} McAcpTrakForceControlParameter;

typedef struct McAcpTrakAdvAsmCmdErrParType
{	plcstring SegmentGroup[33];
} McAcpTrakAdvAsmCmdErrParType;

typedef struct McAcpTrakAdvAsmDeleteShParType
{	plcstring SegmentGroup[33];
	plcbit SuppressFollowUpErrLogEntries;
} McAcpTrakAdvAsmDeleteShParType;

typedef struct McAcpTrakAdvAsmGetSecParType
{	enum McAcpTrakGetSectorModeEnum SelectionMode;
} McAcpTrakAdvAsmGetSecParType;

typedef struct McAcpTrakAdvAsmGetSegParType
{	enum McAcpTrakGetSegmentModeEnum SelectionMode;
	plcstring SegmentGroup[33];
} McAcpTrakAdvAsmGetSegParType;

typedef struct McAcpTrakAdvAsmGetShParType
{	enum McAcpTrakGetShuttleModeEnum SelectionMode;
	enum McAcpTrakGetShuttleVirtModeEnum VirtualSelectionMode;
	plcstring SegmentGroup[33];
} McAcpTrakAdvAsmGetShParType;

typedef struct McAcpTrakAdvAsmOverrideParType
{	enum McAcpTrakGetShuttleVirtModeEnum VirtualSelectionMode;
} McAcpTrakAdvAsmOverrideParType;

typedef struct McAcpTrakAdvAsmPowerOffParType
{	enum McStopModeEnum StopMode;
	float Deceleration;
	plcstring SegmentGroup[33];
} McAcpTrakAdvAsmPowerOffParType;

typedef struct McAcpTrakAdvAsmPowerOnParType
{	plcstring SegmentGroup[33];
	enum McAcpTrakAsmHomingModeEnum HomingMode;
} McAcpTrakAdvAsmPowerOnParType;

typedef struct McAcpTrakAdvAsmReadInfoParType
{	plcstring SegmentGroup[33];
} McAcpTrakAdvAsmReadInfoParType;

typedef struct McAcpTrakAdvAsmStopParType
{	enum McStopModeEnum StopMode;
	float Deceleration;
	plcstring SegmentGroup[33];
} McAcpTrakAdvAsmStopParType;

typedef struct McAcpTrakAdvBarrierGetShParType
{	enum McAcpTrakBarrierGetShModeEnum SelectionMode;
} McAcpTrakAdvBarrierGetShParType;

typedef struct McAcpTrakAdvBarrierParType
{	signed long TicketCount;
} McAcpTrakAdvBarrierParType;

typedef struct McAcpTrakAdvConDeleteParType
{	enum McAcpTrakConDeleteModeEnum Mode;
} McAcpTrakAdvConDeleteParType;

typedef struct McAcpTrakAdvConGetShParType
{	enum McAcpTrakConGetShuttleModeEnum Mode;
	enum McAcpTrakConGetShSelectModeEnum SelectionMode;
} McAcpTrakAdvConGetShParType;

typedef struct McAcpTrakAdvCopySegDataType
{	unsigned long SegmentID;
	enum McAcpTrakCopySegDataTriggerEnum Trigger;
	unsigned long DataAddress;
	unsigned long DataSize;
	plcbit NoLog;
} McAcpTrakAdvCopySegDataType;

typedef struct McAcpTrakAdvCopyShDataType
{	unsigned long ShuttleID;
	enum McAcpTrakCopyShDataTriggerEnum Trigger;
	unsigned long DataAddress;
	unsigned long DataSize;
	plcbit NoLog;
} McAcpTrakAdvCopyShDataType;

typedef struct McAcpTrakAdvGetMinShDistParType
{	enum McAcpTrakShRelativeRefPointEnum MeasurePointsMode;
	struct McAxisType* Shuttle1;
	struct McAxisType* Shuttle2;
} McAcpTrakAdvGetMinShDistParType;

typedef struct McAcpTrakAdvGetPositionParType
{	double Position;
	double StartPosition;
	double EndPosition;
} McAcpTrakAdvGetPositionParType;

typedef struct McAcpTrakAdvRouteInfoBarrierType
{	plcbit Blocked;
} McAcpTrakAdvRouteInfoBarrierType;

typedef struct McAcpTrakAdvRouteInfoSectorType
{	double RouteLength;
	plcbit HasDiverter;
} McAcpTrakAdvRouteInfoSectorType;

typedef struct McAcpTrakAdvRouteInfoSegmentType
{	plcbit Blocked;
	unsigned long NumberDisabled;
	unsigned long NumberErrorStop;
	unsigned long Number;
} McAcpTrakAdvRouteInfoSegmentType;

typedef struct McAcpTrakAdvRouteInfoShuttleType
{	plcbit Blocked;
	unsigned long NumberDisabled;
	unsigned long NumberErrorStop;
	unsigned long Number;
} McAcpTrakAdvRouteInfoShuttleType;

typedef struct McAcpTrakAdvRouteInfoProcPntType
{	unsigned long Number;
} McAcpTrakAdvRouteInfoProcPntType;

typedef struct McAcpTrakAdvRouteInfoType
{	enum McAcpTrakAdvRouteInfoValidEnum Validity;
	struct McAcpTrakAdvRouteInfoSectorType SectorInfo;
	struct McAcpTrakAdvRouteInfoSegmentType SegmentInfo;
	struct McAcpTrakAdvRouteInfoShuttleType ShuttleInfo;
	struct McAcpTrakAdvRouteInfoBarrierType BarrierInfo;
	struct McAcpTrakAdvRouteInfoProcPntType ProcessPointInfo;
	plcbit Blocked;
} McAcpTrakAdvRouteInfoType;

typedef struct McAcpTrakRouteInfoComponentsType
{	unsigned long DataAddress;
	unsigned long DataSize;
} McAcpTrakRouteInfoComponentsType;

typedef struct McAcpTrakRouteInfoParameters
{	struct McAcpTrakRouteInfoComponentsType ProcessPoints;
	struct McAcpTrakRouteInfoComponentsType Segments;
	struct McAcpTrakRouteInfoComponentsType Shuttles;
	double Horizon;
} McAcpTrakRouteInfoParameters;

typedef struct McAcpTrakAdvRouteParType
{	enum McDirectionEnum StartDirection;
	enum McDirectionEnum EndDirection;
	enum McDirectionEnum ShuttleOrientation;
	struct McAcpTrakRouteTransitPointsType* TransitPoints;
	unsigned short NumberOfTransitPoints;
	enum McAcpTrakRoutePosRelToEnum PosRelativeTo;
	struct McAcpTrakRouteInfoParameters RouteInfoParameters;
} McAcpTrakAdvRouteParType;

typedef struct McAcpTrakAdvMoveCycParType
{	float Velocity;
	float Acceleration;
	float Deceleration;
	enum McSwitchEnum DisableMotionFilter;
} McAcpTrakAdvMoveCycParType;

typedef struct McAcpTrakAdvSecAddShuttleType
{	enum McAcpTrakMoveCmdEnum MoveCmd;
	double Position;
	float Velocity;
	float Acceleration;
	float Deceleration;
	float Jerk;
	enum McDirectionEnum Direction;
	plcbit Virtual;
	enum McAcpTrakShAddModeEnum Mode;
	plcstring UserID[33];
	unsigned long UserState;
	unsigned long VirtualShuttleID;
} McAcpTrakAdvSecAddShuttleType;

typedef struct McAcpTrakAdvSecGetShParType
{	enum McAcpTrakGetShuttleModeEnum SelectionMode;
	enum McAcpTrakGetShuttleVirtModeEnum VirtualSelectionMode;
	double StartPosition;
	double EndPosition;
} McAcpTrakAdvSecGetShParType;

typedef struct McAcpTrakAdvSecStopParType
{	enum McStopModeEnum StopMode;
	double StartPosition;
	double EndPosition;
	float Deceleration;
} McAcpTrakAdvSecStopParType;

typedef struct McAcpTrakAdvSegPowerOffParType
{	enum McStopModeEnum StopMode;
	float Deceleration;
} McAcpTrakAdvSegPowerOffParType;

typedef struct McAcpTrakAdvSegSimParType
{	plcbit SegmentEnable;
	plcbit MovementDetected;
	plcbit UnknownMovementDetected;
	plcbit NetworkFailure;
	double PositionLag;
} McAcpTrakAdvSegSimParType;

typedef struct McAcpTrakAdvShCamAutCmdParType
{	plcbit Elastic;
	float Deceleration;
} McAcpTrakAdvShCamAutCmdParType;

typedef struct McAcpTrakAdvShConvoyParType
{	struct McAxisType* ConvoyMaster;
	double TargetDistance;
	float Velocity;
	float Acceleration;
	float Deceleration;
	struct McPosType Tcp;
	struct McPosType ReferenceTcp;
	enum McAcpTrakMovRestrModeEnum MovementRestriction;
} McAcpTrakAdvShConvoyParType;

typedef struct McAcpTrakAdvShReadFrameParType
{	enum McAcpTrakCenterPointEnum CenterPointMode;
} McAcpTrakAdvShReadFrameParType;

typedef struct McAcpTrakAdvShReadRecInfoParType
{	enum McAcpTrakShReadRecInfoTrigEnum Trigger;
} McAcpTrakAdvShReadRecInfoParType;

typedef struct McAcpTrakAdvShReadSecPosParType
{	double StartPosition;
	double EndPosition;
} McAcpTrakAdvShReadSecPosParType;

typedef struct McAcpTrakAdvShRemoveConParType
{	float Deceleration;
} McAcpTrakAdvShRemoveConParType;

typedef struct McAcpTrakAdvShSwitchSecParType
{	float Deceleration;
	double StartPosition;
	double EndPosition;
	plcbit FlipOrientation;
} McAcpTrakAdvShSwitchSecParType;

typedef struct McSegmentType
{	struct McInternalSegmentIfType* controlif;
} McSegmentType;

typedef struct McAcpTrakSegPositionType
{	struct McSegmentType Segment;
	plcstring Name[33];
	double Position;
} McAcpTrakSegPositionType;

typedef struct McAcpTrakAsmErrorEncdiffInfoType
{	double Difference;
	struct McAcpTrakSegPositionType LowPosition;
	struct McAcpTrakSegPositionType HighPosition;
} McAcpTrakAsmErrorEncdiffInfoType;

typedef struct McAcpTrakAsmErrorSegmentInfoType
{	struct McSegmentType Segment;
	plcstring SegmentName[33];
} McAcpTrakAsmErrorSegmentInfoType;

typedef struct McAcpTrakAsmErrorUnobsShInfoType
{	struct McAxisType Shuttle;
	unsigned long ShuttleID;
	plcstring UserID[33];
	struct McAcpTrakSegPositionType SegmentPosition;
} McAcpTrakAsmErrorUnobsShInfoType;

typedef struct McAcpTrakAsmErrorInfoType
{	enum McAcpTrakAsmErrorReasonEnum Reason;
	struct McAcpTrakAsmErrorEncdiffInfoType EncdiffErrorInfo;
	struct McAcpTrakAsmErrorSegmentInfoType SegmentErrorInfo;
	struct McAcpTrakAsmErrorUnobsShInfoType UnobservableShuttleErrorInfo;
	plcbit Initiator;
} McAcpTrakAsmErrorInfoType;

typedef struct McAcpTrakAsmGetInfoType
{	plcstring Name[33];
	enum McAcpTrakSimulationOnPlcEnum SimulationOnPlcMode;
} McAcpTrakAsmGetInfoType;

typedef struct McAcpTrakAsmGetMinShDistType
{	double Curve;
	double Diverter;
	double Straight;
} McAcpTrakAsmGetMinShDistType;

typedef struct McAcpTrakAsmGetShAddInfoType
{	unsigned long ShuttleID;
	unsigned long UserState;
} McAcpTrakAsmGetShAddInfoType;

typedef struct McAcpTrakShuttleCountType
{	unsigned short Count;
	unsigned short InStandstill;
	unsigned short InDisabled;
	unsigned short InStopping;
	unsigned short InErrorStop;
	unsigned short VirtualShuttles;
	unsigned short Convoys;
} McAcpTrakShuttleCountType;

typedef struct McAcpTrakSegmentCountType
{	unsigned short InDisabled;
	unsigned short InStopping;
	unsigned short InErrorStop;
} McAcpTrakSegmentCountType;

typedef struct McAcpTrakCurrentOverrideType
{	float Velocity;
} McAcpTrakCurrentOverrideType;

typedef struct McAcpTrakAsmInfoType
{	plcbit CommunicationReady;
	plcbit ReadyForPowerOn;
	plcbit PowerOn;
	unsigned long StartupCount;
	struct McAcpTrakShuttleCountType ShuttleCount;
	struct McAcpTrakSegmentCountType SegmentCount;
	enum McAcpTrakPLCopenStateEnum PLCopenState;
	plcbit MovementDetected;
	struct McAcpTrakCurrentOverrideType Override;
} McAcpTrakAsmInfoType;

typedef struct McAcpTrakShuttleMonData
{	plcbit Available;
	struct McPosType Position;
	struct McOrientType Orientation;
	double ExtentToFront;
	double ExtentToBack;
	double Width;
	unsigned long UserData;
	unsigned long Index;
} McAcpTrakShuttleMonData;

typedef struct McAcpTrakAssemblyMonData
{	struct McAcpTrakShuttleMonData Shuttle[250];
} McAcpTrakAssemblyMonData;

typedef struct McAcpTrakShuttleVisData
{	plcbit Available;
	unsigned char Reserved[3];
	float PositionX;
	float PositionY;
	float RotationZ;
	plcstring Text[32];
	float ColorRed;
	float ColorGreen;
	float ColorBlue;
	float ExtentToFront;
	float ExtentToBack;
	float Width;
} McAcpTrakShuttleVisData;

typedef struct McAcpTrakAssemblyVisData
{	struct McAcpTrakShuttleVisData Shuttle[250];
} McAcpTrakAssemblyVisData;

typedef struct McAcpTrakBarrierGetShInfoType
{	unsigned long ShuttleID;
	unsigned long UserState;
	double Distance;
} McAcpTrakBarrierGetShInfoType;

typedef struct McAcpTrakBarrierInfoType
{	enum McAcpTrakBarrierStatusEnum Status;
	unsigned long RemainingTickets;
} McAcpTrakBarrierInfoType;

typedef struct McAcpTrakProcPointInfoType
{	plcbit Enabled;
	double Throughput;
} McAcpTrakProcPointInfoType;

typedef struct McAcpTrakConGetShAddInfoType
{	unsigned long ShuttleID;
	double Position;
	enum McDirectionEnum Orientation;
} McAcpTrakConGetShAddInfoType;

typedef struct McAcpTrakConInfoType
{	unsigned short MemberCount;
	unsigned short ShuttleCount;
	double ActualPositiveOffset;
	double ActualNegativeOffset;
	plcbit InRest;
} McAcpTrakConInfoType;

typedef struct McAcpTrakConvoyParType
{	double PositiveOffset;
	double NegativeOffset;
	plcbit Elastic;
	plcbit Separable;
	plcbit MasterVelocityAdjustment;
	float TargetDistDeceleration;
} McAcpTrakConvoyParType;

typedef struct McAcpTrakDateTimeType
{	unsigned short Year;
	unsigned short Month;
	unsigned short Day;
	unsigned short Hour;
	unsigned short Minute;
	unsigned short Second;
	unsigned short Millisec;
} McAcpTrakDateTimeType;

typedef struct McAcpTrakCopySegDataInfoType
{	struct McAcpTrakDateTimeType TimeStamp;
} McAcpTrakCopySegDataInfoType;

typedef struct McAcpTrakCopyShDataInfoType
{	struct McAcpTrakDateTimeType TimeStamp;
} McAcpTrakCopyShDataInfoType;

typedef struct McAcpTrakSegIntervalType
{	struct McSegmentType Segment;
	plcstring Name[33];
	double StartPosition;
	double EndPosition;
} McAcpTrakSegIntervalType;

typedef struct McAcpTrakDualTrackInfoType
{	struct McAcpTrakSegIntervalType Segment1;
	struct McAcpTrakSegIntervalType Segment2;
} McAcpTrakDualTrackInfoType;

typedef struct McAcpTrakTargetPositionType
{	plcbit Valid;
	double Position;
	enum McDirectionEnum Orientation;
} McAcpTrakTargetPositionType;

typedef struct McAcpTrakGetPositionInfoType
{	struct McAcpTrakTargetPositionType TargetPosition;
	struct McAcpTrakSegPositionType SegmentPosition;
} McAcpTrakGetPositionInfoType;

typedef struct McSectorType
{	struct McInternalSectorIfType* controlif;
} McSectorType;

typedef struct McAcpTrakSecPositionType
{	struct McSectorType Sector;
	plcstring Name[33];
	double Position;
} McAcpTrakSecPositionType;

typedef struct McAcpTrakProcPointGetInfoType
{	struct McAcpTrakSecPositionType SectorPosition;
} McAcpTrakProcPointGetInfoType;

typedef struct McAcpTrakRouteTransitPointsType
{	struct McSectorType* Sector;
	double Position;
	enum McDirectionEnum TransitDirection;
} McAcpTrakRouteTransitPointsType;

typedef struct McAcpTrakSecAddShuttleInfoType
{	enum McAxisPLCopenStateEnum PLCopenState;
} McAcpTrakSecAddShuttleInfoType;

typedef struct McAcpTrakSecGetInfoType
{	double Length;
	plcbit SectorClosed;
	plcstring Name[33];
	enum McAcpTrakSecTypeEnum Type;
} McAcpTrakSecGetInfoType;

typedef struct McAcpTrakSecGetShAddInfoType
{	unsigned long ShuttleID;
	unsigned long UserState;
	double Position;
	enum McDirectionEnum Orientation;
} McAcpTrakSecGetShAddInfoType;

typedef struct McAcpTrakSecInfoType
{	struct McAcpTrakShuttleCountType ShuttleCount;
	plcbit InRest;
} McAcpTrakSecInfoType;

typedef struct McAcpTrakSegErrorChannelInfoType
{	struct McAxisType Shuttle;
	unsigned long ShuttleID;
	plcstring UserID[33];
	double Position;
} McAcpTrakSegErrorChannelInfoType;

typedef struct McAcpTrakSegErrorInfoType
{	enum McAcpTrakSegErrorReasonEnum Reason;
	struct McAcpTrakSegErrorChannelInfoType ChannelErrorInfo;
	plcbit Initiator;
} McAcpTrakSegErrorInfoType;

typedef struct McAcpTrakSegGetInfoType
{	plcstring Name[33];
	unsigned short ID;
	enum McAcpTrakSegTypeEnum Type;
	enum McAcpTrakSegAppearanceEnum Appearance;
	double Length;
	unsigned long NodeNumber;
	plcstring PlkInterface[33];
	unsigned char ChannelCount;
	struct McFrameType StartFrame;
	struct McFrameType EndFrame;
} McAcpTrakSegGetInfoType;

typedef struct McAcpTrakSegInfoType
{	plcbit CommunicationReady;
	plcbit ReadyForPowerOn;
	plcbit HomingActive;
	plcbit PowerOn;
	unsigned long StartupCount;
	enum McCommunicationStateEnum CommunicationState;
	plcbit SegmentEnable;
	plcbit MovementDetected;
	plcbit UnknownMovementDetected;
	enum McAcpTrakPLCopenStateEnum PLCopenState;
	plcbit PositionControllerLagWarning;
} McAcpTrakSegInfoType;

typedef struct McAcpTrakSegmentData
{	unsigned long SegmentID;
	enum McAcpTrakPLCopenStateEnum PLCopenState;
	enum McAcpTrakSegErrorReasonEnum ErrorReason;
	plcbit CommunicationReady;
	plcbit ReadyForPowerOn;
	plcbit PowerOn;
	plcbit SegmentEnable;
	plcbit MovementDetected;
	plcbit ErrorInitiator;
} McAcpTrakSegmentData;

typedef struct McAcpTrakSegProcessParIDType
{	unsigned short ParID;
	unsigned long VariableAddress;
	enum McAcpTrakSegDataTypeEnum DataType;
} McAcpTrakSegProcessParIDType;

typedef struct McAcpTrakShAddInfoType
{	unsigned long ID;
	plcstring UserID[33];
	enum McAxisPLCopenStateEnum PLCopenState;
	plcbit Controllable;
	plcbit Virtual;
	enum McAcpTrakShErrorReasonEnum ErrorReason;
} McAcpTrakShAddInfoType;

typedef struct McAcpTrakShCamAutCmdCommandsType
{	plcbit Start;
	plcbit Stop;
	plcbit Restart;
	plcbit EndAutomat;
	plcbit SetSignal1;
	plcbit SetSignal2;
	plcbit SetSignal3;
	plcbit SetSignal4;
	plcbit ResetSignal1;
	plcbit ResetSignal2;
	plcbit ResetSignal3;
	plcbit ResetSignal4;
} McAcpTrakShCamAutCmdCommandsType;

typedef struct McAcpTrakShCamAutCmdInfoType
{	plcbit Running;
	plcbit Standby;
	unsigned char ActualStateIndex;
	unsigned short ActualStateCamIndex;
	plcbit InCam;
	plcbit InCompensation;
	plcbit InPosition;
} McAcpTrakShCamAutCmdInfoType;

typedef struct McAcpTrakShConvoyInfoType
{	plcbit IsConvoyMaster;
	struct McAxisType ConvoyMaster;
	struct McAxisType ReferenceShuttle;
	enum McAcpTrakObjectTypeEnum ReferenceObjectType;
	double Distance;
	double CouplingTargetLag;
} McAcpTrakShConvoyInfoType;

typedef struct McAcpTrakShConvoyParType
{	struct McAxisType* ReferenceShuttle;
	enum McAcpTrakCouplingModeEnum CouplingMode;
	plcbit Elastic;
} McAcpTrakShConvoyParType;

typedef struct McAcpTrakShCurrentValuesType
{	double Position;
	double ActualPosition;
	double ModuloPosition;
	double ActualModuloPosition;
	double PositionControllerLag;
	struct McSectorType Sector;
	plcstring SectorName[33];
	enum McAcpTrakSecTypeEnum SectorType;
	double SectorLength;
	enum McDirectionEnum Orientation;
	float Velocity;
	float Acceleration;
	float JerkTime;
	float ZeroVibrationFltrTime;
	float ZeroVibrationFltrCoeff;
	plcbit InRest;
	struct McAcpTrakSegPositionType SegmentPosition;
	double EncoderDiscrepancy;
	enum McAcpTrakShMovementTypeEnum MovementType;
	unsigned char CtrlParSetLeft;
	unsigned char CtrlParSetRight;
	struct McAcpTrakCurrentOverrideType Override;
} McAcpTrakShCurrentValuesType;

typedef struct McProcessPointType
{	struct McInternalProcessPointIfType* controlif;
} McProcessPointType;

typedef struct McAcpTrakShErrorBarrierInfoType
{	enum McAcpTrakBarrierTypeEnum BarrierType;
	struct McProcessPointType ProcessPoint;
	plcstring Name[33];
	enum McAcpTrakBarrierStatusEnum Status;
} McAcpTrakShErrorBarrierInfoType;

typedef struct McAcpTrakShErrorChannelInfoType
{	struct McSegmentType Segment;
	plcstring SegmentName[33];
} McAcpTrakShErrorChannelInfoType;

typedef struct McAcpTrakShErrorConvoyInfoType
{	struct McAxisType ConvoyMaster;
	struct McAxisType Shuttle;
} McAcpTrakShErrorConvoyInfoType;

typedef struct McAcpTrakShErrorEncdiffInfoType
{	double Difference;
	struct McAcpTrakSegPositionType LowPosition;
	struct McAcpTrakSegPositionType HighPosition;
} McAcpTrakShErrorEncdiffInfoType;

typedef struct McAcpTrakShErrorGripperInfoType
{	struct McSegmentType Segment;
	plcstring SegmentName[33];
} McAcpTrakShErrorGripperInfoType;

typedef struct McAcpTrakShErrorShuttleInfoType
{	struct McAxisType Shuttle;
	struct McAcpTrakSegPositionType SegmentPosition;
} McAcpTrakShErrorShuttleInfoType;

typedef struct McAcpTrakShErrorLocLimitInfoType
{	plcstring Name[33];
	float VelocityLimit;
	float AccelerationLimit;
	float DecelerationLimit;
	plcbit InRange;
} McAcpTrakShErrorLocLimitInfoType;

typedef struct McAcpTrakShErrorManeuverInfoType
{	enum McAcpTrakShManeuverReasonEnum Reason;
	struct McAcpTrakShErrorShuttleInfoType ShuttleManInfo;
	struct McAcpTrakShErrorBarrierInfoType BarrierManInfo;
	struct McAcpTrakShErrorLocLimitInfoType LocalLimitManInfo;
	struct McAcpTrakShErrorConvoyInfoType ConvoyManInfo;
} McAcpTrakShErrorManeuverInfoType;

typedef struct McAcpTrakShErrorSegmentInfoType
{	struct McSegmentType Segment;
	plcstring SegmentName[33];
} McAcpTrakShErrorSegmentInfoType;

typedef struct McAcpTrakShErrorInfoType
{	struct McAcpTrakSegPositionType SegmentPosition;
	float Velocity;
	float Acceleration;
	enum McAcpTrakShErrorReasonEnum Reason;
	struct McAcpTrakShErrorManeuverInfoType ManeuverErrorInfo;
	struct McAcpTrakShErrorEncdiffInfoType EncdiffErrorInfo;
	struct McAcpTrakShErrorGripperInfoType GripperErrorInfo;
	struct McAcpTrakShErrorChannelInfoType ChannelErrorInfo;
	struct McAcpTrakShErrorSegmentInfoType SegmentErrorInfo;
	plcbit Initiator;
} McAcpTrakShErrorInfoType;

typedef struct McAcpTrakZeroVibrFilterParType
{	float ZeroVibrationFltrTime;
	float ZeroVibrationFltrCoeff;
} McAcpTrakZeroVibrFilterParType;

typedef struct McAcpTrakShFilterParType
{	enum McAcpTrakShFilterModeEnum Mode;
	float JerkTime;
	struct McAcpTrakZeroVibrFilterParType ZeroVibrationFilter;
} McAcpTrakShFilterParType;

typedef struct McAcpTrakShRouteDestInfoType
{	double Position;
	struct McSectorType Sector;
	plcstring SectorName[33];
	enum McAcpTrakSecTypeEnum SectorType;
	float VelocityAtDestination;
	double TotalDistance;
	double RemainingDistance;
} McAcpTrakShRouteDestInfoType;

typedef struct McAcpTrakShManeuverInfoType
{	enum McAcpTrakShManeuverTypeEnum Type;
	enum McAcpTrakShManeuverReasonEnum Reason;
	struct McAxisType Shuttle;
	struct McProcessPointType Barrier;
} McAcpTrakShManeuverInfoType;

typedef struct McAcpTrakShLifeCycleInfoType
{	double AbsoluteMovementDistance;
} McAcpTrakShLifeCycleInfoType;

typedef struct McAcpTrakShInfoType
{	struct McAcpTrakShCurrentValuesType CurrentValues;
	struct McAcpTrakShRouteDestInfoType RouteDestinationInfo;
	struct McAcpTrakShManeuverInfoType ManeuverInfo;
	struct McAcpTrakShLifeCycleInfoType LifeCycleInfo;
	struct McAcpTrakShConvoyInfoType ConvoyInfo;
	struct McAcpTrakShAddInfoType AdditionalInfo;
} McAcpTrakShInfoType;

typedef struct McAcpTrakShReadSecPosInfoType
{	double Position;
	enum McDirectionEnum Orientation;
} McAcpTrakShReadSecPosInfoType;

typedef struct McAcpTrakShRecoveryInfoType
{	struct McAcpTrakSecPositionType SectorPosition;
	plcbit OnSector;
	struct McAcpTrakSecPositionType Destination;
	struct McAcpTrakSegPositionType SegmentPosition;
} McAcpTrakShRecoveryInfoType;

typedef struct McAcpTrakShResizeParamType
{	enum McAcpTrakShResizeModeEnum Mode;
	double ExtentToFront;
	double ExtentToBack;
	double Width;
} McAcpTrakShResizeParamType;

typedef struct McAcpTrakShSegCurrentValuesType
{	plcbit Valid;
	plcstring SegmentName[33];
	double Position;
	double PositionControllerLag;
} McAcpTrakShSegCurrentValuesType;

typedef struct McAcpTrakShSegSetValuesType
{	plcbit Valid;
	plcstring SegmentName[33];
	unsigned short SegmentID;
	double Position;
	unsigned char Channel;
	plcbit Controlled;
	enum McAcpTrakFieldModeEnum FieldMode;
	enum McDirectionEnum Orientation;
} McAcpTrakShSegSetValuesType;

typedef struct McAcpTrakShSegmentInfoType
{	struct McAcpTrakShSegSetValuesType SegmentSetValues[4];
	struct McAcpTrakShSegCurrentValuesType SegmentCurrentValues[4];
} McAcpTrakShSegmentInfoType;

typedef struct McAcpTrakShSizeInfoType
{	double ExtentToFront;
	double ExtentToBack;
	double Width;
} McAcpTrakShSizeInfoType;

typedef struct McAcpTrakShSwitchSecInfoType
{	double Position;
	enum McDirectionEnum Orientation;
} McAcpTrakShSwitchSecInfoType;

typedef struct McAcpTrakShuttleData
{	unsigned long Index;
	plcstring UserID[33];
	unsigned long UserState;
	plcbit Active;
	plcbit Virtual;
	plcbit Controlled;
	plcbit ErrorInitiator;
	enum McAxisPLCopenStateEnum PLCopenState;
	plcstring SegmentName[33];
	unsigned short SegmentID;
	double SegmentPosition;
	struct McFrameType Frame;
	plcstring SectorName[33];
	double SectorPosition;
} McAcpTrakShuttleData;

typedef struct McAcpTrakTrgPointReadInfoType
{	struct McAxisType Axis;
	enum McAcpTrakTrgPointEventEnum Event;
	plcbit ShuttleControlled;
	struct McAxisType ConvoyMaster;
	unsigned long UserState;
} McAcpTrakTrgPointReadInfoType;

typedef struct McAssemblyType
{	struct McInternalAssemblyIfType* controlif;
} McAssemblyType;

typedef struct McInternalAssemblyIfType
{	plcdword vtable;
} McInternalAssemblyIfType;

typedef struct McInternalProcessPointIfType
{	plcdword vtable;
} McInternalProcessPointIfType;

typedef struct McInternalSectorIfType
{	plcdword vtable;
} McInternalSectorIfType;

typedef struct McInternalSegmentIfType
{	plcdword vtable;
} McInternalSegmentIfType;

typedef struct McASMTrkSegType
{	struct McCfgUnboundedArrayType SegmentReference;
} McASMTrkSegType;

typedef struct McASMTrkPosAbsType
{	plcstring SegmentReference[251];
	enum McASMTrkPosAbsSegCntDirEnum SegmentCountDirection;
	double Position;
	enum McASMSegPosRelToEnum PositionRelativeTo;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
} McASMTrkPosAbsType;

typedef struct McASMSegType
{	plcstring SegmentReference[251];
	double Position;
	enum McASMSegPosRelToEnum PositionRelativeTo;
} McASMSegType;

typedef struct McASMTrkPosRelOneType
{	struct McASMSegType SegmentTrack;
	struct McASMSegType SegmentExistingTrack;
} McASMTrkPosRelOneType;

typedef struct McASMTrkPosRelTwoAlignType
{	plcstring SegmentRefTrack[251];
	plcstring SegmentRefExistingTrack[251];
} McASMTrkPosRelTwoAlignType;

typedef struct McASMTrkPosRelTwoType
{	struct McASMTrkPosRelTwoAlignType AlignmentFirst;
	struct McASMTrkPosRelTwoAlignType AlignmentSecond;
} McASMTrkPosRelTwoType;

typedef struct McASMTrkPosType
{	enum McASMTrkPosEnum Type;
	struct McASMTrkPosAbsType Absolute;
	struct McASMTrkPosRelOneType RelativeToOneSegment;
	struct McASMTrkPosRelTwoType RelativeToTwoSegments;
} McASMTrkPosType;

typedef struct McASMTrkType
{	struct McASMTrkSegType Segments;
	struct McASMTrkPosType Position;
} McASMTrkType;

typedef struct McASMTrksType
{	double TrackSeparation;
	struct McCfgUnboundedArrayType Track;
} McASMTrksType;

typedef struct McASMCSSStopReacSsmanType
{	enum McASMCSSStopReacSsmanFbEnum Fallback;
} McASMCSSStopReacSsmanType;

typedef struct McASMCSSStopReacType
{	enum McASMCSSStopReacEnum Type;
	struct McASMCSSStopReacSsmanType Standstillmaneuver;
} McASMCSSStopReacType;

typedef struct McASMCSSSpdFltrLP1stOrdType
{	float FilterTime;
} McASMCSSSpdFltrLP1stOrdType;

typedef struct McASMCSSSpdFltrType
{	enum McASMCSSSpdFltrEnum Type;
	struct McASMCSSSpdFltrLP1stOrdType Lowpass1stOrder;
} McASMCSSSpdFltrType;

typedef struct McASMCSSCtrlSetPosType
{	float ProportionalGain;
} McASMCSSCtrlSetPosType;

typedef struct McASMCSSCtrlSetSpdType
{	float ProportionalGain;
	float IntegrationTime;
} McASMCSSCtrlSetSpdType;

typedef struct McASMCSSCtrlSetFFwdType
{	float TotalMass;
	float ForcePositive;
	float ForceNegative;
	float SpeedForceFactor;
	float ForceLoad;
} McASMCSSCtrlSetFFwdType;

typedef struct McASMCSSCtrlSetType
{	struct McASMCSSCtrlSetPosType Position;
	struct McASMCSSCtrlSetSpdType Speed;
	struct McASMCSSCtrlSetFFwdType FeedForward;
} McASMCSSCtrlSetType;

typedef struct McASMCSSCPDPSForLimCtrlType
{	float ForcePositive;
	float ForceNegative;
} McASMCSSCPDPSForLimCtrlType;

typedef struct McASMCSSCPDPSForLimCtrlWFFwdType
{	float ForcePositive;
	float ForceNegative;
} McASMCSSCPDPSForLimCtrlWFFwdType;

typedef struct McASMCSSCPDPSForLimType
{	enum McASMCSSCPDPSForLimEnum Type;
	struct McASMCSSCPDPSForLimCtrlType Controller;
	struct McASMCSSCPDPSForLimCtrlWFFwdType ControllerWithFeedForward;
} McASMCSSCPDPSForLimType;

typedef struct McASMCSSMoveErrLimType
{	double PositionError;
	double VelocityError;
} McASMCSSMoveErrLimType;

typedef struct McASMCSSDivForceType
{	float ForceOverrideFactor;
} McASMCSSDivForceType;

typedef struct McASMCSSCPDPSType
{	struct McASMCSSCtrlSetType Controller;
	struct McASMCSSCPDPSForLimType ForceLimits;
	struct McASMCSSMoveErrLimType MovementErrorLimits;
	struct McASMCSSDivForceType Diverter;
} McASMCSSCPDPSType;

typedef struct McASMCSSCPAPSUseParSetCtrlType
{	enum McASMCSSCPAPSUseParSetCtrlEnum Type;
	struct McASMCSSCtrlSetType UseExplicitValues;
} McASMCSSCPAPSUseParSetCtrlType;

typedef struct McASMCSSAPSForLimCtrlType
{	float ForcePositive;
	float ForceNegative;
} McASMCSSAPSForLimCtrlType;

typedef struct McASMCSSAPSForLimCtrlFFWDType
{	float ForcePositive;
	float ForceNegative;
} McASMCSSAPSForLimCtrlFFWDType;

typedef struct McASMCSSCPAPSUseParSetForLimType
{	enum McASMCSSCPAPSUseParSetForLimEnum Type;
	struct McASMCSSAPSForLimCtrlType Controller;
	struct McASMCSSAPSForLimCtrlFFWDType ControllerWithFeedForward;
} McASMCSSCPAPSUseParSetForLimType;

typedef struct McASMCSSCPAPSUPSMoveErrLimType
{	enum McASMCSSCPAPSUPSMoveErrLimEnum Type;
	struct McASMCSSMoveErrLimType UseExplicitValues;
} McASMCSSCPAPSUPSMoveErrLimType;

typedef struct McASMCSSCPAPSUPSDivType
{	enum McASMCSSCPAPSUPSDivEnum Type;
	struct McASMCSSDivForceType UseExplicitValues;
} McASMCSSCPAPSUPSDivType;

typedef struct McASMCSSCPAPSUseParSetType
{	struct McASMCSSCPAPSUseParSetCtrlType Controller;
	struct McASMCSSCPAPSUseParSetForLimType ForceLimits;
	struct McASMCSSCPAPSUPSMoveErrLimType MovementErrorLimits;
	struct McASMCSSCPAPSUPSDivType Diverter;
} McASMCSSCPAPSUseParSetType;

typedef struct McASMCSSCPAPSUseType
{	struct McCfgUnboundedArrayType ParameterSet;
} McASMCSSCPAPSUseType;

typedef struct McASMCSSCPAPSType
{	enum McASMCSSCPAPSEnum Type;
	struct McASMCSSCPAPSUseType Used;
} McASMCSSCPAPSType;

typedef struct McASMCSSCtrlParType
{	struct McASMCSSCPDPSType DefaultParameterSet;
	struct McASMCSSCPAPSType AdditionalParameterSets;
} McASMCSSCtrlParType;

typedef struct McASMCSSCoggingCompActType
{	float UpperVelocityLimit;
} McASMCSSCoggingCompActType;

typedef struct McASMCSSCoggingCompType
{	enum McASMCSSCoggingCompEnum Type;
	struct McASMCSSCoggingCompActType Active;
} McASMCSSCoggingCompType;

typedef struct McASMCSSCompType
{	struct McASMCSSCoggingCompType CoggingCompensation;
	enum McASMCSSElongationCompEnum ElongationCompensation;
} McASMCSSCompType;

typedef struct McASMCSSPosCtrlLagMonActType
{	float WarningLimit;
} McASMCSSPosCtrlLagMonActType;

typedef struct McASMCSSPosCtrlLagMonType
{	enum McASMCSSPosCtrlLagMonEnum Type;
	struct McASMCSSPosCtrlLagMonActType Active;
} McASMCSSPosCtrlLagMonType;

typedef struct McASMCSSDiverterType
{	float WeakeningEndOverrideFactor;
	float StrengtheningEndOverrideFactor;
} McASMCSSDiverterType;

typedef struct McASMCSSType
{	enum McASMCSSActSegSimOnPLCEnum ActivateSegmentSimulationOnPLC;
	struct McASMCSSStopReacType StopReaction;
	struct McASMCSSSpdFltrType SpeedFilter;
	struct McASMCSSCtrlParType ControllerParameters;
	struct McASMCSSCompType Compensation;
	enum McASMCSSScpErrReacEnum ScopeErrorReaction;
	unsigned short ShuttleIdentificationTime;
	struct McASMCSSPosCtrlLagMonType PositionControllerLagMonitor;
	struct McASMCSSDiverterType Diverter;
} McASMCSSType;

typedef struct McASMShSSASSwOntoSegSecType
{	enum McASMShSSASSwOntoSegSecScpEnum Scope;
} McASMShSSASSwOntoSegSecType;

typedef struct McASMShSSASAutAttType
{	enum McASMShSSASAutAttFallbackEnum Fallback;
} McASMShSSASAutAttType;

typedef struct McASMShSSASRmnOnIntSecType
{	enum McASMShSSASRmnOnIntSecScpEnum Scope;
} McASMShSSASRmnOnIntSecType;

typedef struct McASMShSSASType
{	enum McASMShSSASEnum Type;
	struct McASMShSSASSwOntoSegSecType SwitchOntoSegmentSector;
	struct McASMShSSASAutAttType AutoAttach;
	struct McASMShSSASRmnOnIntSecType RemainOnInternalSector;
} McASMShSSASType;

typedef struct McASMShDistResType
{	double CollisionAvoidance;
	double ErrorStopAvoidance;
	double ConflictZoneStopDistance;
} McASMShDistResType;

typedef struct McASMShShSttType
{	struct McCfgUnboundedArrayType ShuttleStereotypeReference;
} McASMShShSttType;

typedef struct McASMShMagnPltCfgShTypType
{	enum McASMShMagnPltCfgShTypEnum Type;
} McASMShMagnPltCfgShTypType;

typedef struct McASMShMagnPltCfgType
{	struct McCfgUnboundedArrayType ShuttleType;
} McASMShMagnPltCfgType;

typedef struct McASMShColAvStratType
{	enum McASMShColAvStratEnum Type;
} McASMShColAvStratType;

typedef struct McASMShColAvAdjModType
{	enum McASMShColAvAdjModEnum Type;
} McASMShColAvAdjModType;

typedef struct McASMShColAvMaxMdlDimLenType
{	double ExtentToFront;
	double ExtentToBack;
} McASMShColAvMaxMdlDimLenType;

typedef struct McASMShColAvMaxMdlDimWidType
{	double Width;
} McASMShColAvMaxMdlDimWidType;

typedef struct McASMShColAvMaxMdlDimType
{	struct McASMShColAvMaxMdlDimLenType Length;
	struct McASMShColAvMaxMdlDimWidType Width;
} McASMShColAvMaxMdlDimType;

typedef struct McASMShVSCASType
{	enum McASMShVSCASEnum Type;
} McASMShVSCASType;

typedef struct McASMShColAvType
{	struct McASMShColAvStratType Strategy;
	struct McASMShColAvAdjModType AdjustmentMode;
	struct McASMShColAvMaxMdlDimType MaximumModelDimensions;
	struct McASMShVSCASType VirtualShuttlesScope;
} McASMShColAvType;

typedef struct McASMShCplgCplgFeatType
{	plcbit EliminateShuttleDelay;
} McASMShCplgCplgFeatType;

typedef struct McASMShCplgType
{	struct McASMShCplgCplgFeatType CouplingFeature;
} McASMShCplgType;

typedef struct McASMShType
{	unsigned short MaximumCount;
	unsigned short MaximumDelegatedCommandCount;
	enum McASMShConFunEnum ConvoyFunctionality;
	struct McASMShSSASType SwitchSectorAfterStop;
	struct McASMShDistResType DistanceReserves;
	struct McASMShShSttType ShuttleStereotypes;
	struct McASMShMagnPltCfgType MagnetPlateConfigurations;
	struct McASMShColAvType CollisionAvoidance;
	struct McASMShCplgType Coupling;
} McASMShType;

typedef struct McASMAsmFeatType
{	struct McCfgUnboundedArrayType AssemblyFeatureReference;
} McASMAsmFeatType;

typedef struct McASMVisType
{	plcstring MonitoringPV[251];
	enum McASMVisProcTskCEnum ProcessingTaskClass;
} McASMVisType;

typedef struct McCfgAsmType
{	struct McASMTrksType Tracks;
	struct McASMCSSType CommonSegmentSettings;
	struct McASMShType Shuttles;
	struct McASMAsmFeatType AssemblyFeatures;
	struct McASMVisType Visualization;
} McCfgAsmType;

typedef struct McCfgAsmCoggComp
{	struct McASMCSSCoggingCompType CoggingCompensation;
} McCfgAsmCoggComp;

typedef struct McCfgAsmElongComp
{	enum McASMCSSElongationCompEnum ElongationCompensation;
} McCfgAsmElongComp;

typedef struct McCfgAsmDefCtrlParam
{	struct McASMCSSCPDPSType DefaultParameterSet;
} McCfgAsmDefCtrlParam;

typedef struct McCfgAsmAddCtrlParam
{	struct McASMCSSCPAPSType AdditionalParameterSets;
} McCfgAsmAddCtrlParam;

typedef struct McCfgAsmStopReaction
{	struct McASMCSSStopReacType StopReaction;
} McCfgAsmStopReaction;

typedef struct McCfgAsmSpeedFilt
{	struct McASMCSSSpdFltrType SpeedFilter;
} McCfgAsmSpeedFilt;

typedef struct McCfgAsmScopeOfErrReaction
{	enum McASMCSSScpErrReacEnum ScopeErrorReaction;
} McCfgAsmScopeOfErrReaction;

typedef struct McCfgAsmShIdentTime
{	unsigned short ShuttleIdentificationTime;
} McCfgAsmShIdentTime;

typedef struct McCfgAsmPosCtrlLagMonitor
{	struct McASMCSSPosCtrlLagMonType PositionControllerLagMonitor;
} McCfgAsmPosCtrlLagMonitor;

typedef struct McCfgAsmDiverter
{	struct McASMCSSDiverterType Diverter;
} McCfgAsmDiverter;

typedef struct McCfgAsmColAvoidStrategy
{	struct McASMShColAvStratType Strategy;
} McCfgAsmColAvoidStrategy;

typedef struct McCfgAsmColAvoidAdjustMode
{	struct McASMShColAvAdjModType AdjustmentMode;
} McCfgAsmColAvoidAdjustMode;

typedef struct McAFCCplgObjType
{	plcstring Name[251];
	unsigned short ShuttleCount;
	struct McCfgReferenceType CamAutomatReference;
	struct McCfgReferenceType CamListReference;
} McAFCCplgObjType;

typedef struct McCfgAsmFeatCplgType
{	struct McCfgUnboundedArrayType CouplingObject;
} McCfgAsmFeatCplgType;

typedef struct McAFSSDShOnSecDefSngShType
{	struct McCfgUnboundedArrayType Position;
} McAFSSDShOnSecDefSngShType;

typedef struct McAFSSDShOnSecDefSetOfShType
{	double StartPosition;
	unsigned char NumberOfShuttles;
	double DistanceBetweenShuttles;
} McAFSSDShOnSecDefSetOfShType;

typedef struct McAFSSDShOnSecDefType
{	enum McAFSSDShOnSecDefEnum Type;
	struct McAFSSDShOnSecDefSngShType SingleShuttle;
	struct McAFSSDShOnSecDefSetOfShType SetOfShuttles;
} McAFSSDShOnSecDefType;

typedef struct McAFSSDShOnSecType
{	struct McCfgReferenceType SectorReference;
	enum McAFSSDShOnSecOrientEnum Orientation;
	struct McAFSSDShOnSecDefType Definition;
} McAFSSDShOnSecType;

typedef struct McCfgAsmFeatSimShDefType
{	struct McCfgUnboundedArrayType ShuttleOnSector;
} McCfgAsmFeatSimShDefType;

typedef struct McAFSTSecTrcCfgType
{	unsigned short ShuttleCount;
	struct McCfgReferenceType SectorReference;
	enum McAFSTSecTrcCfgSecRstEnum SectorRestricted;
} McAFSTSecTrcCfgType;

typedef struct McCfgAsmFeatSecTraceType
{	struct McAFSTSecTrcCfgType SectorTraceConfiguration;
} McCfgAsmFeatSecTraceType;

typedef struct McAFSAAPrioType
{	struct McCfgReferenceType SectorReference;
	enum McAFSAAPrioOrientEnum Orientation;
} McAFSAAPrioType;

typedef struct McCfgAsmFeatShAutAttType
{	struct McCfgUnboundedArrayType Priority;
} McCfgAsmFeatShAutAttType;

typedef struct McAFLLScpSngShType
{	plcstring LocalLimitName[251];
} McAFLLScpSngShType;

typedef struct McAFLLScpType
{	enum McAFLLScpEnum Type;
	struct McAFLLScpSngShType SingleShuttles;
} McAFLLScpType;

typedef struct McAFLLLocSecType
{	struct McCfgReferenceType SectorReference;
} McAFLLLocSecType;

typedef struct McAFLLLocCrvAreaType
{	float CurvatureThreshold;
} McAFLLLocCrvAreaType;

typedef struct McAFLLLocType
{	enum McAFLLLocEnum Type;
	struct McAFLLLocSecType Sector;
	struct McAFLLLocCrvAreaType CurvedArea;
} McAFLLLocType;

typedef struct McAFLLMotLimVelBasicType
{	float Velocity;
} McAFLLMotLimVelBasicType;

typedef struct McAFLLMotLimVelType
{	enum McAFLLMotLimVelEnum Type;
	struct McAFLLMotLimVelBasicType Basic;
} McAFLLMotLimVelType;

typedef struct McAFLLMotLimAccBasicType
{	float Acceleration;
} McAFLLMotLimAccBasicType;

typedef struct McAFLLMotLimAccType
{	enum McAFLLMotLimAccEnum Type;
	struct McAFLLMotLimAccBasicType Basic;
} McAFLLMotLimAccType;

typedef struct McAFLLMotLimType
{	struct McAFLLMotLimVelType Velocity;
	struct McAFLLMotLimAccType Acceleration;
} McAFLLMotLimType;

typedef struct McAFLLType
{	struct McAFLLScpType Scope;
	struct McAFLLLocType Location;
	struct McAFLLMotLimType MotionLimits;
} McAFLLType;

typedef struct McCfgAsmFeatLocLimType
{	struct McCfgUnboundedArrayType LocalLimit;
} McCfgAsmFeatLocLimType;

typedef struct McAFESExFromAsmPwrOnType
{	struct McCfgUnboundedArrayType SegmentReference;
} McAFESExFromAsmPwrOnType;

typedef struct McAFESExFromType
{	enum McAFESExFromEnum Type;
	struct McAFESExFromAsmPwrOnType AssemblyPowerOn;
} McAFESExFromType;

typedef struct McCfgAsmFeatExSegType
{	struct McAFESExFromType ExclusionFrom;
} McCfgAsmFeatExSegType;

typedef struct McAFSSRSetLenType
{	double ExtentToFront;
	double ExtentToBack;
} McAFSSRSetLenType;

typedef struct McAFSSRSetWidType
{	double Width;
} McAFSSRSetWidType;

typedef struct McAFSSRSetType
{	struct McAFSSRSetLenType Length;
	struct McAFSSRSetWidType Width;
} McAFSSRSetType;

typedef struct McCfgAsmFeatShShpRegType
{	struct McCfgUnboundedArrayType Set;
} McCfgAsmFeatShShpRegType;

typedef struct McAFSGSegGrpSegType
{	struct McCfgUnboundedArrayType SegmentReference;
} McAFSGSegGrpSegType;

typedef struct McAFSGSegGrpType
{	plcstring Name[251];
	struct McAFSGSegGrpSegType Segments;
} McAFSGSegGrpType;

typedef struct McCfgAsmFeatSegGrpType
{	struct McCfgUnboundedArrayType SegmentGroup;
} McCfgAsmFeatSegGrpType;

typedef struct McAFSNAsmSnType
{	unsigned long RecordedCycles;
	unsigned long RecorderStopDelay;
} McAFSNAsmSnType;

typedef struct McCfgAsmFeatSnapType
{	struct McAFSNAsmSnType AssemblySnapshot;
} McCfgAsmFeatSnapType;

typedef struct McSCSegType
{	plcstring SegmentReference[251];
	double Position;
	enum McSCSegPosRelToEnum PositionRelativeTo;
} McSCSegType;

typedef struct McSCIntmSegType
{	struct McCfgUnboundedArrayType SegmentReference;
} McSCIntmSegType;

typedef struct McCfgSecCompType
{	struct McSCSegType StartSegment;
	struct McSCIntmSegType IntermediateSegments;
	struct McSCSegType EndSegment;
} McCfgSecCompType;

typedef struct McSSStType
{	double Position;
	enum McSSStPosRelToEnum PositionRelativeTo;
} McSSStType;

typedef struct McCfgSecSubType
{	struct McCfgReferenceType SectorReference;
	struct McSSStType Start;
	double Length;
	enum McSSDirEnum Direction;
} McCfgSecSubType;

typedef struct McSTypType
{	enum McSTypEnum Type;
	struct McCfgSecCompType ComposedSector;
	struct McCfgSecSubType SubSector;
} McSTypType;

typedef struct McCfgSecType
{	struct McSTypType Type;
} McCfgSecType;

typedef struct McCfgSecCompPosType
{	struct McSCSegType StartSegment;
	struct McSCSegType EndSegment;
} McCfgSecCompPosType;

typedef struct McSSTMoveLimIntVelBasicType
{	float Velocity;
} McSSTMoveLimIntVelBasicType;

typedef struct McSSTMoveLimIntVelType
{	enum McSSTMoveLimIntVelEnum Type;
	struct McSSTMoveLimIntVelBasicType Basic;
} McSSTMoveLimIntVelType;

typedef struct McSSTMoveLimIntAccBasicType
{	float Acceleration;
} McSSTMoveLimIntAccBasicType;

typedef struct McSSTMoveLimIntAccType
{	enum McSSTMoveLimIntAccEnum Type;
	struct McSSTMoveLimIntAccBasicType Basic;
} McSSTMoveLimIntAccType;

typedef struct McSSTMoveLimIntDecBasicType
{	float Deceleration;
} McSSTMoveLimIntDecBasicType;

typedef struct McSSTMoveLimIntDecType
{	enum McSSTMoveLimIntDecEnum Type;
	struct McSSTMoveLimIntDecBasicType Basic;
} McSSTMoveLimIntDecType;

typedef struct McSSTMoveLimIntType
{	struct McSSTMoveLimIntVelType Velocity;
	struct McSSTMoveLimIntAccType Acceleration;
	struct McSSTMoveLimIntDecType Deceleration;
	enum McSSTMoveLimIntUpdModEnum UpdateMode;
} McSSTMoveLimIntType;

typedef struct McSSTMoveLimType
{	enum McSSTMoveLimEnum Type;
	struct McSSTMoveLimIntType Internal;
} McSSTMoveLimType;

typedef struct McSSTJerkFltrUseType
{	float JerkTime;
} McSSTJerkFltrUseType;

typedef struct McSSTJerkFltrType
{	enum McSSTJerkFltrEnum Type;
	struct McSSTJerkFltrUseType Used;
} McSSTJerkFltrType;

typedef struct McSSTZVFUseType
{	float ZeroVibrationFilterCoefficient;
	float ZeroVibrationFilterTime;
} McSSTZVFUseType;

typedef struct McSSTZVFType
{	enum McSSTZVFEnum Type;
	struct McSSTZVFUseType Used;
} McSSTZVFType;

typedef struct McSSTUsrDatType
{	unsigned short Size;
} McSSTUsrDatType;

typedef struct McSSTCAIMDUseExpValLenType
{	double ExtentToFront;
	double ExtentToBack;
} McSSTCAIMDUseExpValLenType;

typedef struct McSSTCAIMDUseExpValWidType
{	double Width;
} McSSTCAIMDUseExpValWidType;

typedef struct McSSTCAIMDUseExpValType
{	struct McSSTCAIMDUseExpValLenType Length;
	struct McSSTCAIMDUseExpValWidType Width;
} McSSTCAIMDUseExpValType;

typedef struct McSSTCAIMDType
{	enum McSSTCAIMDEnum Type;
	struct McSSTCAIMDUseExpValType UseExplicitValues;
} McSSTCAIMDType;

typedef struct McSSTColAvType
{	struct McSSTCAIMDType InitialModelDimensions;
} McSSTColAvType;

typedef struct McSSTStatTransType
{	enum McSSTStatTransAutReCtrlEnum AutomaticReControl;
} McSSTStatTransType;

typedef struct McCfgShStereoTypType
{	enum McSSTMeasUnitEnum MeasurementUnit;
	double MeasurementResolution;
	struct McSSTMoveLimType MovementLimits;
	struct McSSTJerkFltrType JerkFilter;
	struct McSSTZVFType ZeroVibrationFilter;
	struct McSSTUsrDatType UserData;
	struct McSSTColAvType CollisionAvoidance;
	struct McSSTStatTransType StateTransitions;
} McCfgShStereoTypType;

typedef struct McCfgShJerkFiltType
{	struct McSSTJerkFltrType JerkFilter;
} McCfgShJerkFiltType;

typedef struct McCfgShStateTransType
{	struct McSSTStatTransType StateTransitions;
} McCfgShStateTransType;

typedef struct McCfgShZeroVibFilterType
{	struct McSSTZVFType ZeroVibrationFilter;
} McCfgShZeroVibFilterType;

typedef struct McSEGAppearEmuType
{	unsigned short NodeNumber;
} McSEGAppearEmuType;

typedef struct McSEGAppearType
{	enum McSEGAppearEnum Type;
	struct McSEGAppearEmuType Emulation;
} McSEGAppearType;

typedef struct McSEGCompType
{	enum McSEGElongationCompEnum ElongationCompensation;
	enum McSEGAsymmetricCurCompEnum AsymmetricCurrentCompensation;
} McSEGCompType;

typedef struct McSEGStopReacSsmanType
{	enum McSEGStopReacSsmanFbEnum Fallback;
} McSEGStopReacSsmanType;

typedef struct McSEGStopReacType
{	enum McSEGStopReacEnum Type;
	struct McSEGStopReacSsmanType Standstillmaneuver;
} McSEGStopReacType;

typedef struct McSEGSpdFltrLP1stOrdType
{	float FilterTime;
} McSEGSpdFltrLP1stOrdType;

typedef struct McSEGSpdFltrType
{	enum McSEGSpdFltrEnum Type;
	struct McSEGSpdFltrLP1stOrdType Lowpass1stOrder;
} McSEGSpdFltrType;

typedef struct McSEGPosLagMonActType
{	float WarningLimit;
} McSEGPosLagMonActType;

typedef struct McSEGPosLagMonType
{	enum McSEGPosLagMonEnum Type;
	struct McSEGPosLagMonActType Active;
} McSEGPosLagMonType;

typedef struct McCfgSegType
{	plcstring SegmentReference[251];
	plcstring SegmentSectorReference[251];
	enum McSEGSegSecDirEnum SegmentSectorDirection;
	struct McSEGAppearType Appearance;
	struct McSEGCompType Compensation;
	struct McSEGStopReacType StopReaction;
	struct McSEGSpdFltrType SpeedFilter;
	struct McSEGPosLagMonType PositionControllerLagMonitor;
} McCfgSegType;

typedef struct McVIRTSEGEmuActType
{	unsigned short NodeNumber;
} McVIRTSEGEmuActType;

typedef struct McVIRTSEGEmuType
{	enum McVIRTSEGEmuEnum Type;
	struct McVIRTSEGEmuActType Active;
} McVIRTSEGEmuType;

typedef struct McCfgVirtSegType
{	plcstring SegmentSectorReference[251];
	enum McSEGSegSecDirEnum SegmentSectorDirection;
	enum McVIRTSEGSegShpEnum SegmentShape;
	struct McVIRTSEGEmuType Emulation;
} McCfgVirtSegType;

typedef struct MC_BR_SegSimOverride_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	struct McAcpTrakAdvSegSimParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_SegSimOverride_AcpTrak_typ;

typedef struct MC_BR_ProcessDataBlock_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	unsigned short ParID;
	unsigned long DataAddress;
	unsigned long DataLength;
	enum McAcpTrakDataBlockModeEnum Mode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned long DataBlockLength;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ProcessDataBlock_AcpTrak_typ;

typedef struct MC_BR_AsmCamPrepare_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	plcstring CouplingObjectName[33];
	unsigned short CamID;
	struct McCamDefineType Cam;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmCamPrepare_AcpTrak_typ;

typedef struct MC_BR_AsmCommandError_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	enum McErrorCmdEnum Command;
	struct McAcpTrakAdvAsmCmdErrParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmCommandError_AcpTrak_typ;

typedef struct MC_BR_AsmCopySegmentData_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	enum McAcpTrakCopySegDataModeEnum Command;
	struct McAcpTrakAdvCopySegDataType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakCopySegDataInfoType Info;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Abort;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmCopySegmentData_AcpTrak_typ;

typedef struct MC_BR_AsmCopyShuttleData_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	enum McAcpTrakCopyShDataModeEnum Command;
	struct McAcpTrakAdvCopyShDataType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakCopyShDataInfoType Info;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Abort;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmCopyShuttleData_AcpTrak_typ;

typedef struct MC_BR_AsmDeleteShuttle_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	enum McAcpTrakAsmDeleteShCmdEnum Command;
	struct McAxisType* Axis;
	struct McAcpTrakAdvAsmDeleteShParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short DeletedCount;
	/* VAR (analog) */
	struct McInternalTwoRefType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmDeleteShuttle_AcpTrak_typ;

typedef struct MC_BR_AsmDisable_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmDisable_AcpTrak_typ;

typedef struct MC_BR_AsmEnable_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmEnable_AcpTrak_typ;

typedef struct MC_BR_AsmGetDualTrack_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct McAcpTrakDualTrackInfoType DualTrackInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetDualTrack_AcpTrak_typ;

typedef struct MC_BR_AsmGetInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakAsmGetInfoType AssemblyInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetInfo_AcpTrak_typ;

typedef struct MC_BR_AsmGetMinShDist_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	enum McAcpTrakShRelativeAlignmentEnum Mode;
	struct McAcpTrakAdvGetMinShDistParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakAsmGetMinShDistType Distance;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetMinShDist_AcpTrak_typ;

typedef struct MC_BR_AsmGetSector_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	struct McAcpTrakAdvAsmGetSecParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct McSectorType Sector;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetSector_AcpTrak_typ;

typedef struct MC_BR_AsmGetSegment_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	struct McAcpTrakAdvAsmGetSegParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct McSegmentType Segment;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetSegment_AcpTrak_typ;

typedef struct MC_BR_AsmGetShuttle_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	struct McAcpTrakAdvAsmGetShParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct McAxisType Axis;
	struct McAcpTrakAsmGetShAddInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetShuttle_AcpTrak_typ;

typedef struct MC_BR_AsmPowerOff_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	struct McAcpTrakAdvAsmPowerOffParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmPowerOff_AcpTrak_typ;

typedef struct MC_BR_AsmPowerOn_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	struct McAcpTrakAdvAsmPowerOnParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmPowerOn_AcpTrak_typ;

typedef struct MC_BR_AsmReadErrorInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakAsmErrorInfoType ErrorInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmReadErrorInfo_AcpTrak_typ;

typedef struct MC_BR_AsmReadInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	struct McAcpTrakAdvAsmReadInfoParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakAsmInfoType AssemblyInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmReadInfo_AcpTrak_typ;

typedef struct MC_BR_AsmReadStatus_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	plcbit AssemblyDisabled;
	plcbit AssemblyReady;
	plcbit AssemblyHoming;
	plcbit AssemblyStopping;
	plcbit AssemblyErrorStop;
	plcbit AssemblyStartup;
	plcbit AssemblyInvalidConfig;
} MC_BR_AsmReadStatus_AcpTrak_typ;

typedef struct MC_BR_AsmReset_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmReset_AcpTrak_typ;

typedef struct MC_BR_AsmSetOverride_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	enum McAcpTrakOverrideEnum Type;
	struct McAcpTrakAdvAsmOverrideParType AdvancedParameters;
	float Factor;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Enabled;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmSetOverride_AcpTrak_typ;

typedef struct MC_BR_AsmStop_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAssemblyType* Assembly;
	struct McAcpTrakAdvAsmStopParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmStop_AcpTrak_typ;

typedef struct MC_BR_BarrierCommand_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McProcessPointType* ProcessPoint;
	enum McAcpTrakBarrierCmdEnum Command;
	struct McAcpTrakAdvBarrierParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_BarrierCommand_AcpTrak_typ;

typedef struct MC_BR_BarrierGetShuttle_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McProcessPointType* ProcessPoint;
	struct McAcpTrakAdvBarrierGetShParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct McAxisType Axis;
	struct McAcpTrakBarrierGetShInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_BarrierGetShuttle_AcpTrak_typ;

typedef struct MC_BR_BarrierReadInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McProcessPointType* ProcessPoint;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakBarrierInfoType BarrierInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_BarrierReadInfo_AcpTrak_typ;

typedef struct MC_BR_ProcPointReadInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McProcessPointType* ProcessPoint;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakProcPointInfoType ProcPointInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ProcPointReadInfo_AcpTrak_typ;

typedef struct MC_BR_ConDelete_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* ConvoyMaster;
	struct McAcpTrakAdvConDeleteParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ConDelete_AcpTrak_typ;

typedef struct MC_BR_ConGetShuttle_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* ConvoyMaster;
	struct McAcpTrakAdvConGetShParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct McAxisType Axis;
	struct McAcpTrakConGetShAddInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ConGetShuttle_AcpTrak_typ;

typedef struct MC_BR_ConReadInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* ConvoyMaster;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakConInfoType ConvoyInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ConReadInfo_AcpTrak_typ;

typedef struct MC_BR_ElasticMoveAbs_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	double Position;
	float Velocity;
	float Acceleration;
	float Deceleration;
	float Jerk;
	enum McBufferModeEnum BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ElasticMoveAbs_AcpTrak_typ;

typedef struct MC_BR_ElasticMoveAdd_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	double Distance;
	float Velocity;
	float Acceleration;
	float Deceleration;
	float Jerk;
	enum McBufferModeEnum BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ElasticMoveAdd_AcpTrak_typ;

typedef struct MC_BR_ElasticMoveCycPos_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	enum McIplModeEnum InterpolationMode;
	struct McAdvMoveCycParType AdvancedParameters;
	double CyclicPosition;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit InCyclicPosition;
} MC_BR_ElasticMoveCycPos_AcpTrak_typ;

typedef struct MC_BR_ElasticMoveVel_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	float Velocity;
	float Acceleration;
	float Deceleration;
	float Jerk;
	enum McDirectionEnum Direction;
	enum McBufferModeEnum BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit InVelocity;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ElasticMoveVel_AcpTrak_typ;

typedef struct MC_BR_MoveCyclicTcpPos_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	plcstring CoordSystemName[261];
	struct McPosType Tcp;
	struct McAcpTrakAdvMoveCycParType AdvancedParameters;
	double CyclicPosition;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit InCyclicPosition;
} MC_BR_MoveCyclicTcpPos_AcpTrak_typ;

typedef struct MC_BR_MoveCyclicTcpVel_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	plcstring CoordSystemName[261];
	struct McPosType Tcp;
	enum McAcpTrakMoveCycTcpVelModeEnum Mode;
	struct McAcpTrakAdvMoveCycParType AdvancedParameters;
	float CyclicVelocity;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit InCyclicVelocity;
} MC_BR_MoveCyclicTcpVel_AcpTrak_typ;

typedef struct MC_BR_GetPosition_AcpTrak
{
	/* VAR_INPUT (analog) */
	McComponentType Component;
	McComponentType TargetComponent;
	struct McAcpTrakAdvGetPositionParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakGetPositionInfoType Info;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_GetPosition_AcpTrak_typ;

typedef struct MC_BR_GetRouteInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McSectorType* Sector;
	double Position;
	struct McAcpTrakAdvRouteParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakAdvRouteInfoType Info;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_GetRouteInfo_AcpTrak_typ;

typedef struct MC_BR_ModuloMoveAbs_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	double Position;
	float Velocity;
	float Acceleration;
	float Deceleration;
	float Jerk;
	enum McDirectionEnum Direction;
	enum McBufferModeEnum BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Elastic;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ModuloMoveAbs_AcpTrak_typ;

typedef struct MC_BR_ProcPointGetInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McProcessPointType* ProcessPoint;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakProcPointGetInfoType ProcPointInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ProcPointGetInfo_AcpTrak_typ;

typedef struct MC_BR_RoutedMoveAbs_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McSectorType* Sector;
	double Position;
	float Velocity;
	float Acceleration;
	float Deceleration;
	float Jerk;
	enum McBufferModeEnum BufferMode;
	struct McAcpTrakAdvRouteParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalTwoRefType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_RoutedMoveAbs_AcpTrak_typ;

typedef struct MC_BR_RoutedMoveVel_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McSectorType* Sector;
	double Position;
	float Velocity;
	float RouteVelocity;
	float Acceleration;
	float Deceleration;
	float Jerk;
	enum McBufferModeEnum BufferMode;
	struct McAcpTrakAdvRouteParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalTwoRefType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit InVelocity;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
	plcbit PositionReached;
} MC_BR_RoutedMoveVel_AcpTrak_typ;

typedef struct MC_BR_SecAddShuttle_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSectorType* Sector;
	double Position;
	float Velocity;
	enum McDirectionEnum Orientation;
	struct McAcpTrakAdvSecAddShuttleType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAxisType Axis;
	unsigned long ID;
	struct McAcpTrakSecAddShuttleInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} MC_BR_SecAddShuttle_AcpTrak_typ;

typedef struct MC_BR_SecGetInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSectorType* Sector;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakSecGetInfoType SectorInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_SecGetInfo_AcpTrak_typ;

typedef struct MC_BR_SecGetShuttle_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSectorType* Sector;
	enum McAcpTrakSearchModeEnum Mode;
	struct McAcpTrakAdvSecGetShParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct McAxisType Axis;
	struct McAcpTrakSecGetShAddInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_SecGetShuttle_AcpTrak_typ;

typedef struct MC_BR_SecReadInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSectorType* Sector;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakSecInfoType SectorInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_SecReadInfo_AcpTrak_typ;

typedef struct MC_BR_SecStop_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSectorType* Sector;
	struct McAcpTrakAdvSecStopParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_SecStop_AcpTrak_typ;

typedef struct MC_BR_SegCommandError_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	enum McErrorCmdEnum Command;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_SegCommandError_AcpTrak_typ;

typedef struct MC_BR_SegGetInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakSegGetInfoType SegmentInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_SegGetInfo_AcpTrak_typ;

typedef struct MC_BR_SegLimitErrorScope_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	enum McAcpTrakSegLimitErrorScopeMode Mode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_SegLimitErrorScope_AcpTrak_typ;

typedef struct MC_BR_SegPowerOff_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	struct McAcpTrakAdvSegPowerOffParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_SegPowerOff_AcpTrak_typ;

typedef struct MC_BR_SegPowerOn_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_SegPowerOn_AcpTrak_typ;

typedef struct MC_BR_SegProcessParID_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	unsigned long DataAddress;
	unsigned long NumberOfParIDs;
	enum McAcpTrakSegProcessParIDModeEnum Mode;
	unsigned char ChannelIndex;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_SegProcessParID_AcpTrak_typ;

typedef struct MC_BR_SegReadErrorInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakSegErrorInfoType ErrorInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_SegReadErrorInfo_AcpTrak_typ;

typedef struct MC_BR_SegReadInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakSegInfoType SegmentInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_SegReadInfo_AcpTrak_typ;

typedef struct MC_BR_SegReadStatus_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	plcbit SegmentDisabled;
	plcbit SegmentReady;
	plcbit SegmentStopping;
	plcbit SegmentErrorStop;
	plcbit SegmentStartup;
	plcbit SegmentInvalidConfig;
} MC_BR_SegReadStatus_AcpTrak_typ;

typedef struct MC_BR_SegReset_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_SegReset_AcpTrak_typ;

typedef struct MC_BR_ShCamAutCmd_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Slave;
	struct McAcpTrakAdvShCamAutCmdParType AdvancedParameters;
	struct McAcpTrakShCamAutCmdCommandsType Commands;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakShCamAutCmdInfoType Info;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit Ready;
} MC_BR_ShCamAutCmd_AcpTrak_typ;

typedef struct MC_BR_ShCopyUserData_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	unsigned long DataAddress;
	unsigned long DataSize;
	enum McAcpTrakCopyUserDataModeEnum Mode;
	unsigned long UserState;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned long ActualUserState;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShCopyUserData_AcpTrak_typ;

typedef struct MC_BR_ShCouplingObjCmd_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	enum McAcpTrakCouplingObjCmdEnum Command;
	plcstring CouplingObjectName[33];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShCouplingObjCmd_AcpTrak_typ;

typedef struct MC_BR_ShCreateConvoy_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpTrakConvoyParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShCreateConvoy_AcpTrak_typ;

typedef struct MC_BR_ShInteractCmd_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	enum McAcpTrakShInteractCmdEnum Command;
	struct McAxisType* Shuttle;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShInteractCmd_AcpTrak_typ;

typedef struct MC_BR_ShLocalLimitCmd_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	enum McAcpTrakShLocalLimitCmdEnum Command;
	plcstring LocalLimitName[33];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShLocalLimitCmd_AcpTrak_typ;

typedef struct MC_BR_ShMoveInConvoy_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpTrakShConvoyParType Parameters;
	struct McAcpTrakAdvShConvoyParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalTwoRefType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShMoveInConvoy_AcpTrak_typ;

typedef struct MC_BR_ShMoveCycInConvoy_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpTrakShConvoyParType Parameters;
	struct McAcpTrakAdvShConvoyParType AdvancedParameters;
	double CyclicTargetDistance;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalTwoRefType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit InCyclicDistance;
} MC_BR_ShMoveCycInConvoy_AcpTrak_typ;

typedef struct MC_BR_ShPowerOff_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShPowerOff_AcpTrak_typ;

typedef struct MC_BR_ShPowerOn_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShPowerOn_AcpTrak_typ;

typedef struct MC_BR_ShReadErrorInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakShErrorInfoType ErrorInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShReadErrorInfo_AcpTrak_typ;

typedef struct MC_BR_ShReadFrame_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	unsigned long CoordSystem;
	struct McAcpTrakAdvShReadFrameParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McFrameType Frame;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShReadFrame_AcpTrak_typ;

typedef struct MC_BR_ShReadInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakShInfoType ShuttleInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShReadInfo_AcpTrak_typ;

typedef struct MC_BR_ShReadRecoveryInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpTrakAdvShReadRecInfoParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakShRecoveryInfoType RecoveryInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShReadRecoveryInfo_AcpTrak_typ;

typedef struct MC_BR_ShReadSectorPos_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McSectorType* Sector;
	struct McAcpTrakAdvShReadSecPosParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakShReadSecPosInfoType Info;
	/* VAR (analog) */
	struct McInternalTwoRefType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShReadSectorPos_AcpTrak_typ;

typedef struct MC_BR_ShReadSegmentInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakShSegmentInfoType SegmentInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShReadSegmentInfo_AcpTrak_typ;

typedef struct MC_BR_ShReadSize_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakShSizeInfoType SizeInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShReadSize_AcpTrak_typ;

typedef struct MC_BR_ShRemoveFromConvoy_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpTrakAdvShRemoveConParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShRemoveFromConvoy_AcpTrak_typ;

typedef struct MC_BR_ShResize_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	enum McAcpTrakShResizeCmdEnum Command;
	struct McAcpTrakShResizeParamType ResizeParameter;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShResize_AcpTrak_typ;

typedef struct MC_BR_ShSelCtrlParSet_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	enum McAcpTrakSelectShSideEnum Mode;
	unsigned char ParameterSetIndex;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShSelCtrlParSet_AcpTrak_typ;

typedef struct MC_BR_ShSetMotionFilter_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McAcpTrakShFilterParType MotionFilterParameter;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShSetMotionFilter_AcpTrak_typ;

typedef struct MC_BR_ShSetUserID_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	plcstring UserID[33];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShSetUserID_AcpTrak_typ;

typedef struct MC_BR_ShSwitchSector_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McSectorType* Sector;
	struct McAcpTrakAdvShSwitchSecParType AdvancedParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakShSwitchSecInfoType Info;
	/* VAR (analog) */
	struct McInternalTwoRefType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShSwitchSector_AcpTrak_typ;

typedef struct MC_BR_TrgPointEnable_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McProcessPointType* ProcessPoint;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short EventCount;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_TrgPointEnable_AcpTrak_typ;

typedef struct MC_BR_TrgPointReadInfo_AcpTrak
{
	/* VAR_INPUT (analog) */
	struct McProcessPointType* ProcessPoint;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcpTrakTrgPointReadInfoType TrgPointInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_TrgPointReadInfo_AcpTrak_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MC_BR_SegSimOverride_AcpTrak(struct MC_BR_SegSimOverride_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ProcessDataBlock_AcpTrak(struct MC_BR_ProcessDataBlock_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmCamPrepare_AcpTrak(struct MC_BR_AsmCamPrepare_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmCommandError_AcpTrak(struct MC_BR_AsmCommandError_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmCopySegmentData_AcpTrak(struct MC_BR_AsmCopySegmentData_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmCopyShuttleData_AcpTrak(struct MC_BR_AsmCopyShuttleData_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmDeleteShuttle_AcpTrak(struct MC_BR_AsmDeleteShuttle_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmDisable_AcpTrak(struct MC_BR_AsmDisable_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmEnable_AcpTrak(struct MC_BR_AsmEnable_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmGetDualTrack_AcpTrak(struct MC_BR_AsmGetDualTrack_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmGetInfo_AcpTrak(struct MC_BR_AsmGetInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmGetMinShDist_AcpTrak(struct MC_BR_AsmGetMinShDist_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmGetSector_AcpTrak(struct MC_BR_AsmGetSector_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmGetSegment_AcpTrak(struct MC_BR_AsmGetSegment_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmGetShuttle_AcpTrak(struct MC_BR_AsmGetShuttle_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmPowerOff_AcpTrak(struct MC_BR_AsmPowerOff_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmPowerOn_AcpTrak(struct MC_BR_AsmPowerOn_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmReadErrorInfo_AcpTrak(struct MC_BR_AsmReadErrorInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmReadInfo_AcpTrak(struct MC_BR_AsmReadInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmReadStatus_AcpTrak(struct MC_BR_AsmReadStatus_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmReset_AcpTrak(struct MC_BR_AsmReset_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmSetOverride_AcpTrak(struct MC_BR_AsmSetOverride_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_AsmStop_AcpTrak(struct MC_BR_AsmStop_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_BarrierCommand_AcpTrak(struct MC_BR_BarrierCommand_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_BarrierGetShuttle_AcpTrak(struct MC_BR_BarrierGetShuttle_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_BarrierReadInfo_AcpTrak(struct MC_BR_BarrierReadInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ProcPointReadInfo_AcpTrak(struct MC_BR_ProcPointReadInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ConDelete_AcpTrak(struct MC_BR_ConDelete_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ConGetShuttle_AcpTrak(struct MC_BR_ConGetShuttle_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ConReadInfo_AcpTrak(struct MC_BR_ConReadInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ElasticMoveAbs_AcpTrak(struct MC_BR_ElasticMoveAbs_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ElasticMoveAdd_AcpTrak(struct MC_BR_ElasticMoveAdd_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ElasticMoveCycPos_AcpTrak(struct MC_BR_ElasticMoveCycPos_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ElasticMoveVel_AcpTrak(struct MC_BR_ElasticMoveVel_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_MoveCyclicTcpPos_AcpTrak(struct MC_BR_MoveCyclicTcpPos_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_MoveCyclicTcpVel_AcpTrak(struct MC_BR_MoveCyclicTcpVel_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_GetPosition_AcpTrak(struct MC_BR_GetPosition_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_GetRouteInfo_AcpTrak(struct MC_BR_GetRouteInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ModuloMoveAbs_AcpTrak(struct MC_BR_ModuloMoveAbs_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ProcPointGetInfo_AcpTrak(struct MC_BR_ProcPointGetInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_RoutedMoveAbs_AcpTrak(struct MC_BR_RoutedMoveAbs_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_RoutedMoveVel_AcpTrak(struct MC_BR_RoutedMoveVel_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SecAddShuttle_AcpTrak(struct MC_BR_SecAddShuttle_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SecGetInfo_AcpTrak(struct MC_BR_SecGetInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SecGetShuttle_AcpTrak(struct MC_BR_SecGetShuttle_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SecReadInfo_AcpTrak(struct MC_BR_SecReadInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SecStop_AcpTrak(struct MC_BR_SecStop_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegCommandError_AcpTrak(struct MC_BR_SegCommandError_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegGetInfo_AcpTrak(struct MC_BR_SegGetInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegLimitErrorScope_AcpTrak(struct MC_BR_SegLimitErrorScope_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegPowerOff_AcpTrak(struct MC_BR_SegPowerOff_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegPowerOn_AcpTrak(struct MC_BR_SegPowerOn_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegProcessParID_AcpTrak(struct MC_BR_SegProcessParID_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegReadErrorInfo_AcpTrak(struct MC_BR_SegReadErrorInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegReadInfo_AcpTrak(struct MC_BR_SegReadInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegReadStatus_AcpTrak(struct MC_BR_SegReadStatus_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_SegReset_AcpTrak(struct MC_BR_SegReset_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShCamAutCmd_AcpTrak(struct MC_BR_ShCamAutCmd_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShCopyUserData_AcpTrak(struct MC_BR_ShCopyUserData_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShCouplingObjCmd_AcpTrak(struct MC_BR_ShCouplingObjCmd_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShCreateConvoy_AcpTrak(struct MC_BR_ShCreateConvoy_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShInteractCmd_AcpTrak(struct MC_BR_ShInteractCmd_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShLocalLimitCmd_AcpTrak(struct MC_BR_ShLocalLimitCmd_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShMoveInConvoy_AcpTrak(struct MC_BR_ShMoveInConvoy_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShMoveCycInConvoy_AcpTrak(struct MC_BR_ShMoveCycInConvoy_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShPowerOff_AcpTrak(struct MC_BR_ShPowerOff_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShPowerOn_AcpTrak(struct MC_BR_ShPowerOn_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShReadErrorInfo_AcpTrak(struct MC_BR_ShReadErrorInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShReadFrame_AcpTrak(struct MC_BR_ShReadFrame_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShReadInfo_AcpTrak(struct MC_BR_ShReadInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShReadRecoveryInfo_AcpTrak(struct MC_BR_ShReadRecoveryInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShReadSectorPos_AcpTrak(struct MC_BR_ShReadSectorPos_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShReadSegmentInfo_AcpTrak(struct MC_BR_ShReadSegmentInfo_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShReadSize_AcpTrak(struct MC_BR_ShReadSize_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShRemoveFromConvoy_AcpTrak(struct MC_BR_ShRemoveFromConvoy_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShResize_AcpTrak(struct MC_BR_ShResize_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShSelCtrlParSet_AcpTrak(struct MC_BR_ShSelCtrlParSet_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShSetMotionFilter_AcpTrak(struct MC_BR_ShSetMotionFilter_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShSetUserID_AcpTrak(struct MC_BR_ShSetUserID_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_ShSwitchSector_AcpTrak(struct MC_BR_ShSwitchSector_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_TrgPointEnable_AcpTrak(struct MC_BR_TrgPointEnable_AcpTrak* inst);
_BUR_PUBLIC void MC_BR_TrgPointReadInfo_AcpTrak(struct MC_BR_TrgPointReadInfo_AcpTrak* inst);
_BUR_PUBLIC unsigned short LLMInit(signed long sysInitPhase);


#ifdef __cplusplus
};
#endif
#endif /* _MCACPTRAK_ */

