//**********************************************************************************************************************
//! @file        IsoStackGnss.h
//! @brief       API for accessing vehicle navigation (messages are defined in NMEA2000)
//! @author      Markus Schiffmann (MSCI)
//! @date        21.02.2022
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_GNSS_H
#define ISOAGLIBS_ISO_STACK_GNSS_H

// INCLUDES=============================================================================================================

// "ISOAGLIBSE_API" can be set to "__declspec(dllexport)" to build the Windows DLL version of ISOAgLib SE and to
// "__declspec(dllimport)" to use the Windows DLL version of ISOAgLib SE (this setting can be done e.g. in file
// "HalTypedef.h" or in project configuration).
#ifndef ISOAGLIBSE_API
#define ISOAGLIBSE_API
#endif

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION DECLARATIONS=========================================================================================

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the speed over ground (SOG). The factory default for periodic transmission rate is
//!        four times per second.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                      speed over ground (unit: 0.01 m/s, range: 0 to 655,32 m/s)
//!                              If this data is not available (i.e. ISOAgLib SE has not received this data within the
//!                              last second), value 0xFFFF is returned here.
//!
//! Static variables affected:\n
//!  -[in]    \b m_atGnssData    GNSS data table
//!
//! @date     21.02.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackGnssGetSpeedOverGround(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the course over ground (COG). The factory default for periodic transmission rate is
//!        four times per second.
//!        If the state of the stack is not "E_ISO_STACK_STATE_RUNNING"
//!        "vSafetyNotification(E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED)" is called.
//!
//! @return                      course over ground (unit: 0.0001 rad, range: 0 to 2Pi rad)
//!                              If this data is not available (i.e. ISOAgLib SE has not received this data within the
//!                              last second), value 0xFFFF is returned here.
//!
//! Static variables affected:\n
//!  -[in]    \b m_atGnssData    GNSS data table
//!
//! @date     21.02.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackGnssGetCourseOverGround(TVoid);

#endif
