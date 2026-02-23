//**********************************************************************************************************************
//! @file        IsoStackTecu_types.h
//! @brief       API for accessing tractor ECU functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        02.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_TECU_TYPES_H
#define ISOAGLIBS_ISO_STACK_TECU_TYPES_H

// INCLUDES=============================================================================================================

// GLOBAL DEFINES=======================================================================================================

// GLOBAL TYPE DEFINITIONS==============================================================================================

//! Information regarding enumeration "EDiscreteParameter"
//! Measured signal indicating that the discrete parameter is engaged or disengaged.
typedef enum
{
    E_DISCRETE_PARAMETER_DISABLED,     //!< PTO disengaged
    E_DISCRETE_PARAMETER_ENABLED,      //!< PTO engaged
    E_DISCRETE_PARAMETER_ERROR,        //!< Error indication
    E_DISCRETE_PARAMETER_NOT_AVAILABLE //!< Not available
} EDiscreteParameter;

//! Information regarding enumeration "EMachineDirection"
//! Measured signal indicating either forward or reverse as the direction of travel.
//! When the speed is zero, indicate the last travel direction until a different direction is detected
typedef enum
{
    E_MACHINE_DIRECTION_REVERSE,      //!< Reverse
    E_MACHINE_DIRECTION_FORWARD,      //!< Forward
    E_MACHINE_DIRECTION_ERROR,        //!< Error indication
    E_MACHINE_DIRECTION_NOT_AVAILABLE //!< Not available
} EMachineDirection;

//! Information regarding enumeration "EPtoMode":
//! Measured signal indicating that the front/rear power take-off (PTO)
//! mode is either 540 r/min or 1000 r/min
typedef enum
{
    E_PTO_MODE_540_R_MIN,    //!< PTO mode is 540 r/min
    E_PTO_MODE_1000_R_MIN,   //!< PTO mode is 1 000 r/min
    E_PTO_MODE_ERROR,        //!< Error indication
    E_PTO_MODE_NOT_AVAILABLE //!< Not available
} EPtoMode;

//! Information regarding enumeration "ERequestStatus":
//! Parameter used to report the Tractor ECU's status associated with 
//! front/rear PTO engagement requests that are transient/temporary/one-shot
typedef enum
{
    E_REQUEST_STATUS_ACCEPTED,     //!< External request accepted. No subsequent operator intervention.
    E_REQUEST_STATUS_IGNORED,      //!< Control override (most recent external request ignored because
                                   //!< of operator or tractor system override)
    E_REQUEST_STATUS_ERROR,        //!< Error
    E_REQUEST_STATUS_NOT_AVAILABLE //!< Not available (parameter not supported)
} ERequestStatus;

//! Information regarding enumeration "ELimitStatus":
//! Note that the limited conditions (limited high and low) could be temporary, for example when a large set point
//! change is limited by a ramp rate.This bit can be set until the ramp is complete to prevent windup (and subsequent
//! overshoot) due to the response of the controlled value.
//! A non-recoverable fault is non-recoverable from the viewpoint of the implement. Operator action within the tractor
//! may resolve the issue and result in a change to "Operator Limited/Controlled" status.
typedef enum
{
    E_LIMIT_STATUS_NOT_LIMITED,           //!< Not limited
    E_LIMIT_STATUS_OPERATOR_LIMITED,      //!< Request cannot be implemented
    E_LIMIT_STATUS_LIMITED_HIGH,          //!< Only lower command values result in a change
    E_LIMIT_STATUS_LIMITED_LOW,           //!< Only higher command values result in a change
    E_LIMIT_STATUS_RESERVED_1,            //!< Reserved
    E_LIMIT_STATUS_RESERVED_2,            //!< Reserved
    E_LIMIT_STATUS_NON_RECOVERABLE_FAULT, //!< Non-recoverable fault
    E_LIMIT_STATUS_NOT_AVAILABLE          //!< Parameter not supported
} ELimitStatus;

typedef enum
{
    E_LIGHTING_COMMAND_PARAMETER_DEACTIVATE,
    E_LIGHTING_COMMAND_PARAMETER_ACTIVATE,
    E_LIGHTING_COMMAND_PARAMETER_RESERVED,
    E_LIGHTING_COMMAND_PARAMETER_DONT_CARE
} ELightingCommandParameter;

typedef enum
{
    E_LIGHTING_REQUEST_COMMAND_NO_DATA_REQUESTED,
    E_LIGHTING_REQUEST_COMMAND_DATA_REQUESTED,
    E_LIGHTING_REQUEST_COMMAND_RESERVED,
    E_LIGHTING_REQUEST_COMMAND_DONT_CARE
} ELightingRequestCommand;

