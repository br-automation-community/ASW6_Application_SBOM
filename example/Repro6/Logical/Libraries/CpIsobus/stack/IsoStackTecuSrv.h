//**********************************************************************************************************************
//! @file        IsoStackTecuSrv.h
//! @brief       API for accessing tractor ECU server functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        21.06.2019
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_TECU_SRV_H
#define ISOAGLIBS_ISO_STACK_TECU_SRV_H

// INCLUDES=============================================================================================================

#include <IsoStackCore_types.h>
#include <IsoStackTecuSrv_types.h>
#include <IsoStackTecu_types.h>

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION DECLARATIONS=========================================================================================

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function activates the TECU server module, i.e. sets TECU facilities, and enables PGNs to be send.
//!        If you set flag TECU_SRV_VALVE_FLAG in the facilities, you have to call function
//!        "eIsoStackTecuSrvActivateValve()" at least for one index and flow type.
//!
//! @param[in]    u32TecuSrvBitMaskFacilitiesActivate         BitMask to enable TECU facilities (use enum ETecuSrvFlags)
//!
//! @return                                                   result of activation (see definition of
//!                                                           "ETecuSrvActivationResult")
//!
//! Static variables affected:\n
//!  -[out]       \b m_atTecuSrvData                          TECU server data table
//!  -[in]        \b m_u32TecuSrvBitMaskFacilitiesActivate    TECU server facilities bit mask
//!  -[out]       \b m_au8Facilities                          facilities message data
//!  -[in]        \b m_boTecuSrvActivated                     TECU server activated boolean
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

ETecuSrvActivationResult eIsoStackTecuSrvActivate(TUint32 u32TecuSrvBitMaskFacilitiesActivate);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function deactivates the TECU server module, i.e. sets TECU activated boolean to false.
//!
//! @return                              result of deactivation (see definition of "ETecuSrvDeactivationResult")
//!
//! Static variables affected:\n
//!  -[in]    \b m_boTecuSrvActivated    TECU server activated boolean
//!
//! @date     21.06.2019
//----------------------------------------------------------------------------------------------------------------------

