//**********************************************************************************************************************
//! @file        IsoStackUds_types.h
//! @brief       API for sending and receiving of UDS messages
//! @author      Markus Schiffmann (MSCI)
//! @date        11.10.2022
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_UDS_TYPES_H
#define ISOAGLIBS_ISO_STACK_UDS_TYPES_H

// INCLUDES=============================================================================================================

#include <IsoStackCore_types.h>
#include <IsoStackNw_types.h>

// GLOBAL DEFINES=======================================================================================================

// GLOBAL TYPE DEFINITIONS==============================================================================================

//! Enum for return values of UDS messages sending functions
typedef enum
{
    E_UDS_SEND_RESULT_SUCCESSFUL,                     //!< triggering of sending was successful
    E_UDS_SEND_RESULT_STACK_STATE_NOT_RUNNING,        //!< the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
    E_UDS_SEND_RESULT_LOCAL_CF_NOT_AVAILABLE,         //!< "eLocalCf" was not available (only the number of local
                                                      //!< control functions "NUM_LOCAL_CF" that are defined in
                                                      //!< AppConfig.h can be used)
    E_UDS_SEND_RESULT_LOCAL_CF_CANNOT_COMMUNICATE,    //!< the local control function is not ready to communicate
    E_UDS_SEND_RESULT_REMOTE_CF_INDEX_TOO_HIGH,       //!< "u8RemoteCfIndex" was greater than or equal to the size of
                                                      //!< the remote control function table (254)
    E_UDS_SEND_RESULT_ENTRY_OF_REMOTE_CF_TABLE_EMPTY, //!< the entry with index "u8RemoteCfIndex" in the intern remote
                                                      //!< control function table of ISOAgLib SE was empty
    E_UDS_SEND_RESULT_REMOTE_CF_CANNOT_COMMUNICATE,   //!< the remote control function cannot communicate, i.e. it has
                                                      //!< lost its address
    E_UDS_SEND_RESULT_BUFFER_POINTER_NULL,            //!< "cptCU8Buffer" (pointer to buffer structure) was NULL
    E_UDS_SEND_RESULT_DATA_POINTER_NULL,              //!< "cptCU8Buffer->cpu8Data" (pointer to buffer data) was NULL
    E_UDS_SEND_RESULT_DATA_SIZE_TOO_LARGE             //!< "cptCU8Buffer->u32Size" was greater than or equal to 9 (too
                                                      //!< large for single packet and only single packet supported)
} EUdsSendResult;

//! This structure contains callbacks the application can use to receive UDS messages.
typedef struct
{
    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a UDS message is received that has been sent destination-specific, i.e. with
    //!        physical addressing PGN 0x00DA00 (55808).
    //!
    //! @param[in]    u8RemoteCfIndex    index of remote control function (sender of message) in intern remote control
    //!                                  function table of ISOAgLib SE
    //! @param[in]    eLocalCf           local control function (receiver of message)
    //! @param[in]    cptCU8Buffer       message data
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvUdsRx)(TUint8 u8RemoteCfIndex, ELocalCf eLocalCf, const TCU8Buffer* cptCU8Buffer);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a UDS message is received that has been sent broadcast, i.e. with
    //!        functional addressing PGN 0x00DB00 (56064).
    //!
    //! @param[in]    u8RemoteCfIndex    index of remote control function (sender of message) in intern remote control
    //!                                  function table of ISOAgLib SE
    //! @param[in]    cptCU8Buffer       message data
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvUdsRxBroadcast)(TUint8 u8RemoteCfIndex, const TCU8Buffer* cptCU8Buffer);
} TUdsCallbacks;

#endif
