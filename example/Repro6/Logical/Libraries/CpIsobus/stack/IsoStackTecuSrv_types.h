//**********************************************************************************************************************
//! @file        IsoStackTecuSrv_types.h
//! @brief       API for accessing tractor ECU server functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        21.06.2019
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_TECU_SRV_TYPES_H
#define ISOAGLIBS_ISO_STACK_TECU_SRV_TYPES_H

// INCLUDES=============================================================================================================

#include <HalTypedef.h>

// GLOBAL DEFINES=======================================================================================================

// TECU server flags
// Class 1
#define TECU_SRV_KEY_SWITCH_FLAG             (1UL <<  0U)
#define TECU_SRV_MAX_TIME_TRACTOR_POWER_FLAG (1UL <<  1U)
#define TECU_SRV_MAINTAIN_POWER_FLAG         (1UL <<  2U)
#define TECU_SRV_WHEEL_BASED_SPEED_FLAG      (1UL <<  3U)
#define TECU_SRV_GROUND_BASED_SPEED_FLAG     (1UL <<  4U)
#define TECU_SRV_ENGINE_SPEED_FLAG           (1UL <<  5U)
#define TECU_SRV_REAR_POSITION_FLAG          (1UL <<  6U)
#define TECU_SRV_REAR_IN_WORK_FLAG           (1UL <<  7U)
#define TECU_SRV_REAR_SHAFT_SPEED_FLAG       (1UL <<  8U)
#define TECU_SRV_REAR_SHAFT_ENG_FLAG         (1UL <<  9U)
// "Lighting - minimal set as existing trailer connector" always available
// "Language command storage in Tractor ECU" NOT available, we don't support storing to EEPROM
// Class 2
#define TECU_SRV_TIME_DATE_FLAG              (1UL << 10U)
#define TECU_SRV_GROUND_BASED_DISTANCE_FLAG  (1UL << 11U)
#define TECU_SRV_GROUND_BASED_DIRECTION_FLAG (1UL << 12U)
#define TECU_SRV_WHEEL_BASED_DISTANCE_FLAG   (1UL << 13U)
#define TECU_SRV_WHEEL_BASED_DIRECTION_FLAG  (1UL << 14U)
#define TECU_SRV_REAR_DRAFT_FLAG             (1UL << 15U)
#define TECU_SRV_LIGHTING_FLAG               (1UL << 16U)
#define TECU_SRV_VALVE_FLAG                  (1UL << 17U) // If you set this flag in the facilities when calling
                                                          // function "eIsoStackTecuSrvActivate()", you have to call
                                                          // function "eIsoStackTecuSrvActivateValve()" at least for one
                                                          // index and flow type.
// Class 3    (not implemented)
// Addendum N (not implemented)
// Addendum F
#define TECU_SRV_FRONT_POSITION_FLAG         (1UL << 18U)
#define TECU_SRV_FRONT_IN_WORK_FLAG          (1UL << 19U)
#define TECU_SRV_FRONT_SHAFT_FLAG            (1UL << 20U)
#define TECU_SRV_FRONT_ENG_FLAG              (1UL << 21U)
#define TECU_SRV_FRONT_DRAFT_FLAG            (1UL << 22U)

// GLOBAL TYPE DEFINITIONS==============================================================================================

//! Enum for return values of TECU server activation
typedef enum
{
    E_TECU_SRV_ACT_RESULT_ACTIVATION_SUCCESSFUL,        //!< Activation was successful
    E_TECU_SRV_ACT_RESULT_STACK_STATE_NOT_INITIALIZING, //!< The state of the stack was not
                                                        //!< "E_ISO_STACK_STATE_INITIALIZING"
    E_TECU_SRV_ACT_RESULT_LOCAL_CF_1_NOT_YET_ACTIVATED, //!< Local CF 1 had not yet been activated (by calling function
                                                        //!< "boIsoStackNwActivateLocalCf()")
    E_TECU_SRV_ACT_RESULT_ALREADY_ACTIVATED             //!< The TECU server had already been activated before
} ETecuSrvActivationResult;

//! Enum for return values of TECU server deactivation
typedef enum
{
    E_TECU_SRV_DEACT_RESULT_DEACTIVATION_SUCCESSFUL, //!< Deactivation was successful
    E_TECU_SRV_DEACT_RESULT_STACK_STATE_NOT_CLOSING, //!< The state of the stack was not "E_ISO_STACK_STATE_CLOSING"
    E_TECU_SRV_DEACT_RESULT_NOT_ACTIVATED            //!< The TECU server had not been activated before
} ETecuSrvDeactivationResult;

