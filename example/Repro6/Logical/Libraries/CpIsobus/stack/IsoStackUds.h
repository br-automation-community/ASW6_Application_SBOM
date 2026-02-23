//**********************************************************************************************************************
//! @file        IsoStackUds.h
//! @brief       API for sending and receiving of UDS messages
//! @author      Markus Schiffmann (MSCI)
//! @date        11.10.2022
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_UDS_H
#define ISOAGLIBS_ISO_STACK_UDS_H

// INCLUDES=============================================================================================================

#include "IsoStackUds_types.h"

// "ISOAGLIBSE_API" can be set to "__declspec(dllexport)" to build the Windows DLL version of ISOAgLib SE and to
// "__declspec(dllimport)" to use the Windows DLL version of ISOAgLib SE (this setting can be done e.g. in file
// "HalTypedef.h" or in project configuration).
#ifndef ISOAGLIBSE_API
#define ISOAGLIBSE_API
#endif

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION DECLARATIONS=========================================================================================

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the callbacks that are called when UDS messages are received.
//!
//! @param[in]    tUdsRxCallback    pointer to structure with callbacks that are called when UDS messages are received
//!                                 (this pointer must not be NULL but the pointers to the individual callbacks can be
//!                                 NULL, this can also be done for resetting/deactivation)
//!
//! @retval       TRUE              operation was successful
//! @retval       FALSE             operation was not successful because "tUdsRxCallback" was NULL
//!
//! @date         14.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackUdsActivateRx(const TUdsCallbacks* cptUdsCallbacks);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the destination-specific sending of a UDS message, i.e. with physical addressing PGN
//!        0x00DA00 (55808).
//!        Use function vIsoStackNwActivateRemoteCfMonitoring() to set a callback that is called when a remote control
//!        function changes its status.
//!
//! @param[in]    eLocalCf           local control function (sender of message)
//! @param[in]    u8RemoteCfIndex    index of remote control function (receiver of message) in intern remote control
//!                                  function table of ISOAgLib SE
//! @param[in]    cptCU8Buffer       message data (this pointer and also member "cpu8Data" must not be NULL)
//!
//! @return                          result of triggering of sending (see definition of "EUdsSendResult")
//!
//! @date         14.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EUdsSendResult eIsoStackUdsSendMsg(
    ELocalCf eLocalCf,
    TUint8 u8RemoteCfIndex,
    const TCU8Buffer* cptCU8Buffer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the broadcast sending of a UDS message, i.e. with functional addressing PGN
//!        0x00DB00 (56064).
//!        Use function vIsoStackNwActivateRemoteCfMonitoring() to set a callback that is called when a remote control
//!        function changes its status.
//!
//! @param[in]    eLocalCf        local control function (sender of message)
//! @param[in]    cptCU8Buffer    message data (this pointer and also member "cpu8Data" must not be NULL)
//!
//! @return                       result of triggering of sending (see definition of "EUdsSendResult")
//!
//! @date         14.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EUdsSendResult eIsoStackUdsSendMsgBroadcast(ELocalCf eLocalCf, const TCU8Buffer* cptCU8Buffer);

#endif
