//**********************************************************************************************************************
//! @file        IsoStackProp_types.h
//! @brief       API for sending and receiving of Proprietary A, A2, B and B - Page 1 messages (only single packet
//!              supported)
//! @author      Markus Schiffmann (MSCI)
//! @date        05.11.2022
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_PROP_TYPES_H
#define ISOAGLIBS_ISO_STACK_PROP_TYPES_H

// INCLUDES=============================================================================================================

#include <IsoStackCore_types.h>
#include <IsoStackNw_types.h>

// GLOBAL DEFINES=======================================================================================================

// GLOBAL TYPE DEFINITIONS==============================================================================================

//! Enum for return values of Proprietary messages sending functions
typedef enum
{
    E_PROP_SEND_RESULT_SUCCESSFUL,                     //!< triggering of sending was successful
    E_PROP_SEND_RESULT_STACK_STATE_NOT_RUNNING,        //!< the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
    E_PROP_SEND_RESULT_DATA_PAGE_OUT_OF_RANGE,         //!< "eDataPage" was not in the range of enum "EDataPage"
    E_PROP_SEND_RESULT_LOCAL_CF_NOT_AVAILABLE,         //!< "eLocalCf" was not available (only the number of local
                                                       //!< control functions "NUM_LOCAL_CF" that are defined in
                                                       //!< AppConfig.h can be used)
    E_PROP_SEND_RESULT_LOCAL_CF_CANNOT_COMMUNICATE,    //!< the local control function is not ready to communicate
    E_PROP_SEND_RESULT_REMOTE_CF_INDEX_TOO_HIGH,       //!< "u8RemoteCfIndex" was greater than or equal to the size of
                                                       //!< the remote control function table (254)
    E_PROP_SEND_RESULT_ENTRY_OF_REMOTE_CF_TABLE_EMPTY, //!< the entry with index "u8RemoteCfIndex" in the intern remote
                                                       //!< control function table of ISOAgLib SE was empty
    E_PROP_SEND_RESULT_REMOTE_CF_CANNOT_COMMUNICATE,   //!< the remote control function cannot communicate, i.e. it has
                                                       //!< lost its address
    E_PROP_SEND_RESULT_BUFFER_POINTER_NULL,            //!< "cptCU8Buffer" (pointer to buffer structure) was NULL
    E_PROP_SEND_RESULT_DATA_POINTER_NULL,              //!< "cptCU8Buffer->cpu8Data" (pointer to buffer data) was NULL
    E_PROP_SEND_RESULT_DATA_SIZE_TOO_LARGE             //!< "cptCU8Buffer->u32Size" was greater than or equal to 9 (too
                                                       //!< large for single packet and only single packet supported)
} EPropSendResult;

//! Enum for data page of PGNs
typedef enum
{
    E_DATA_PAGE_0, //!< e.g. "Proprietary A"  or "Proprietary B"
    E_DATA_PAGE_1, //!< e.g. "Proprietary A2" or "Proprietary B - Page 1"
    E_DATA_PAGE_LAST = E_DATA_PAGE_1
} EDataPage;

//! This structure contains callbacks the application can use to receive Proprietary messages.
typedef struct
{
    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a "Proprietary A" or "Proprietary A2" message is received that has been sent
    //!        destination-specific (only single-packet supported).
    //!
    //! @param[in]    eDataPage          E_DATA_PAGE_0 means "Proprietary A" and E_DATA_PAGE_1 means "Proprietary A2"
    //! @param[in]    u8RemoteCfIndex    index of remote control function (sender of message) in intern remote control
    //!                                  function table of ISOAgLib SE
    //! @param[in]    eLocalCf           local control function (receiver of message)
    //! @param[in]    cptCU8Buffer       message data
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvPropARx)(EDataPage eDataPage, TUint8 u8RemoteCfIndex, ELocalCf eLocalCf, const TCU8Buffer* cptCU8Buffer);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a "Proprietary A" or "Proprietary A2" message is received that has been sent
    //!        broadcast (only single-packet supported).
    //!
    //! @param[in]    eDataPage          E_DATA_PAGE_0 means "Proprietary A" and E_DATA_PAGE_1 means "Proprietary A2"
    //! @param[in]    u8RemoteCfIndex    index of remote control function (sender of message) in intern remote control
    //!                                  function table of ISOAgLib SE
    //! @param[in]    cptCU8Buffer       message data
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvPropARxBroadcast)(EDataPage eDataPage, TUint8 u8RemoteCfIndex, const TCU8Buffer* cptCU8Buffer);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a "Proprietary B" or "Proprietary B - Page 1" message is received (only
    //!        single-packet supported). "Proprietary B" or "Proprietary B - Page 1" messages are always sent broadcast.
    //!
    //! @param[in]    eDataPage          E_DATA_PAGE_0 means "Proprietary B" and
    //!                                  E_DATA_PAGE_1 means "Proprietary B - Page 1"
    //! @param[in]    u8PropBIndex       Proprietary B index (0 - 255)
    //!                                  The "Proprietary B" PGNs are in the range from 0xFF00 to 0xFFFF and the
    //!                                  "Proprietary B - Page 1" PGNs are in the range from 0x1FF00 to 0x1FFFF.
    //!                                  Parameter "u8PropBIndex" tells you which PGN was used. If "u8PropBIndex" is 0
    //!                                  PGN 0xFF00/0x1FF00 was used and so on.
    //! @param[in]    u8RemoteCfIndex    index of remote control function (sender of message) in intern remote control
    //!                                  function table of ISOAgLib SE
    //! @param[in]    cptCU8Buffer       message data
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvPropBRxBroadcast)(
        EDataPage eDataPage,
        TUint8 u8PropBIndex,
        TUint8 u8RemoteCfIndex,
        const TCU8Buffer* cptCU8Buffer);
} TPropCallbacks;

#endif