//! Enum for return values of setter functions
typedef enum
{
    E_TECU_SRV_SET_RES_SUCCESS,                //!< Setting was successful
    E_TECU_SRV_SET_RES_ERROR_INVALID_PARAMETER //!< Illegal value was passed as parameter
} ETecuSrvSettingResult;

//! Enum for Engine torque mode
typedef enum
{
    E_ENGINE_TORQUE_MODE_DEFAULT,                           //!< 0000 Low idle governor / no request(default mode)
    E_ENGINE_TORQUE_MODE_ACCELERATION_OPERATOR_SELECTION,   //!< 0001 Accelerator pedal / operator selection
    E_ENGINE_TORQUE_MODE_CRUISE_CONTROL,                    //!< 0010 Cruise control
    E_ENGINE_TORQUE_MODE_PTO_GOVERNOR,                      //!< 0011 PTO governor
    E_ENGINE_TORQUE_MODE_ROAD_SPEED_GOVERNOR,               //!< 0100 Road speed governor
    E_ENGINE_TORQUE_MODE_ASR_CONTROL,                       //!< 0101 ASR control
    E_ENGINE_TORQUE_MODE_TRANSMISSION_CONTROL,              //!< 0110 Transmission control
    E_ENGINE_TORQUE_MODE_ABS_CONTROL,                       //!< 0111 ABS control
    E_ENGINE_TORQUE_MODE_TORQUE_LIMITING,                   //!< 1000 Torque limiting
    E_ENGINE_TORQUE_MODE_HIGH_SPEED_GOVERNOR,               //!< 1001 High speed governor
    E_ENGINE_TORQUE_MODE_BREAKING_SYSTEM,                   //!< 1010 Braking system
    E_ENGINE_TORQUE_MODE_REMOTE_ACCELERATION,               //!< 1011 Remote accelerator
    E_ENGINE_TORQUE_MODE_SERVICE_PROCEDURE,                 //!< 1100 Service procedure
    E_ENGINE_TORQUE_MODE_NOT_DEFINED,                       //!< 1101 Not defined
    E_ENGINE_TORQUE_MODE_OTHER,                             //!< 1110 Other
    E_ENGINE_TORQUE_MODE_NOT_AVAILABLE                      //!< 1111 Not available
} EEngineTorqueMode;

//! Enum for engine starter mode
typedef enum
{
    E_ENGINE_STARTER_MODE_NOT_REQUESTED,                    //!< 0000 Start not requested
    E_ENGINE_STARTER_MODE_GEAR_NOT_ENGAGED_STARTER_ACTIVE,  //!< 0001 Starter active, gear not engaged
    E_ENGINE_STARTER_MODE_GEAR_ENGAGED_STARTER_ACTIVE,      //!< 0010 Starter active, gear engaged
    E_ENGINE_STARTER_MODE_START_FINISHED,                   //!< 0011 Start finished; starter not active after having 
                                                            //!< been actively engaged(after 50ms mode goes to 0000)
    E_ENGINE_STARTER_MODE_ST_INH_ENGINE_ALREADY_RUNNING,    //!< 0100 Starter inhibited due to engine already running
    E_ENGINE_STARTER_MODE_ST_INH_PREHEATING,                //!< 0101 Starter inhibited due to engine not ready for
                                                            //!< start(preheating)
    E_ENGINE_STARTER_MODE_ST_INH_DRIVELINE_ENGAGED,         //!< 0110 Starter inhibited due to driveline engaged or
                                                            //!< other transmission inhibit
    E_ENGINE_STARTER_MODE_ST_INH_ACTIVE_IMMOBILIZER,        //!< 0111 Starter inhibited due to active immobilizer
    E_ENGINE_STARTER_MODE_ST_INH_STARTER_OVER_TEMP,         //!< 1000 Starter inhibited due to starter over - temp
    E_ENGINE_STARTER_MODE_RES_1,                            //!< 1001 Reserved
    E_ENGINE_STARTER_MODE_RES_2,                            //!< 1010 Reserved
    E_ENGINE_STARTER_MODE_RES_3,                            //!< 1011 Reserved
    E_ENGINE_STARTER_MODE_ST_INH_UNKNOWN,                   //!< 1100 Starter inhibited - reason unknown
    E_ENGINE_STARTER_MODE_ERROR_LEGACY_IMPL_ONLY,           //!< 1101 Error(legacy implementation only, use 1110)
    E_ENGINE_STARTER_MODE_ERROR,                            //!< 1110 Error
    E_ENGINE_STARTER_MODE_NOT_AVAILABLE                     //!< 1111 Not available
} EEngineStarterMode;