ETecuSrvDeactivationResult eIsoStackTecuSrvDeactivate(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns boolean value if TECU server has to be powered down.
//!
//! @retval       TRUE                                   TECU server has to be powered down.
//! @retval       FALSE                                  TECU server does not have to be powered down.
//!
//! Static variables affected:\n
//!  -[out]    \b m_boPowerOn
//!  -[out]    \b m_boEcuPowerOn
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TBoolean boIsoStackTecuSrvNeedToPowerDown(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns boolean value if maintain power is requested.
//!
//! @retval       TRUE                                   Maintain power requested.
//! @retval       FALSE                                  Maintain power not requested.
//!
//! Static variables affected:\n
//!  -[out]    \b m_boPowerOn
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TBoolean boIsoStackTecuSrvShallPowerBeSwitchedOn(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns boolean value if maintain ECU power is requested.
//!
//! @retval       TRUE                                   Maintain ECU power requested.
//! @retval       FALSE                                  Maintain ECU power not requested.
//!
//! Static variables affected:\n
//!  -[out]    \b m_boEcuPowerOn
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TBoolean boIsoStackTecuSrvShallEcuPowerBeSwitchedOn(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear PTO speed (measured rotational speed of the rear power take-off (PTO) output
//!        shaft; unit is 0.125 rpm). For existing tractors that monitor PTO speed prior to the engagement clutch, the
//!        PTO speed will only be valid when PTO is engaged, and will be unavailable when disengaged.
//!
//! @param[in]    u16RearPtoSpeed          16 bits value of Rear PTO Speed (unit is 0.125 rpm)
//!                                        Data range: 0.0 rpm to 8031.875 rpm
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearPtoSpeed(TUint16 u16RearPtoSpeed);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear PTO speed set point (measured value of the set point of the rotational speed
//!        of the rear power take-off (PTO) output shaft; unit is 0.125 rpm).
//!
//! @param[in]    u16RearPtoSpeedSetPoint  16 bits value of Rear PTO Speed Set Point (unit is 0.125 rpm)
//!                                        Data range: 0.0 rpm to 8031.875 rpm
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearPtoSpSetPoint(TUint16 u16RearPtoSpeedSetPoint);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear PTO engagement.
//!
//! @param[in]    eFrontPtoEng             value of Rear PTO Engagement
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearPtoEng(EDiscreteParameter eRearPtoEng);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear PTO mode.
//!
//! @param[in]    eRearPtoMode             value of Rear PTO Mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearPtoMode(EPtoMode eRearPtoMode);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear PTO economy mode (measured signal indicating that the rear power take-off
//!        (PTO) economy mode is engaged or disengaged; economy mode PTO operates at 540 r/min or 1 000 r/min at lower
//!        engine revolutions).
//!
//! @param[in]    eRearPtoEcMode           value of Rear PTO Economy Mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearPtoEcMode(EDiscreteParameter eRearPtoEcMode);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear PTO engagement request status (parameter used to report the tractor ECU's
//!        status associated with rear PTO engagement requests that are transient/temporary/one-shot).
//!
//! @param[in]    eRearPtoEngRequestStatus       value of Rear PTO Engagement Request Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearPtoEngRequestStatus(ERequestStatus eRearPtoEngRequestStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear PTO mode request status (parameter used to report the tractor ECU's status
//!        associated with rear PTO mode requests that are transient/temporary/one-shot).
//!
//! @param[in]    eRearPtoModeRequestStatus      value of Rear PTO Mode Request Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearPtoModeRequestStatus(ERequestStatus eRearPtoModeRequestStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear PTO economy mode request status (parameter used to report the tractor ECU's
//!        status associated with rear PTO economy mode requests that are transient/temporary/one-shot).
//!
//! @param[in]    eRearPtoEcModeRequestStatus    value of Rear PTO Economy Mode Request Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearPtoEcMdRequestStatus(ERequestStatus eRearPtoEcModeRequestStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear PTO speed limit status (parameter used to report the tractor ECU's present
//!        limit status associated with rear PTO shaft speed commands that are persistent).
//!
//! @param[in]    eRearPtoSpeedLimitStatus       value of Rear PTO Speed Limit Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearPtoSpLimitStatus(ELimitStatus eRearPtoSpeedLimitStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front PTO speed (measured rotational speed of the front power take-off (PTO) output
//!        shaft; unit is 0.125 rpm). For existing tractors that monitor PTO speed prior to the engagement clutch, the
//!        PTO speed will only be valid when PTO is engaged, and will be unavailable when disengaged.
//!
//! @param[in]    u16FrontPtoSp            16 bits value of Front PTO Speed (unit is 0.125 rpm)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontPtoSp(TUint16 u16FrontPtoSp);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front PTO speed set point (measured value of the set point of the rotational speed
//!        of the front power take-off (PTO) output shaft; unit is 0.125 rpm).
//!
//! @param[in]    u16FrontPtoSpSetPoint    16 bits value of Front PTO Speed Set Point (unit is 0.125 rpm)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontPtoSpSetPoint(TUint16 u16FrontPtoSpSetPoint);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front PTO engagement.
//!
//! @param[in]    eFrontPtoEng             value of Front PTO Engagement
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontPtoEng(EDiscreteParameter eFrontPtoEng);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front PTO mode.
//!
//! @param[in]    eFrontPtoMode            value of Front PTO Mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontPtoMode(EPtoMode eFrontPtoMode);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front PTO economy mode (measured signal indicating that the front power take-off
//!        (PTO) economy mode is engaged or disengaged; economy mode PTO operates at 540 r/min or 1 000 r/min at lower
//!        engine revolutions).
//!
//! @param[in]    eFrontPtoEcMode          value of Front PTO Economy Mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontPtoEcMode(EDiscreteParameter eFrontPtoEcMode);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front PTO engagement request status (parameter used to report the tractor ECU's
//!        status associated with front PTO engagement requests that are transient/temporary/one-shot).
//!
//! @param[in]    eFrontPtoEngRequestStatus      value of Front PTO Engagement Request Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontPtoEngRequestStatus(ERequestStatus eFrontPtoEngRequestStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front PTO mode request status (parameter used to report the tractor ECU's status
//!        associated with front PTO mode requests that are transient/temporary/one-shot).
//!
//! @param[in]    eFrontPtoModeRequestStatus     value of Front PTO Mode Request Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontPtoMdRequestStatus(ERequestStatus eFrontPtoModeRequestStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front PTO economy mode request status (parameter used to report the tractor ECU's
//!        status associated with front PTO economy mode requests that are transient/temporary/one-shot).
//!
//! @param[in]    eFrontPtoEcModeRequestStatus   value of Front PTO Economy Mode Request Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrPtoEcMdRequestStatus(ERequestStatus eFrontPtoEcModeRequestStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front PTO speed limit status (parameter used to report the tractor ECU's present
//!        limit status associated with front PTO shaft speed commands that are persistent).
//!
//! @param[in]    eFrontPtoSpeedLimitStatus      value of Front PTO Speed Limit Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontPtoSpeedLimitStatus(ELimitStatus eFrontPtoSpeedLimitStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear hitch position (measured position of the rear three-point hitch; it is
//!        expressed as a percentage of full travel: 0 % indicates the full down position, 100 % the full up position;
//!        unit is 0.4 %).
//!
//! @param[in]    u8RearHitchPosition            value of Rear Hitch Position (unit is 0.4 %)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearHitchPosition(TUint8 u8RearHitchPosition);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear hitch in-work indication (measured signal indicating that the rear hitch is
//!        positioned below (in-work) or above (out-of-work) an adjustable switching threshold).
//!
//! @param[in]    eRearHitchInWorkIndication     value of Rear Hitch In-work Indication
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearHitchInWorkIndication(EDiscreteParameter eRearHitchInWorkIndication);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear hitch position limit status (parameter used to report the tractor ECU's
//!        present limit status associated with the rear hitch position commands that are persistent).
//!
//! @param[in]    eRearHitchPositionLimitStatus  value of Rear Hitch Position Limit Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearHitchPsLimitStatus(ELimitStatus eRearHitchPositionLimitStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear nominal lower link force (measurement providing an indication of draft at the
//!        lower links of the rear three-point hitch; unit is 0.8 % with offset -100 %; data range is -100 % to 100 %).
//!        Nominal lower link force may be expected to be approximately linear with respect to draft and may be
//!        proportional to draft for a single hitch position. This measurement is typically obtained from a transducer
//!        on the lower hitch links and typically used as raw data in draft control. A positive value indicates the
//!        force applied to the tractor opposed to its heading.
//!
//! @param[in]    u8RearNominalLowerLinkForce    value of Rear Nominal Lower Link Force 
//!                                              (unit is 0.8 % with offset -100 %; data range is -100 %
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearNominalLowerLinkForce(TUint8 u8RearNominalLowerLinkForce);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the rear draft (apparent horizontal force applied to the rear hitch by an implement;
//!        unit is 10 N with offset -320000 N; data range is -320000 N to 322550 N).
//!        A positive value indicates the force applied to the tractor opposed to its heading.
//!
//! @param[in]    u16RearDraft                   value of Rear Draft (unit is 10 N with offset -320000 N)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetRearDraft(TUint16 u16RearDraft);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front hitch position (measured position of the front three-point hitch; it is
//!        expressed as a percentage of full travel: 0 % indicates the full down position, 100 % the full up position;
//!        unit is 0.4 %).
//!
//! @param[in]    u8FrontHitchPosition           value of Front Hitch Position (unit is 0.4 %)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontHitchPosition(TUint8 u8FrontHitchPosition);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front hitch in-work indication (measured signal indicating that the front hitch is
//!        positioned below (in-work) or above (out-of-work) an adjustable switching threshold).
//!
//! @param[in]    eFrontHitchInWorkIndication    value of Front Hitch In-work Indication
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontHitchInWorkIndication(EDiscreteParameter eFrontHitchInWorkIndication);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front hitch position limit status (parameter used to report the tractor ECU's
//!        present limit status associated with the front hitch position commands that are persistent).
//!
//! @param[in]    eFrontHitchPositionLimitStatus value of Front Hitch Position Limit Status
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrHitchPsLimitStatus(ELimitStatus eFrontHitchPositionLimitStatus);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front nominal lower link force (measurement providing an indication of draft at the
//!        lower links of the front three-point hitch; unit is 0.8 % with offset -100 %; data range is -100 % to 100 %).
//!        Nominal lower link force may be expected to be approximately linear with respect to draft and may be
//!        proportional to draft for a single hitch position. This measurement is typically obtained from a transducer
//!        on the lower hitch links and typically used as raw data in draft control. A positive value indicates the
//!        force applied to the tractor opposed to its heading.
//!
//! @param[in]    u8FrontNominalLowerLinkForce   value of Front Nominal Lower Link Force 
//!                                              (unit is 0.8 % with offset -100 %; data range is -100 % to 100 %)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontNominalLowerLinkForce(TUint8 u8FrontNominalLowerLinkForce);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the front draft (apparent horizontal force applied to the front hitch by an implement;
//!        unit is 10 N with offset -320000 N; data range is -320000 N to 322550 N).
//!        A positive value indicates the force applied to the tractor opposed to its heading.
//!
//! @param[in]    u16FrontDraft                  value of Front Draft
//!                                              (unit is 10 N with offset -320000 N; 
//!                                              data range is -320000 N to 322550 N)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetFrontDraft(TUint16 u16FrontDraft);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the wheel based speed (the value of the speed of a machine as calculated from the
//!        measured wheel or tail-shaft speed; unit is 0.001 m/s).
//!
//! @param[in]    u16WheelBasedSpeed       16 bits value of Wheel Based speed (unit is 0.001 m/s)
//!                                        Data range: 0 m/s to 64.255 m/s
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetWheelBasedSpeed(TUint16 u16WheelBasedSpeed);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the wheel based distance (distance travelled by a machine as calculated from wheel or
//!        tail-shaft speed; unit is 0.001 m).
//!
//! @param[in]    u32WheelBasedDistance          value of Wheel Based Distance (unit is 0.001 m)
//!                                              Data range: 0 m to 4 211 081.215 m
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetWheelBsdDistance(TUint32 u32WheelBasedDistance);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the maximum time of tractor power (maximum time of remaining tractor or
//!        power-unit-supplied electrical power at the current load; unit is minutes). This parameter may be estimated
//!        rather than being a measured value.
//!
//! @param[in]    u8MaxTimeOfPower               value of Maximum Time of Tractor Power (unit is minutes)
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetMaxTimeOfPower(TUint8 u8MaxTimeOfPower);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the operator direction reversed parameter. This parameter indicates whether the
//!        reported direction is reversed from the perspective of the operator (e.g. the operator station has been
//!        reversed such that forward direction actually moves the operator backwards).
//!
//! @param[in]    eOperatorDirectionReversed     value of Operator Direction Reversed parameter
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetOperatorDirectionReversed(EDiscreteParameter eOperatorDirectionReversed);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the start/stop state. State of a switch or other operator input to start or enable
//!        implement operations. The start or enabled state can be the result of the implement being positioned in an
//!        operating position. It can be generated by an operator placing a switch to an ON state. Also called
//!        "Master ON/OFF" switch.
//!
//! @param[in]    eStartStopState                value of start/stop State
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetStartStopState(EDiscreteParameter eStartStopState);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the key switch state and updates m_u32TecuSrvMaintainEcuPowerTimestamp and
//!        m_u32TecuSrvMaintainActuatorPowerTimestamp. If Key Switch State is disabled, it is not possible to change it
//!        through this function again. Application has to completely restart ISOAgLibSE.
//!
//! @param[in]    eKeySwitchState                                     value of Key Switch State
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                                     TECU server data table
//!  -[out]    \b m_u32TecuSrvMaintainEcuPowerTimestam
//!  -[out]    \b m_u32TecuSrvMaintainActuatorPowerTimestamp
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetKeySwitchState(EDiscreteParameter eKeySwitchState);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the wheel based direction (measured signal indicating either forward or reverse as the
//!        direction of travel). When the speed is zero, the last travel direction is indicated until a different
//!        direction is detected or selected and engaged.
//!        Forward and reverse refer to the normal directions of travel of the tractor or implement chassis. The
//!        direction does not change when the operator's perspective is changed (i.e. when operator station is
//!        reversed).
//!
//! @param[in]    eWheelBasedDirection           value of Wheel Based Direction
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetWheelBsdDirection(EMachineDirection eWheelBasedDirection);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the ground based speed (actual ground speed of a machine, measured by a sensor such as
//!        radar; unit is 0.001 m/s).
//!
//! @param[in]    u16GroundBasedSpeed      16 bits value of Ground Based speed (unit is 0.001 m/s)
//!                                        Data range: 0 m/s to 64.255 m/s
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData          TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetGroundBasedSpeed(TUint16 u16GroundBasedSpeed);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the ground based distance (actual distance travelled by a machine, based on
//!        measurements from a sensor such as radar; unit is 0.001 m).
//!
//! @param[in]    u32GroundBasedDistance         value of Ground Based Distance (unit is 0.001 m)
//!                                              Data range: 0 m to 4 211 081.215 m
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetGroundBsdDistance(TUint32 u32GroundBasedDistance);

//----------------------------------------------------------------------------------------------------------------------
//!  @brief This function sets the time/date.
//!
//!  @param[in]    u32Time                       value of Time (Byte 1 = 0.25 s/bit, 0 s offset
//!                                                             Byte 2 = 1 min/bit, 0 min offset
//!                                                             Byte 3 = 1 h/bit, 0 h offset)
//!  @param[in]    u32Date                       value of Date (Byte 1 = 1 month/bit, 0 month offset
//!                                                             Byte 2 = 0.25 d/bit, 0 day offset
//!                                                             Byte 3 = 1 year/bit, + 1985 year offset)
//!  @param[in]    u8LocalMinuteOffset           value of local offset (1 min/bit, −125 min offset)
//!  @param[in]    u8LocalHourOffset             value of hour offset (1 h/bit, −125 h offset)
//! 
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         28.07.2021
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetTimeDate(
    TUint32 u32Time,
    TUint32 u32Date,
    TUint8 u8LocalMinuteOffset,
    TUint8 u8LocalHourOffset);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the lighting command. Global message from the tractor to all lighting controllers on the
//!        tractor and attached implements.
//! 
//! @param[in]    cptLights             pointer on structure TFunctionSetLightingParameters (must not be NULL)
//! 
//! @return                             result of setting (see definition of "ETecuSrvSettingResult")
//! 
//! Static variables affected:\n
//!  -[in]        \b m_atTecuSrvData    TECU server data table
//!
//! @date         28.07.2021
//----------------------------------------------------------------------------------------------------------------------

ETecuSrvSettingResult eIsoStackTecuSrvSetLightingCommand(const TFunctionSetLightingParameters* cptLights);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the valve estimated flow for valves 0 - 15.
//!
//! @param[in]    eIndex                                               value of valve index (0 - 15)
//! @param[in]    cptFunctionParamsGeneral->u8ValveExtend              Resolution: 1 % / bit, -125 % offset;
//!                                                                    Data range: -125 % to 125 %;
//!                                                                    [0 - 250] valid input values
//! @param[in]    cptFunctionParamsGeneral->u8ValveRetract             Resolution: 1 % / bit, -125 % offset;
//!                                                                    Data range: -125 % to 125 %;
//!                                                                    [0 - 250] valid input values
//! @param[in]    cptFunctionParamsEstimated->eSafeMode                value of valve fail safe mode
//! @param[in]    cptFunctionParamsEstimated->eState                   value of valve state
//!
//! @return                                                            result of setting (see definition of
//!                                                                    "ETecuSrvSettingResult")
//!
//! Static variables affected:\n
//! -[in]         \b m_atTecuSrvData                                   TECU server data table
//!
//! @date         03.03.2022
//----------------------------------------------------------------------------------------------------------------------

ETecuSrvSettingResult eIsoStackTecuSrvValveSetEstimated(
    EValveIndex eIndex,
    const TValveStatusGeneral* cptFunctionParamsGeneral,
    const TValveStatusEstimated* cptFunctionParamsEstimated);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the valve measured flow for valves 0 - 15.
//!
//! @param[in]    eIndex                                                    value of valve index (0 - 15)
//! @param[in]    cptFunctionParamsGeneral->u8ValveExtend                   Resolution: 1 % / bit, -125 % offset;
//!                                                                         Data range: -125 % to 125 %;
//!                                                                         [0 - 250] valid input values
//! @param[in]    cptFunctionParamsGeneral->u8ValveRetract                  Resolution: 1 % / bit, -125 % offset;
//!                                                                         Data range: -125 % to 125 %;
//!                                                                         [0 - 250] valid input values
//! @param[in]    cptFunctionParamsMeasured->u16ValveExtendPortPressure     Resolution: 5 kPa / bit, 0 offset;
//!                                                                         Data range: 0 kPa to 321 275 kPa
//! @param[in]    cptFunctionParamsMeasured->u16ValveRetractPortPressure    Resolution: 5 kPa / bit, 0 offset;
//!                                                                         Data range: 0 kPa to 321 275 kPa
//! @param[in]    cptFunctionParamsMeasured->u8ValveReturnPortPressure      Resolution: 16 kPa/bit, 0 offset;
//!                                                                         Data range: 0 kPa to 4 000 kPa
//!
//! @return                                                                 result of setting (see definition of
//!                                                                         "ETecuSrvSettingResult")
//!
//! Static variables affected:\n
//! -[in]         \b m_atTecuSrvData                                        TECU server data table
//!
//! @date         03.03.2022
//----------------------------------------------------------------------------------------------------------------------

ETecuSrvSettingResult eIsoStackTecuSrvValveSetMeasured(
    EValveIndex eIndex,
    const TValveStatusGeneral* cptFunctionParamsGeneral,
    const TValveStatusMeasured* cptFunctionParamsMeasured);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function activates auxiliary valves 0 - 15, i.e. enables PGNs to be sent. Function activates both
//!        measured and estimated types of valves. In order to activate any valve with this function, first
//!        call "eIsoStackTecuSrvActivate()" function with following flag TECU_SRV_VALVE_FLAG which
//!        will activate general valve bit.
//!        And on the other hand if you set flag TECU_SRV_VALVE_FLAG when calling "eIsoStackTecuSrvActivate()", you
//!        have to call this function ("eIsoStackTecuSrvActivateValve()") at least for one index and flow type.
//! 
//!  @param[in]    eIndex                                                value of valve index (0 - 15)
//!  @param[in]    eValveFlowType                                        value of valve flow type (estimated / measured)
//! 
//!  @retval       E_VALVE_ACTIVATION_RES_SUCCES                         Valve activation was successful 
//!	 @retval       E_VALVE_ACTIVATION_RES_ERROR_ALREADY_ACTIVE           Valve is already activated
//!  @retval       E_VALVE_ACTIVATION_RES_ERROR_TECU_SERVER_NOT_ACTIVE   TECU server not active
//!  @retval       E_VALVE_ACTIVATION_RES_GENERAL_VALVE_BIT_NOT_ACTIVE   General valve bit is not activated
//!  @retval       E_VALVE_ACTIVATION_RES_INVALID_PARAMETER              Illegal value was passed as parameter
//!
//!  Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//! 
//!  @date         03.03.2022
//----------------------------------------------------------------------------------------------------------------------

EValveActivationResult eIsoStackTecuSrvActivateValve(EValveIndex eIndex, EValveFlowType eValveFlowType);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the ground based direction (measured signal indicating either forward or reverse as the
//!        direction of travel). When the speed is zero, the last travel direction is indicated until a different
//!        direction is detected.
//!        Forward and reverse refer to the normal directions of travel of the tractor or implement chassis. The
//!        direction does not change when the operator's perspective is changed (i.e. when operator station is
//!        reversed).
//!
//! @param[in]    eGroundBasedDirection          value of Ground Based Direction
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetGroundBsdDirection(EMachineDirection eGroundBasedDirection);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the engine torque mode (state signal which indicates which engine torque mode
//!        is currently generating, limiting, or controlling the torque)
//!
//! @param[in]    eEngineTorqueMode              value of Engine Torque Mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetEngineTorqueMode(EEngineTorqueMode eEngineTorqueMode);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the driver's demand engine - percent torque (the requested torque output of the engine
//!        by the driver. It is based on input from the following requestors external to the
//!        powertrain: operator (via the accelerator pedal), cruise control and/or road speed limit governor.
//!        Dynamic commands from internal powertrain functions such as smoke control, low- and high-speed engine
//!        governing; ASR and shift control are excluded from this calculation. The data is transmitted in indicated
//!        torque as a percent of the reference engine torque.)
//!
//! @param[in]    u8DriversDemandEngine          value of Driver's Demand Engine - Percent Torque
//!                                              Resolution: 1 %/bit, -125 % offset
//!                                              Data Range: -125 to 125 %
//!                                              Operational Range: 0 to 125%
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetDriversDemandEngine(TUint8 u8DriversDemandEngine);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the actual engine - percent torque (the calculated output torque of the engine.
//!        The data is transmitted in indicated torque as a percent of reference engine torque)
//!
//! @param[in]    u8ActualEngine                 value of Actual Engine - Percent Torque
//!                                              Resolution: 1 %/bit, -125 % offset
//!                                              Data Range: -125 to 125 %
//!                                              Operational Range: 0 to 125%
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetActualEngine(TUint8 u8ActualEngine);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the engine speed (actual engine speed which is calculated over a minimum crankshaft
//!        angle of 720 degrees divided by the number of cylinders.)
//!
//! @param[in]    u16EngineSpeed                 16 bits value of Engine Speed
//!                                              Resolution: 0.125 rpm/bit, 0 offset
//!                                              Data Range: 0 to 8,031.875 rpm
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetEngineSpeed(TUint16 u16EngineSpeed);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the source address of controlling device for engine control.
//!
//! @param[in]    u8SourceAddressControlDevice   value of Source Address of Controlling Device for Engine Control
//!                                              Resolution: 1 source address/bit, 0 offset
//!                                              Data Range: 0 to 255
//!                                              Operational Range: 0 to 253
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetSourceAddressControlDevice(TUint8 u8SourceAddressControlDevice);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the engine starter mode (there are several phases in a starting action and different
//!        reasons why a start cannot take place)
//!
//! @param[in]    eEngineStarterMode             value of Engine Starter Mode
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetEngineStarterMode(EEngineStarterMode eEngineStarterMode);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the engine demand – percent torque (the requested torque output of the engine by all
//!        dynamic internal inputs, including smoke control, noise control and low and high speed governing.)
//!
//! @param[in]    u8EngineDemand                 value of Engine Demand – Percent Torque
//!                                              Resolution: 1 %/bit, -125 % offset
//!                                              Data Range: -125 to 125 %
//!                                              Operational Range: -125% to +125%
//!
//! Static variables affected:\n
//!  -[in]     \b m_atTecuSrvData                TECU server data table
//!
//! @date         21.06.2019
//----------------------------------------------------------------------------------------------------------------------

TVoid vIsoStackTecuSrvSetEngineDemand(TUint8 u8EngineDemand);

#endif
