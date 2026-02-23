//**********************************************************************************************************************
//! @file        IsoStackNw_types.h
//! @brief       API for accessing network functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        02.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_NW_TYPES_H
#define ISOAGLIBS_ISO_STACK_NW_TYPES_H

// INCLUDES=============================================================================================================

#include <HalTypedef.h>

// GLOBAL DEFINES=======================================================================================================

#define NO_OF_BYTES_NAME 8U

// GLOBAL TYPE DEFINITIONS==============================================================================================

typedef enum
{
    E_LOCAL_CF_1,
    E_LOCAL_CF_2,
    E_LOCAL_CF_3,
    E_LOCAL_CF_4
} ELocalCf;

typedef struct
{
    TUint8 au8Value[NO_OF_BYTES_NAME]; // Byte at position 0 is the least significant byte (Little-Endian).
} TName;

typedef struct
{
    TName tName;
    TBoolean boSpecified; // shows if "name" is specified or not
} TNameOption;

typedef struct
{
    TUint8 u8InitialAddress;
} TLocalCfStorage;

typedef enum
{
    E_LOCAL_CF_ACTIVITY_GOT_ACTIVE,
    E_LOCAL_CF_ACTIVITY_GOT_INACTIVE
} ELocalCfActivity;

//! This function is called when a local control function gets active or inactive.
typedef TVoid(*TLocalCfCallback)(ELocalCf eModifiedLocalCf, ELocalCfActivity eNewActivityState);

//! Enum for return values of eIsoStackNwGetName()
typedef enum
{
    E_GET_NAME_RESULT_SUCCESSFUL,                     //!< getting of NAME was successful
    E_GET_NAME_RESULT_STACK_STATE_NOT_RUNNING,        //!< the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
    E_GET_NAME_RESULT_REMOTE_CF_INDEX_TOO_HIGH,       //!< "u8RemoteCfIndex" was greater than or equal to the size of
                                                      //!< the remote control function table (254)
    E_GET_NAME_RESULT_ENTRY_OF_REMOTE_CF_TABLE_EMPTY, //!< the entry with index "u8RemoteCfIndex" in the intern remote
                                                      //!< control function table of ISOAgLib SE was empty
    E_GET_NAME_RESULT_NAME_POINTER_NULL               //!< "ptName" (pointer to NAME) was NULL
} EGetNameResult;

typedef enum
{
    E_REMOTE_CF_MOD_TYPE_CF_INSERTED,
    E_REMOTE_CF_MOD_TYPE_CF_REMOVED,
    E_REMOTE_CF_MOD_TYPE_ADDRESS_CHANGED,  //!< old addr is not 0xFE, new addr is not 0xFE
    E_REMOTE_CF_MOD_TYPE_ADDRESS_LOST,     //!< old addr is not 0xFE, new addr is     0xFE
    E_REMOTE_CF_MOD_TYPE_ADDRESS_RECLAIMED //!< old addr is     0xFE, new addr is not 0xFE
} ERemoteCfModificationType;

//! This typedef is for a callback that can be used to get informed when there is a change regarding the activity of a
//! remote control function.
typedef TVoid(*TRemoteCfModificationCallback)(
    TUint8 u8RemoteCfIndex,
    ERemoteCfModificationType eRemoteCfModificationType);

#endif