//! The following information is sent in the Lighting command (see ISO11783-7 B.18 Lighting command)
//! Global message from the tractor to all lighting controllers on the tractor and attached implements
typedef enum
{
    E_LIGHTING_PARAMETER_DEACTIVATE,
    E_LIGHTING_PARAMETER_ACTIVATE,
    E_LIGHTING_PARAMETER_RESERVED,
    E_LIGHTING_PARAMETER_DONT_CARE
} ELightingParameter;

//! The following information is sent in the Lighting data message request 
//! Command for requesting the lighting data message from all lighting controllers,
//! providing the state of all lights.
//! (see ISO11783-7 A.22.63 Lighting data message request - Command)
typedef enum
{
    E_DATA_MSG_REQUEST_NO_DATA_REQUESTED,
    E_DATA_MSG_REQUEST_DATA_REQUESTED,     //!< Response parsing is not implemented
    E_DATA_MSG_REQUEST_RESERVED,
    E_DATA_MSG_REQUEST_DONT_CARE
} EDataMsgRequest;

//! This structure contains all parameters for lighting setting function
typedef struct 
{
    ELightingParameter eDaytimeRunning;                 //!< value of Daytime running lights
    ELightingParameter eAlternateHeadlights;            //!< value of Alternate headlights 
    ELightingParameter eLowBeamHeadlights;              //!< value of Low-beam headlights
    ELightingParameter eHighBeamHeadlights;             //!< value of High-beam headlights

    ELightingParameter eTractorFrontFog;                //!< value of Tractor front fog lights
    ELightingParameter eRotatingBeacon;                 //!< value of Rotating beacon lights
    ELightingParameter eRightTurnSignal;                //!< value of Right-turn signal lights 
    ELightingParameter eLeftTurnSignal;                 //!< value of Left-turn signal lights

    ELightingParameter eBackUp;                         //!< value of Back-up lights and alarm horn
    ELightingParameter eCentreStop;                     //!< value of Centre stop lights
    ELightingParameter eRightStop;                      //!< value of Right stop lights
    ELightingParameter eLeftStop;                       //!< value of Left stop lights

    ELightingParameter eImplementClearance;             //!< value of Implement clearance lights
    ELightingParameter eTractorClearance;               //!< value of Tractor clearance lights
    ELightingParameter eImplementMarker;                //!< value of Implement marker (position) lights
    ELightingParameter eTractorMarker;                  //!< value of Tractor marker (position) lights

    ELightingParameter eRearFog;                        //!< value of Rear fog lights
    ELightingParameter eTractorUndersideMountedWork;    //!< value of Tractor underside-mounted work lights
    ELightingParameter eTractorRearLowMountedWork;      //!< value of Tractor rear low-mounted work lights
    ELightingParameter eTractorRearHighMountedWork;     //!< value of Tractor rear high-mounted work lights

    ELightingParameter eTractorSideLowMountedWork;      //!< value of Tractor side low-mounted work lights
    ELightingParameter eTractorSideHighMountedWork;     //!< value of Tractor side high-mounted work lights
    ELightingParameter eTractorFrontLowMountedWork;     //!< value of Tractor front low-mounted work lights
    ELightingParameter eTractorFrontHighMountedWork;    //!< value of Tractor front high-mounted work lights

    ELightingParameter eImplementOEMOption2;            //!< value of Implement OEM option 2 light
    ELightingParameter eImplementOEMOption1;            //!< value of Implement OEM option 1 light
    ELightingParameter eImplementRightForwardWork;      //!< value of Implement right forward work lights
    ELightingParameter eImplementLeftForwardWork;       //!< value of Implement left forward work lights

    EDataMsgRequest    eDataMsgRequest;                 //!< value of Lighting data message request
    ELightingParameter eImplementRightFacingWork;       //!< value of Implement right-facing work lights
    ELightingParameter eImplementLeftFacingWork;        //!< value of Implement left-facing work lights
    ELightingParameter eImplementRearWork;              //!< value of Implement rear work lights
} TFunctionSetLightingParameters;