typedef struct
{
    ELightingCommandParameter eDaytimeRunningLightsCommand;                //!< Command for activating or deactivating the tractors or powered vehicles running lights
    ELightingCommandParameter eAlternateHeadlightsCommand;                 //!< Command for activating or deactivating the machines alternate headlights (on which only low-beam is available)
    ELightingCommandParameter eLowBeamHeadlightsCommand;                   //!< Command for activating or deactivating the machines low-beam headlights
    ELightingCommandParameter eHighBeamHeadlightsCommand;                  //!< Command for activating or deactivating the machines high-beam headlights
    ELightingCommandParameter eTractorFrontFogLightsCommand;               //!< Command for activating or deactivating the tractors front fog lights
    ELightingCommandParameter eRotatingBeaconLightsCommand;                //!< Command for activating or deactivating slow-moving vehicle indicator lights on the tractor or implement or both
    ELightingCommandParameter eRightTurnSignalLightsCommand;               //!< Command for activating or deactivating right-turn signal lights on the tractor and all connected implements 
    ELightingCommandParameter eLeftTurnSignalLightsCommand;                //!< Command for activating or deactivating left-turn signal lights on the tractor and all connected implements
    ELightingCommandParameter eBackUpLightsAndAlarmHornCommand;            //!< Command for activating or deactivating the back-up lights and/or associated alarm if required
    ELightingCommandParameter eCentreStopLightsCommand;                    //!< Command for activating or deactivating the tractors and implements centre stop lights
    ELightingCommandParameter eRightStopLightsCommand;                     //!< Command for activating or deactivating the tractors and implements right stop lights
    ELightingCommandParameter eLeftStopLightsCommand;                      //!< Command for activating or deactivating the tractors and implements left stop lights
    ELightingCommandParameter eImplementClearanceLightsCommand;            //!< Command for activating or deactivating the implements high-mounted clearance lights
    ELightingCommandParameter eTractorClearanceLightsCommand;              //!< Command for activating or deactivating the tractors high-mounted clearance and centre ID lights
    ELightingCommandParameter eImplementMarkerLightsCommand;               //!< Command for activating or deactivating the implements, front position lights, rear red tail lights, side amber 
                                                                           //!< running lights, license - plate(number - plate) lights, and instrumentand switch back lights.
    ELightingCommandParameter eTractorMarkerLightsCommand;                 //!< Command for activating or deactivating the tractors front position lights, rear red tail lights, side amber 
                                                                           //!< running lights, license - plate(number - plate) lights, and instrumentand switch back lights
    ELightingCommandParameter eRearFogLightsCommand;                       //!< Command for activating or deactivating the tractors or implements rear fog lights, or both
    ELightingCommandParameter eTractorUndersideMountedWorkLightsCommand;   //!< Command for activating or deactivating the tractors underside-mounted work lights
    ELightingCommandParameter eTractorRearLowMountedWorkLightsCommand;     //!< Command for activating or deactivating the tractors rear low-mounted work lights
    ELightingCommandParameter eTractorRearHighMountedWorkLightsCommand;    //!< Command for activating or deactivating the tractors rear high-mounted work lights
    ELightingCommandParameter eTractorSideLowMountedWorkLightsCommand;     //!< Command for activating or deactivating the tractors side low-mounted work lights
    ELightingCommandParameter eTractorSideHighMountedWorkLightsCommand;    //!< Command for activating or deactivating the tractors side high-mounted work lights
    ELightingCommandParameter eTractorFrontLowMountedWorkLightsCommand;    //!< Command for activating or deactivating the tractors front low-mounted work lights
    ELightingCommandParameter eTractorFrontHighMountedWorkLightsCommand;   //!< Command for activating or deactivating the tractors front high-mounted work lights
    ELightingCommandParameter eImplementOEMOption2LightCommand;            //!< Command for activating or deactivating an implements OEM option 2 light, which is provided to meet special 
                                                                           //!< needs on implements, such as tank inspection or filling lights
    ELightingCommandParameter eImplementOEMOption1LightCommand;            //!< Command for activating or deactivating an implements OEM (original equipment manufacturer) option 1 light, 
                                                                           //!< which is provided to meet special needs on implements, such as tank inspection or filling lights
    ELightingCommandParameter eImplementRightForwardWorkLightsCommand;     //!< Command for activating or deactivating the forward-facing work lights towards the right end of the implement
    ELightingCommandParameter eImplementLeftForwardWorkLightsCommand;      //!< Command for activating or deactivating the forward-facing work lights towards the left end of the implement
    ELightingRequestCommand   eDataMsgRequestCommand;                      //!< Command for requesting the lighting data message from all lighting controllers, providing the state of all lights
    ELightingCommandParameter eImplementRightFacingWorkLightsCommand;      //!< Command for activating or deactivating work lights mounted on an implement for illuminating beyond the right 
                                                                           //!< end of the implement
    ELightingCommandParameter eImplementLeftFacingWorkLightsCommand;       //!< Command for activating or deactivating work lights mounted on an implement for illuminating beyond the left 
                                                                           //!< end of the implement
    ELightingCommandParameter eImplementRearWorkLightsCommand;             //!< Command for activating or deactivating the implements rear work lights
} TLightingCommandParameters;

#endif
