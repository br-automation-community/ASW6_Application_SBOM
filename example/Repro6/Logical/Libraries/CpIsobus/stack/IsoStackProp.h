//**********************************************************************************************************************
//! @file        IsoStackProp.h
//! @brief       API for sending and receiving of Proprietary A, A2, B and B - Page 1 messages (only single packet
//!              supported)
//! @author      Markus Schiffmann (MSCI)
//! @date        05.11.2022
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_PROP_H
#define ISOAGLIBS_ISO_STACK_PROP_H

// INCLUDES=============================================================================================================

#include "IsoStackProp_types.h"

// "ISOAGLIBSE_API" can be set to "__declspec(dllexport)" to build the Windows DLL version of ISOAgLib SE and to
// "__declspec(dllimport)" to use the Windows DLL version of ISOAgLib SE (this setting can be done e.g. in file
// "HalTypedef.h" or in project configuration).
#ifndef ISOAGLIBSE_API
#define ISOAGLIBSE_API
#endif

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION DECLARATIONS=========================================================================================

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the callbacks that are called when Proprietary A, A2, B or B - Page 1 messages are
//!        received.
//!
//! @param[in]    cptPropCallbacks    pointer to structure with callbacks that are called when Proprietary A, A2, B or
//!                                   B - Page 1 messages are received (this pointer must not be NULL but the pointers
//!                                   to the individual callbacks can be NULL, this can also be done for
//!                                   resetting/deactivation)
//!
//! @retval       TRUE                operation was successful
//! @retval       FALSE               operation was not successful because "cptPropCallbacks" was NULL
//!
//! @date         14.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackPropActivateRx(const TPropCallbacks* cptPropCallbacks);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the destination-specific sending of a "Proprietary A" or "Proprietary A2" message
//!        (only single-packet supported). Use function vIsoStackNwActivateRemoteCfMonitoring() to set a callback that
//!        is called when a remote control function changes its status.
//!
//! @param[in]    eLocalCf           local control function (sender of message)
//! @param[in]    eDataPage          E_DATA_PAGE_0 means "Proprietary A" and E_DATA_PAGE_1 means "Proprietary A2"
//! @param[in]    u8RemoteCfIndex    index of remote control function (receiver of message) in intern remote control
//!                                  function table of ISOAgLib SE
//! @param[in]    cptCU8Buffer       message data (this pointer and also member "cpu8Data" must not be NULL)
//!
//! @return                          result of triggering of sending (see definition of "EPropSendResult")
//!
//! @date         05.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EPropSendResult eIsoStackPropSendPropAMsg(
    ELocalCf eLocalCf,
    EDataPage eDataPage,
    TUint8 u8RemoteCfIndex,
    const TCU8Buffer* cptCU8Buffer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the broadcast sending of a "Proprietary A" or "Proprietary A2" message (only
//!        single-packet supported). Use function vIsoStackNwActivateRemoteCfMonitoring() to set a callback that
//!        is called when a remote control function changes its status.
//!
//! @param[in]    eLocalCf        local control function (sender of message)
//! @param[in]    eDataPage       E_DATA_PAGE_0 means "Proprietary A" and E_DATA_PAGE_1 means "Proprietary A2"
//! @param[in]    cptCU8Buffer    message data (this pointer and also member "cpu8Data" must not be NULL)
//!
//! @return                       result of triggering of sending (see definition of "EPropSendResult")
//!
//! @date         05.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EPropSendResult eIsoStackPropSendPropAMsgBroadcast(
    ELocalCf eLocalCf,
    EDataPage eDataPage,
    const TCU8Buffer* cptCU8Buffer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a "Proprietary B" or "Proprietary B - Page 1" message (only
//!        single-packet supported). "Proprietary B" or "Proprietary B - Page 1" messages are always sent broadcast. Use
//!        function vIsoStackNwActivateRemoteCfMonitoring() to set a callback that is called when a remote control
//!        function changes its status.
//!
//! @param[in]    eLocalCf        local control function (sender of message)
//! @param[in]    eDataPage       E_DATA_PAGE_0 means "Proprietary B" and E_DATA_PAGE_1 means "Proprietary B - Page 1"
//! @param[in]    u8PropBIndex    Proprietary B index (0 - 255)
//!                               The "Proprietary B" PGNs are in the range from 0xFF00 to 0xFFFF and the
//!                               "Proprietary B - Page 1" PGNs are in the range from 0x1FF00 to 0x1FFFF.
//!                               Parameter "u8PropBIndex" defines the PGN that shall be used. If "u8PropBIndex" is 0
//!                               PGN 0xFF00/0x1FF00 will be used and so on.
//! @param[in]    cptCU8Buffer    message data (this pointer and also member "cpu8Data" must not be NULL)
//!
//! @return                       result of triggering of sending (see definition of "EPropSendResult")
//!
//! @date         05.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EPropSendResult eIsoStackPropSendPropBMsgBroadcast(
    ELocalCf eLocalCf,
    EDataPage eDataPage,
    TUint8 u8PropBIndex,
    const TCU8Buffer* cptCU8Buffer);

#endif