//! Enum for valve indexes
typedef enum
{
    E_VALVE_INDEX_0,     //!< valve index 0  used both for measured / estimated values
    E_VALVE_INDEX_1,     //!< valve index 1  used both for measured / estimated values
    E_VALVE_INDEX_2,     //!< valve index 2  used both for measured / estimated values
    E_VALVE_INDEX_3,     //!< valve index 3  used both for measured / estimated values
    E_VALVE_INDEX_4,     //!< valve index 4  used both for measured / estimated values
    E_VALVE_INDEX_5,     //!< valve index 5  used both for measured / estimated values
    E_VALVE_INDEX_6,     //!< valve index 6  used both for measured / estimated values
    E_VALVE_INDEX_7,     //!< valve index 7  used both for measured / estimated values
    E_VALVE_INDEX_8,     //!< valve index 8  used both for measured / estimated values
    E_VALVE_INDEX_9,     //!< valve index 9  used both for measured / estimated values
    E_VALVE_INDEX_10,    //!< valve index 10 used both for measured / estimated values
    E_VALVE_INDEX_11,    //!< valve index 11 used both for measured / estimated values
    E_VALVE_INDEX_12,    //!< valve index 12 used both for measured / estimated values
    E_VALVE_INDEX_13,    //!< valve index 13 used both for measured / estimated values
    E_VALVE_INDEX_14,    //!< valve index 14 used both for measured / estimated values
    E_VALVE_INDEX_15,    //!< valve index 15 used both for measured / estimated values
    E_VALVE_INDEX_LAST = E_VALVE_INDEX_15
} EValveIndex;

//! Enum for valve flow types
typedef enum
{
    E_VALVE_FLOW_TYPE_MEASURED,     //!< Measured flow type
    E_VALVE_FLOW_TYPE_ESTIMATED,    //!< Estimated flow type
    E_VALVE_FLOW_TYPE_LAST = E_VALVE_FLOW_TYPE_ESTIMATED
} EValveFlowType;

//! Estimated state of the fail safe mode of auxiliary valve number 0-15
//! (see ISO11783-7 A.21.13)
typedef enum
{
    E_VALVE_FAIL_SAFE_MODE_BLOCK,
    E_VALVE_FAIL_SAFE_MODE_FLOAT,
    E_VALVE_FAIL_SAFE_MODE_ERROR,
    E_VALVE_FAIL_SAFE_MODE_NOT_AVAILABLE
} EValveFailSafeMode;

//! Estimated state of the auxiliary valve number 0-15
//! (see ISO11783-7 A.21.6)
typedef enum
{
    E_VALVE_STATE_BLOCKED        = 0,   //!< Valve is closed and there is no flow from or to the valve and that
                                        //!< the fluid may be under pressure
    E_VALVE_STATE_EXTEND         = 1,   //!< Flow is controlled from the valves extend 
                                        //!< port and the fluid returns into the retract port
    E_VALVE_STATE_RETRACT        = 2,   //!< Flow is controlled from the valves
                                        //!< retract port and the fluid returns into the extend port
    E_VALVE_STATE_FLOATING       = 3,   //!< There is no control flow from or to the valve and that the valve 
                                        //!< ports are connected directly to the hydraulic fluids tank. This means that 
                                        //!< the hydraulic fluid may flow to or from the valve as driven by the actuator
    E_VALVE_STATE_ERROR          = 14,  //!< Error
    E_VALVE_STATE_NOT_AVAILABLE  = 15   //!< Parameter not supported
} EValveState;

