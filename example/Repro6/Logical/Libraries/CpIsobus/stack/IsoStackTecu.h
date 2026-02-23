//**********************************************************************************************************************
//! @file        IsoStackTecu.h
//! @brief       API for accessing tractor ECU functionality (messages from TECU are defined in ISO 11783-7)
//! @author      Markus Schiffmann (MSCI)
//! @date        01.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_TECU_H
#define ISOAGLIBS_ISO_STACK_TECU_H

// INCLUDES=============================================================================================================

#include "IsoStackTecu_types.h"

// "ISOAGLIBSE_API" can be set to "__declspec(dllexport)" to build the Windows DLL version of ISOAgLib SE and to
// "__declspec(dllimport)" to use the Windows DLL version of ISOAgLib SE (this setting can be done e.g. in file
// "HalTypedef.h" or in project configuration).
#ifndef ISOAGLIBSE_API
#define ISOAGLIBSE_API
#endif

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION DECLARATIONS=========================================================================================

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns if the value of "u8Value" is a valid signal value or not.
//!
//! @param[in]    u8Value    value
//!
//! @retval       TRUE       value of "u8Value" is a valid signal value
//! @retval       FALSE      value of "u8Value" is not a valid signal value
//!
//! @date         30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackTecuIsSignalValidU8(TUint8 u8Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns if the value of "u16Value" is a valid signal value or not.
//!
//! @param[in]    u16Value    value
//!
//! @retval       TRUE        value of "u16Value" is a valid signal value
//! @retval       FALSE       value of "u16Value" is not a valid signal value
//!
//! @date         30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackTecuIsSignalValidU16(TUint16 u16Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns if the value of "u32Value" is a valid signal value or not.
//!
//! @param[in]    u32Value    value
//!
//! @retval       TRUE        value of "u32Value" is a valid signal value
//! @retval       FALSE       value of "u32Value" is not a valid signal value
//!
//! @date         30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackTecuIsSignalValidU32(TUint32 u32Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear PTO speed (measured rotational speed of the rear power take-off (PTO) output
//!        shaft; unit is 0.125 rpm). For existing tractors that monitor PTO speed prior to the engagement clutch, the
//!        PTO speed will only be valid when PTO is engaged, and will be unavailable when disengaged.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear PTO speed (unit is 0.125 rpm)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackTecuGetRearPtoSpeed(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear PTO speed set point (measured value of the set point of the rotational speed
//!        of the rear power take-off (PTO) output shaft; unit is 0.125 rpm).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear PTO speed set point (unit is 0.125 rpm)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackTecuGetRearPtoSpeedSetPoint(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear PTO engagement. If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear PTO engagement
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EDiscreteParameter eIsoStackTecuGetRearPtoEng(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear PTO mode. If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear PTO mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EPtoMode eIsoStackTecuGetRearPtoMode(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear PTO economy mode (measured signal indicating that the rear power take-off
//!        (PTO) economy mode is engaged or disengaged; economy mode PTO operates at 540 r/min or 1 000 r/min at lower
//!        engine revolutions).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear PTO economy mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EDiscreteParameter eIsoStackTecuGetRearPtoEcMode(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear PTO engagement request status (parameter used to report the tractor ECU's
//!        status associated with rear PTO engagement requests that are transient/temporary/one-shot).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear PTO engagement request status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ERequestStatus eIsoStackTecuGetRearPtoEngRequestStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear PTO mode request status (parameter used to report the tractor ECU's status
//!        associated with rear PTO mode requests that are transient/temporary/one-shot).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear PTO mode request status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ERequestStatus eIsoStackTecuGetRearPtoModeRequestStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear PTO economy mode request status (parameter used to report the tractor ECU's
//!        status associated with rear PTO economy mode requests that are transient/temporary/one-shot).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear PTO economy mode request status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ERequestStatus eIsoStackTecuGetRearPtoEcModeRequestStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear PTO speed limit status (parameter used to report the tractor ECU's present
//!        limit status associated with rear PTO shaft speed commands that are persistent).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear PTO speed limit status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ELimitStatus eIsoStackTecuGetRearPtoSpeedLimitStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front PTO speed (measured rotational speed of the front power take-off (PTO) output
//!        shaft; unit is 0.125 rpm). For existing tractors that monitor PTO speed prior to the engagement clutch, the
//!        PTO speed will only be valid when PTO is engaged, and will be unavailable when disengaged.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front PTO speed (unit is 0.125 rpm)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackTecuGetFrontPtoSp(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front PTO speed set point (measured value of the set point of the rotational speed
//!        of the front power take-off (PTO) output shaft; unit is 0.125 rpm).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front PTO speed set point (unit is 0.125 rpm)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackTecuGetFrontPtoSpSetPoint(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front PTO engagement. If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front PTO engagement
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EDiscreteParameter eIsoStackTecuGetFrontPtoEng(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front PTO mode. If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front PTO mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EPtoMode eIsoStackTecuGetFrontPtoMode(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front PTO economy mode (measured signal indicating that the front power take-off
//!        (PTO) economy mode is engaged or disengaged; economy mode PTO operates at 540 r/min or 1 000 r/min at lower
//!        engine revolutions).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front PTO economy mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EDiscreteParameter eIsoStackTecuGetFrontPtoEcMode(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front PTO engagement request status (parameter used to report the tractor ECU's
//!        status associated with front PTO engagement requests that are transient/temporary/one-shot).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front PTO engagement request status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ERequestStatus eIsoStackTecuGetFrontPtoEngRequestStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front PTO mode request status (parameter used to report the tractor ECU's status
//!        associated with front PTO mode requests that are transient/temporary/one-shot).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front PTO mode request status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ERequestStatus eIsoStackTecuGetFrontPtoModeRequestStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front PTO economy mode request status (parameter used to report the tractor ECU's
//!        status associated with front PTO economy mode requests that are transient/temporary/one-shot).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front PTO economy mode request status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ERequestStatus eIsoStackTecuGetFrontPtoEcModeRequestStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front PTO speed limit status (parameter used to report the tractor ECU's present
//!        limit status associated with front PTO shaft speed commands that are persistent).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front PTO speed limit status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ELimitStatus eIsoStackTecuGetFrontPtoSpeedLimitStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear hitch position (measured position of the rear three-point hitch; it is
//!        expressed as a percentage of full travel: 0 % indicates the full down position, 100 % the full up position;
//!        unit is 0.4 %).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear hitch position (unit is 0.4 %)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackTecuGetRearHitchPosition(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear hitch in-work indication (measured signal indicating that the rear hitch is
//!        positioned below (in-work) or above (out-of-work) an adjustable switching threshold).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear hitch in-work indication
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EDiscreteParameter eIsoStackTecuGetRearHitchInWorkIndication(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear hitch position limit status (parameter used to report the tractor ECU's
//!        present limit status associated with the rear hitch position commands that are persistent).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear hitch position limit status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ELimitStatus eIsoStackTecuGetRearHitchPositionLimitStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear nominal lower link force (measurement providing an indication of draft at the
//!        lower links of the rear three-point hitch; unit is 0.8 % with offset -100 %; data range is -100 % to 100 %).
//!        Nominal lower link force may be expected to be approximately linear with respect to draft and may be
//!        proportional to draft for a single hitch position. This measurement is typically obtained from a transducer
//!        on the lower hitch links and typically used as raw data in draft control. A positive value indicates the
//!        force applied to the tractor opposed to its heading.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear nominal lower link force (unit is 0.8 % with offset -100 %; data range is -100 %
//!                               to 100 %)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackTecuGetRearNominalLowerLinkForce(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the rear draft (apparent horizontal force applied to the rear hitch by an implement;
//!        unit is 10 N with offset -320000 N; data range is -320000 N to 322550 N).
//!        A positive value indicates the force applied to the tractor opposed to its heading.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       rear draft (unit is 10 N with offset -320000 N; data range is -320000 N to 322550 N)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackTecuGetRearDraft(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front hitch position (measured position of the front three-point hitch; it is
//!        expressed as a percentage of full travel: 0 % indicates the full down position, 100 % the full up position;
//!        unit is 0.4 %).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front hitch position (unit is 0.4 %)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackTecuGetFrontHitchPosition(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front hitch in-work indication (measured signal indicating that the front hitch is
//!        positioned below (in-work) or above (out-of-work) an adjustable switching threshold).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front hitch in-work indication
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EDiscreteParameter eIsoStackTecuGetFrontHitchInWorkIndication(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front hitch position limit status (parameter used to report the tractor ECU's
//!        present limit status associated with the front hitch position commands that are persistent).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front hitch position limit status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API ELimitStatus eIsoStackTecuGetFrontHitchPositionLimitStatus(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front nominal lower link force (measurement providing an indication of draft at the
//!        lower links of the front three-point hitch; unit is 0.8 % with offset -100 %; data range is -100 % to 100 %).
//!        Nominal lower link force may be expected to be approximately linear with respect to draft and may be
//!        proportional to draft for a single hitch position. This measurement is typically obtained from a transducer
//!        on the lower hitch links and typically used as raw data in draft control. A positive value indicates the
//!        force applied to the tractor opposed to its heading.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front nominal lower link force (unit is 0.8 % with offset -100 %; data range is -100 %
//!                               to 100 %)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackTecuGetFrontNominalLowerLinkForce(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the front draft (apparent horizontal force applied to the front hitch by an implement;
//!        unit is 10 N with offset -320000 N; data range is -320000 N to 322550 N).
//!        A positive value indicates the force applied to the tractor opposed to its heading.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       front draft (unit is 10 N with offset -320000 N; data range is -320000 N to 322550 N)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      30.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackTecuGetFrontDraft(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the wheel-based speed (the value of the speed of a machine as calculated from the
//!        measured wheel or tail-shaft speed; unit is 0.001 m/s).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       wheel-based speed (unit is 0.001 m/s)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackTecuGetWheelBasedSpeed(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the wheel-based distance (distance travelled by a machine as calculated from wheel or
//!        tail-shaft speed; unit is 0.001 m).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       wheel-based distance (unit is 0.001 m)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackTecuGetWheelBasedDistance(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the maximum time of tractor power (maximum time of remaining tractor or
//!        power-unit-supplied electrical power at the current load; unit is minutes). This parameter may be estimated
//!        rather than being a measured value.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       maximum time of tractor power (unit is minutes)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackTecuGetMaxTimeOfPower(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the operator direction reversed parameter. This parameter indicates whether the
//!        reported direction is reversed from the perspective of the operator (e.g. the operator station has been
//!        reversed such that forward direction actually moves the operator backwards).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       operator direction reversed parameter
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EDiscreteParameter eIsoStackTecuGetOperatorDirectionReversed(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the start/stop state. State of a switch or other operator input to start or enable
//!        implement operations. The start or enabled state can be the result of the implement being positioned in an
//!        operating position. It can be generated by an operator placing a switch to an ON state. Also called
//!        "Master ON/OFF" switch.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       start/stop state
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EDiscreteParameter eIsoStackTecuGetStartStopState(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the key switch state (indicates the key switch state of the tractor or power unit).
//!        This does not indicate unforeseen power interruptions such as those caused by starting the engine.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       key switch state
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EDiscreteParameter eIsoStackTecuGetKeySwitchState(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the wheel-based direction (measured signal indicating either forward or reverse as the
//!        direction of travel). When the speed is zero, the last travel direction is indicated until a different
//!        direction is detected or selected and engaged.
//!        Forward and reverse refer to the normal directions of travel of the tractor or implement chassis. The
//!        direction does not change when the operator's perspective is changed (i.e. when operator station is
//!        reversed).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       wheel-based direction
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EMachineDirection eIsoStackTecuGetWheelBasedDirection(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the ground-based speed (actual ground speed of a machine, measured by a sensor such as
//!        radar; unit is 0.001 m/s).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       ground-based speed (unit is 0.001 m/s)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackTecuGetGroundBasedSpeed(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the ground-based distance (actual distance travelled by a machine, based on
//!        measurements from a sensor such as radar; unit is 0.001 m).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       ground-based distance (unit is 0.001 m)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackTecuGetGroundBasedDistance(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the ground-based direction (measured signal indicating either forward or reverse as the
//!        direction of travel). When the speed is zero, the last travel direction is indicated until a different
//!        direction is detected.
//!        Forward and reverse refer to the normal directions of travel of the tractor or implement chassis. The
//!        direction does not change when the operator's perspective is changed (i.e. when operator station is
//!        reversed).
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                       ground-based direction
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuData    TECU data table
//!
//! @date      29.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EMachineDirection eIsoStackTecuGetGroundBasedDirection(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the structure that contains the lighting command parameters.
//!        All 32 lighting command parameters are part of that structure. Each command is described in detail in the
//!        structure declaration.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!        If a NULL pointer is passed as parameter to this function
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_NULL_POINTER_AS_PARAMETER)" is called.
//! 
//! @param[out]    ptLightingCommandParameters    lighting command parameters which will be set when 
//!                                               "vIsoStackTecuGetLightingCommandParameters" is called
//!
//! Static variables affected:\n
//!  -[in]         \b m_atTecuData                TECU data table
//!
//! @date          31.03.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackTecuGetLightingCommandParameters(TLightingCommandParameters* ptLightingCommandParameters);

#endif