//! This parameter is used to indicate why the auxiliary valve 0 -15 cannot accept remote commands or has most 
//! recently stopped accepting remote commands.
//! (see ISO11783-7 A.21.16)
typedef enum
{
    E_VALVE_EXIT_CODE_ALL_CLEAR                    = 0,  //!< No reason/all clear
    E_VALVE_EXIT_CODE_AWARENESS_NOT_DETECTED       = 1,  //!< Required level of operator presence/awareness not detected
    E_VALVE_EXIT_CODE_RELEASED_CONTROL_OF_FUNCTION = 2,  //!< Implement released control of function 
    E_VALVE_EXIT_CODE_OP_OVERRIDE_OF_FUNCTION      = 3,  //!< Operator override of function
    E_VALVE_EXIT_CODE_OP_CONTROL_INVALID_POSITION  = 4,  //!< Operator control not in valid position
    E_VALVE_EXIT_CODE_REMOTE_CMD_TIMEOUT           = 5,  //!< Remote command timeout
    E_VALVE_EXIT_CODE_REMOTE_CMD_INVALID           = 6,  //!< Remote command out of range / invalid
    E_VALVE_EXIT_CODE_FUNCTION_NOT_CALIBRATED      = 7,  //!< Function not calibrated
    E_VALVE_EXIT_CODE_OP_CONTROL_FAULT             = 8,  //!< Operator control fault 
    E_VALVE_EXIT_CODE_FUNCTION_FAULT               = 9,  //!< Function fault
    E_VALVE_EXIT_CODE_OIL_LEVEL_TOO_LOW            = 20, //!< Hydraulic oil level too low
    E_VALVE_EXIT_CODE_VALVE_LOCKED_OUT             = 21, //!< Valve locked out 
    E_VALVE_EXIT_CODE_ERROR                        = 62, //!< Error
    E_VALVE_EXIT_CODE_NOT_AVAILABLE                = 63  //!< Not available(parameter not supported)
} EValveExitReasonCode;

//! Parameter used to report the Tractor ECUs present estimated / mwasured flow limit status associated with valve 
//! number 0-15 flow commands that are persistent.
//! (see ISO11783-7 A.21.15)
typedef enum
{
    E_VALVE_LIMIT_STATUS_NOT_LIMITED                 = 0,   //!< Not limited
    E_VALVE_LIMIT_STATUS_OPERATOR_LIMITED_CONTROLLED = 1,   //!< Request cannot be implemented
    E_VALVE_LIMIT_STATUS_LIMITED_HIGH                = 2,   //!< Only lower command values result in a change
    E_VALVE_LIMIT_STATUS_LIMITED_LOW                 = 3,   //!< Only higher command values result in a change
    E_VALVE_LIMIT_STATUS_NON_RECOVERABLE_FAULT       = 6,   //!< Non-recoverable fault
    E_VALVE_LIMIT_STATUS_NOT_AVAILABLE               = 7    //!< Parameter not supported
} EValveLimitStatus;

//! Enum for return values of valves activation function
typedef enum
{
    E_VALVE_ACTIVATION_RES_SUCCESS,                      //!< Valve activation was successful
    E_VALVE_ACTIVATION_RES_ERROR_ALREADY_ACTIVE,         //!< Valve is already activated and it is still active
    E_VALVE_ACTIVATION_RES_ERROR_TECU_SERVER_NOT_ACTIVE, //!< TECU server not active
    E_VALVE_ACTIVATION_RES_GENERAL_VALVE_BIT_NOT_ACTIVE, //!< General valve bit not active. After TECU_SRV_VALVE_FLAG 
                                                         //!< is set then each valve can be activated
    E_VALVE_ACTIVATION_RES_INVALID_PARAMETER             //!< Illegal value was passed as parameter to an API function
} EValveActivationResult;

//! Fields that are same for measured / estimated valve types for valves 0-15
typedef struct 
{
    TUint8 u8ValveExtend;               //!< Value reported by the controller of flow through the extend port of
                                        //!< auxiliary valves 0-15 of a tractor which could be based on the commanded
                                        //!< position of the valve.
    TUint8 u8ValveRetract;              //!< Value reported by the controller of flow through the retract port of
                                        //!< auxiliary valves 0-15 of a tractor which could be based on the commanded
                                        //!< position of the valve.
    EValveLimitStatus eLimitStatus;
} TValveStatusGeneral;

//! Fields that are only used for estimated valve type for valve numbers 0-15
typedef struct
{
    EValveFailSafeMode eSafeMode;
    EValveState eState;
    EValveExitReasonCode eExitReasonCode;
} TValveStatusEstimated;

//! Fields that are only used for measured valve type for valve numbers 0-15
typedef struct
{
    TUint16 u16ValveExtendPortPressure;     //!< Measured nominal pressure at the extend port of auxiliary valves
                                            //!< 0-15 of a tractor.
    TUint16 u16ValveRetractPortPressure;    //!< Measured nominal pressure at the retract port of auxiliary valves
                                            //!< 0-15 of a tractor.
    TUint8 u8ValveReturnPortPressure;       //!< Measured nominal pressure at the return port of auxiliary valves
                                            //!< 0-15 of a tractor.
} TValveStatusMeasured;

#endif
