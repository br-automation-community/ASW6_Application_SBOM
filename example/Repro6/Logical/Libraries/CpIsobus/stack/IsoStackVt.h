//**********************************************************************************************************************
//! @file        IsoStackVt.h
//! @brief       API for accessing virtual terminal functionality
//!
//!
//! Connection Mechanism
//! ====================
//!
//! During initialization
//! ---------------------
//!
//! During initialization of ISOAgLib SE (between the calls of function boIsoStackCoreInit() and
//! boIsoStackCoreInitDone()) function boIsoStackVtActivateClient() has to be called to activate a VT client. This
//! function has the VT client object pool, the VT client storage (with the preferred VT and its boot time) and the VT
//! client callbacks as parameters. If there are no AUX objects in the pool, we don't need the pool here but only later
//! during run-time when the capabilities of the VT are known (as described below). If AUX-O or AUX-N objects are used,
//! an Object Pool with (at least) these objects will need to be provided when activating the VT client. It is
//! sufficient to only provide the AUX-O or AUX-N objects here. The application needs to make sure that the same
//! Auxiliary objects are also existent in the Object Pool provided during run-time.
//!
//! Background: The stack parses the Object Pool's IOP parts to find all the AUX-O / AUX-N objects for internal
//!             management. As this operation may take some time (which is unpredictable because of the unknown size and
//!             amount of objects in the IOP parts), this must be done during initialization phase.
//!
//!
//! On Power-Up
//! -----------
//!
//! In case a preferred VT is given (see VT Storage when activating the VT module), the stack will wait until the
//! preferred VT is online on the ISOBUS and connect to it, or it will connect to the "next-best" VT found after the
//! time-out period has expired (see VT Storage when activating the VT module). The application can decide if it (what
//! is typically done) retrieves the VT Storage from non-volatile or if it just provides some empty/hard-coded VT
//! Storage information (not recommended).
//!
//!
//! On Shut-Down
//! ------------
//!
//! The last connected VT and its boot-up time (in seconds) is being provided via the VT Storage class, so the
//! application can store it. It can then be used at the next power-cycle.
//! The application can decide if it (what is typically done) stores the VT Storage information to non-volatile or if it
//! skips storing, just as if there would be a power-interruption (not recommended).
//!
//!
//! Connecting to a VT
//! ------------------
//!
//! The application is informed that the stack wants to connect to a VT via the callback
//! "ConnectionRequest( capabilities, reason )". Here the capabilites of the VT (colours, number of SKs, resolution,
//! version, etc.) are passed on to the application, so it can decide what to do. At the first connection try, the
//! "reason" is "FirstContact", meaning there have not been any previous connection tries (that failed). The application
//! can now decide if it wants to connect to this VT (calling boIsoStackVtDoConnect()) or if it does not want to connect
//! (calling boIsoStackVtDontConnect()). In the latter case other possibly on-line VTs will be checked for a possible
//! connection attempt. If the "reason" of the connection request is that the VT server doesn't have enough memory for
//! that object pool, then the application can call boIsoStackVtDoConnect() again but this time with a smaller
//! "fall-back" object pool as parameter which ideally has a "move-to-next-VT" functionality.
//!
//! When connecting, the application needs to provide the to be used Object Pool to the stack. This can either be one
//! "generic" Object Pool that will work for all VT Versions, Dimensions, Numbers of SKs, etc., or one out of a few
//! different Object Pools. It can be constructed during run-time by combining different Object Pool parts.
//!
//! An Object Pool consists of the following structure "TVtClientObjectPool", which includes:
//! - Dimension of this Object Pool for Data Mask and Soft Keys
//! - Version Label - if specified, the stack will use it to store the Object Pool to the VT once the upload was
//!   successfully finished and to load the Object Pool from the VT instead of uploading it via the ISOBUS if the pool
//!   has already been stored
//! - A flag that indicates if the pool shall only be uploaded to a primary VT (needed for AUX)
//! - A List of Object Pool parts. One part consists of
//! -- Pointer to this IOP part and size of it
//! -- Offset that describes the border between Data Mask and Soft Key Mask Objects in this IOP part
//! -- Size of Graphics Context Object (not needed for now, can be set to 0)
//! -- VT Version
//! -- Language Code (or special code "**" if this part is independent of a language)
//!
//! The stack will walk through all parts of the Object Pool and for each part decide if it will
//! - upload this part, if the VT Version of this part is less than or equal to the Version of the connected VT and the
//!   language matches the configured language of the VT (or it is "**")
//! or
//! - skip this part and not upload it.
//!
//! This way the stack makes sure to only upload IOP parts that match the VT's version / language. All other parts will
//! be omitted from upload, so the application does not need to care to upfront sort out the non-matching language or
//! higher-versioned parts.
//!
//! The stack will always scale from the Object Pool's dimension to the VT's dimension. It uses one scaling for the
//! Objects in the "Data Mask" half (all objects before the Scaling-Offset) of the IOP part, and a different one for the
//! Objects in the "Soft Key Mask" half (all objects after the Scaling-Offset) of the IOP part.
//!
//! In case objects in the Data Mask area (also in Alarm Masks) and Soft Key area (also in Working Set Designator and in
//! Auxiliary Inputs / Functions) should be moved (for typically centering them when disabling scaling), two separate
//! sets of x / y offsets can be supplied as parameter of function boIsoStackVtDoConnect().
//!
//! Example: One part can be Version 2, containing AUX-O objects. This part will always be uploaded on VTs with Version
//!          2,3,4,5,6,...
//!          Another part can contain only the AUX-N objects, marked as Version 3. This part will only be uploaded on
//!          VTs with Version 3,4,5,6,... but would be skipped on a Version 2 VT!
//!
//! Example: If a version 4 Colour Map object is being used, it needs to be put into a separate Version 4 part. So if
//!          the VT supports Colour Map objects (Version 4+), this part will automatically be uploaded, on Version 2 or
//!          3 VTs this part would be skipped. This avoids the VT rejecting the complete Object Pool due to unknown/not
//!          supported objects.
//!
//! Example: The application has a Lo-Res (200x200) and a Hi-Res (400x400) Object Pool, i.e. two complete
//!          "TVtClientObjectPool" structures. It can now decide when the connection request is coming in based on the
//!          VT's dimension which of the two it supplies to the stack to be used for uploading. If the VT reports
//!          280x280, the 200x200 Object Pool can be chosen and supplied to the stack. It would then be scaled from
//!          200x200 to 280x280. If the application does not want scaling, it can simply override the Object Pool's
//!          dimension from 200 to 280, causing the stack to "scale" from 280x280 to 280x280, effectively not doing any
//!          scaling at all.
//!
//!
//! During Run-Time, when connected to a VT
//! ---------------------------------------
//!
//! In case another VT is detected on the ISOBUS, the callback  <multipleVTs(bool)> is called with "true", indicating
//! the multi-VT scenario. The application should provide some means on the user-interface now to switch to the next VT.
//! This can typically be showing some Button or Soft Key. When this means is activated, the application simply has to
//! call eIsoStackVtMoveToNextVt(). The stack will properly disconnect from the currently connected VT and connect to
//! the next VT.
//!
//! In case the other VTs on the ISOBUS are detected to have dropped off-line the callback <multipleVTs(bool)> is again
//! called, this time with "false", indicating that the application should remove the next-VT-means from the
//! user-interface.
//!
//! This is an example of an Object Pool:
//! <pre>
//! static const TVtClientCondPoolPart m_catVtClientCondPoolParts[] = {
//!     { ISO_POOL_VERSION, LANGUAGE_CODE_ALL_LANGUAGES, { isoOP_ObjPool,    ISO_OP_ObjPool_Size,    0, ISO_OP_ObjPool_Scale_Offset } },    // non specific pool part
//!     { ISO_POOL_VERSION, 0x656EU,                     { isoOP_ObjPool_en, ISO_OP_ObjPool_Size_en, 0, ISO_OP_ObjPool_Scale_Offset_en } }, // english pool-part
//!     { ISO_POOL_VERSION, 0x6465U,                     { isoOP_ObjPool_de, ISO_OP_ObjPool_Size_de, 0, ISO_OP_ObjPool_Scale_Offset_de } }, // german pool-part
//!     { ISO_POOL_VERSION, 0x6672U,                     { isoOP_ObjPool_fr, ISO_OP_ObjPool_Size_fr, 0, ISO_OP_ObjPool_Scale_Offset_fr } }, // french pool-part
//!     { 0, 0, { NULL, 0, 0, 0 } } };                                                                                                      // item that determines end of array
//!
//! const TVtClientObjectPool g_ctVtClientObjectPool = {
//!     ISO_VERSION_LABEL,                // Version-Label
//!     E_REG_POOL_MODE_MASTER_TO_ANY_VT, // boolean flag, describes to connect only with a primary VT or with anyone
//!     ISO_MASK_SIZE,                    // data mask size from pool
//!     ISO_DESIGNATOR_WIDTH,             // Soft-Key-width from pool
//!     ISO_DESIGNATOR_HEIGHT,            // Soft-Key-height from pool
//!     m_catVtClientCondPoolParts };     // Pool-Parts
//! </pre>
//!
//!
//! @author      Markus Schiffmann (MSCI)
//! @date        01.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_VT_H
#define ISOAGLIBS_ISO_STACK_VT_H

// INCLUDES=============================================================================================================

#include "IsoStackVt_types.h"
#include "IsoStackCore_types.h"

// "ISOAGLIBSE_API" can be set to "__declspec(dllexport)" to build the Windows DLL version of ISOAgLib SE and to
// "__declspec(dllimport)" to use the Windows DLL version of ISOAgLib SE (this setting can be done e.g. in file
// "HalTypedef.h" or in project configuration).
#ifndef ISOAGLIBSE_API
#define ISOAGLIBSE_API
#endif

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION DECLARATIONS=========================================================================================

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the buffer size in byte that is needed for the number of elements given by parameter
//!        "u8MaxNoOfAuxFunctions".
//!
//! @param[in]    u8MaxNoOfAuxFunctions    number of elements (maximal 255)
//!
//! @return                                buffer size in byte that is needed for the number of elements given by
//!                                        parameter "u8MaxNoOfAuxFunctions" or 0 if value of parameter
//!                                        "u8MaxNoOfAuxFunctions" was greater than 255
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackVtGetAux2FunctionsConfigMemoryBufferSizeInByte(TUint8 u8MaxNoOfAuxFunctions);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the buffer size in byte that is needed for the number of elements given by parameter
//!        "u8MaxNoOfAuxInputs".
//!
//! @param[in]    u8MaxNoOfAuxInputs    number of elements (maximal 255)
//!
//! @return                             buffer size in byte that is needed for the number of elements given by parameter
//!                                     "u8MaxNoOfAuxInputs" or 0 if value of parameter "u8MaxNoOfAuxInputs" was greater
//!                                     than 255
//!
//! @date         19.06.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackVtGetAux2InputsConfigMemoryBufferSizeInByte(TUint8 u8MaxNoOfAuxInputs);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the buffer size in byte that is needed for the number of elements given by parameter
//!        "u8MaxNoOfAux1Inputs".
//!
//! @param[in]    u8MaxNoOfAux1Inputs   number of elements (maximal 251)
//!
//! @return                             buffer size in byte that is needed for the number of elements given by parameter
//!                                     "u8MaxNoOfAux1Inputs" or 0 if value of parameter "u8MaxNoOfAux1Inputs" was greater
//!                                     than 250
//!
//! @date         22.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackVtGetAux1InputsConfigMemoryBufferSizeInByte(TUint8 u8MaxNoOfAux1Inputs);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function configures the VT command buffer. If you want to use your own buffer here, you have to call
//!        this function. Otherwise the ISOAgLib SE will use its own default buffer. Call this function only in state
//!        "E_ISO_STACK_STATE_CLOSED". The buffer size has to be a power of 2 and maximal 32768. If you used an own
//!        buffer here and want to change to the default buffer after a restart of ISOAgLib SE, you have to explicitely
//!        "set the buffer to zero" (size has to be 0 and buffer pointer has to be NULL).
//!
//! @param[in]    eLocalCf            local control function
//! @param[in]    cptMemoryBuffer     memory buffer; this pointer is not stored by ISOAgLib SE but the pointer to the
//!                                   buffer itself ("cptMemoryBuffer->pvBuffer")
//!
//! @return                           result of configuring (see definition of "EMemConfigResult")
//!
//! Static variables affected:\n
//!  -[out]       \b m_atVtCmdHdls    array with a "VT command handler" for each local control function
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EMemConfigResult eIsoStackVtConfigCmdBuffer(ELocalCf eLocalCf, const TMemoryBuffer* cptMemoryBuffer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function configures the buffer for the auxiliary functions (type 2, "AUX-N"). If you want to use your
//!        own buffer here, you have to call this function. Otherwise the ISOAgLib SE will use its own default buffer.
//!        Call this function only in state "E_ISO_STACK_STATE_CLOSED". Use function
//!        "u32IsoStackVtGetAux2FunctionsConfigMemoryBufferSizeInByte()" to determine the buffer size that you need.
//!        Only use those return values as buffer size. If you used an own buffer here and want to change to the default
//!        buffer after a restart of ISOAgLib SE, you have to explicitely "set the buffer to zero" (size has to be 0 and
//!        buffer pointer has to be NULL).
//!
//! @param[in]    eLocalCf                       local control function
//! @param[in]    cptMemoryBuffer                memory buffer; this pointer is not stored by ISOAgLib SE but the
//!                                              pointer to the buffer itself ("cptMemoryBuffer->pvBuffer")
//!
//! @return                                      result of configuring (see definition of "EMemConfigResult")
//!
//! Static variables affected:\n
//!  -[out]       \b m_au8MaxNoOfAuxFunctions    array with maximal number of AUX functions for each local control
//!                                              function\n
//!  -[out]       \b m_aptAux2FunctionTable      array with pointer to table containing all AUX functions for each local
//!                                              control function
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EMemConfigResult eIsoStackVtConfigAux2Functions(ELocalCf eLocalCf, const TMemoryBuffer* cptMemoryBuffer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function configures the buffer for the auxiliary inputs (type 2, "AUX-N"). If you want to use your own
//!        buffer here, you have to call this function. Otherwise the ISOAgLib SE will use its own default buffer. Call
//!        this function only in state "E_ISO_STACK_STATE_CLOSED". Use function
//!        "u32IsoStackVtGetAux2InputsConfigMemoryBufferSizeInByte()" to determine the buffer size that you need.
//!        Only use those return values as buffer size. If you used an own buffer here and want to change to the default
//!        buffer after a restart of ISOAgLib SE, you have to explicitely "set the buffer to zero" (size has to be 0 and
//!        buffer pointer has to be NULL).
//!
//! @param[in]    eLocalCf                   local control function
//! @param[in]    cptMemoryBuffer            memory buffer; this pointer is not stored by ISOAgLib SE but the pointer to
//!                                          the buffer itself ("cptMemoryBuffer->pvBuffer")
//!
//! @return                                  result of configuring (see definition of "EMemConfigResult")
//!
//! Static variables affected:\n
//!  -[out]       \b m_atVtAux2InputsData    array with AUX inputs data for each local control function
//!
//! @date         19.06.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EMemConfigResult eIsoStackVtConfigAux2Inputs(ELocalCf eLocalCf, const TMemoryBuffer* cptMemoryBuffer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function configures the buffer for the auxiliary inputs (type 1, "AUX-O"). If you want to use your own
//!        buffer here, you have to call this function. Otherwise the ISOAgLib SE will use its own default buffer. Call
//!        this function only in state "E_ISO_STACK_STATE_CLOSED". Use function
//!        "u32IsoStackVtGetAux1InputsConfigMemoryBufferSizeInByte()" to determine the buffer size that you need.
//!        Only use those return values as buffer size. If you used an own buffer here and want to change to the default
//!        buffer after a restart of ISOAgLib SE, you have to explicitely "set the buffer to zero" (size has to be 0 and
//!        buffer pointer has to be NULL).
//!
//! @param[in]    eLocalCf                   local control function
//! @param[in]    cptMemoryBuffer            memory buffer; this pointer is not stored by ISOAgLib SE but the pointer to
//!                                          the buffer itself ("cptMemoryBuffer->pvBuffer")
//!
//! @return                                  result of configuring (see definition of "EMemConfigResult")
//!
//! Static variables affected:\n
//!  -[out]       \b m_atVtAux1InputsData    array with AUX inputs (Aux-O) data for each local control function
//!
//! @date         22.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EMemConfigResult eIsoStackVtConfigAux1Inputs(ELocalCf eLocalCf, const TMemoryBuffer* cptMemoryBuffer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function activates a VT client, more exactly diverse checks are done, the members of the "TVtConnection"
//!        for the given local control function are set to intial values, the AUX-O functions module, the AUX-N
//!        functions module, the pool upload module and the command handler are activated.
//!
//!        The version of the object pool (highest version of the pool parts) that is passed here, has to be greater
//!        than or equal to the versions of the pools that are passed to function "boIsoStackVtDoConnect()" later on
//!        (because of AUX and control function functionalities). This version is also used in the Working Set
//!        Maintenance message then.
//!
//! @pre The local control function needs to be activated using "boIsoStackNwActivateLocalCf()".
//!
//! @param[in]    eLocalCf                 local control function which is acting as VT client
//!                                        Be sure to activate it as "Working Set Master"!
//! @param[in]    cptVtClientObjectPool    structure generated by "vt-designer" containing the objects and information
//!                                        about the object pool
//! @param[in]    ptVtClientStorage        structure that needs to be retrieved from nv-memory before activating a VT
//!                                        client and written back to nv-memory after it has been deactivated (pointer
//!                                        must not be NULL)
//! @param[in]    cptVtClientCallbacks     structure with callbacks that will be called during runtime when the
//!                                        associated event occurs (this pointer and also all callbacks must not be
//!                                        NULL)
//!
//! @retval       TRUE                     activation was successful
//! @retval       FALSE                    activation was not successful because of one of the following reasons:
//!                                        - "eLocalCf" was not available (only the number of local control functions
//!                                          "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                        - the state of stack was not "E_ISO_STACK_STATE_INITIALIZING"
//!                                        - the given local control function has not been activated
//!                                        - the VT connection was not in state "E_VT_CONNECTION_STATE_INACTIVE"
//!                                        - "cptVtClientObjectPool" was NULL
//!                                        - "ptVtClientStorage" was NULL
//!                                        - "cptVtClientCallbacks" was NULL
//!                                        - the given local control function was not a working set master
//!                                        - "cptVtClientObjectPool->cpchVersionLabel"          was NULL
//!                                        - "cptVtClientObjectPool->u16DataMaskSize"           was 0
//!                                        - "cptVtClientObjectPool->u16SoftKeyWidth"           was 0
//!                                        - "cptVtClientObjectPool->u16SoftKeyHeight"          was 0
//!                                        - "cptVtClientObjectPool->catVtClientCondPoolParts"  was NULL
//!                                        - the cptVtClientObjectPool's member catVtClientCondPoolParts
//!                                          has its first entry's u8Version set to 0
//!                                        - u8Version was not 0 and lower/higher than min/max supported pool version.
//!                                          Please refer to the "Product Description" page in the User Manual.
//!                                        - there was entry in catVtClientCondPoolParts which has u8Version
//!                                          lower/higher than min/max supported pool version or higher than member
//!                                          u8Version of cptVtClientObjectPool if this member is not 0. Please refer to
//!                                          the "Product Description" page in the User Manual.
//!                                        - there was entry in catVtClientCondPoolParts which has
//!                                          tVtClientPoolPart.cpu8Data that was NULL
//!                                        - there was entry in catVtClientCondPoolParts which has
//!                                          tVtClientPoolPart.u32DataSize that is lower than
//!                                          MIN_VT_CLIENT_POOL_PART_DATA_SIZE or higher than MAX_DATA_SIZE_ETP
//!                                        - pool is multi-lingual and the last two characters of the version label
//!                                          (6th and 7th character) are not spaces
//!                                        - one of the VT client callbacks is NULL
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtConnections     array with a "TVtConnection" for each local control function
//!
//! @date         21.05.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackVtActivateClient(
    ELocalCf eLocalCf,
    const TVtClientObjectPool *cptVtClientObjectPool,
    TVtClientStorage *ptVtClientStorage,
    const TVtClientCallbacks *cptVtClientCallbacks);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function activates an AUX inputs device (joystick).
//!
//! @param[in]    eLocalCf                                       local control function which is acting as VT client
//! @param[in]    u16ModelIdentificationCodeOfAux2InputDevice    model identification code (MIC) of AUX (type 2/new)
//!                                                              input device
//! @param[in]    cptVtClientAux2InputCallbacks                  structure with callbacks that will be called during
//!                                                              runtime when the associated event occurs (this pointer
//!                                                              and also all callbacks must not be NULL)
//!
//! @return                                                      result of activation (see definition of
//!                                                              "EAuxInputsActivationResult")
//!
//! @date         26.05.2021
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputsActivationResult eIsoStackVtActivateClientAuxInputs(
    ELocalCf eLocalCf,
    TUint16 u16ModelIdentificationCodeOfAuxInputDevice,
    const TVtClientAux2InputCallbacks *cptVtClientAux2InputCallbacks);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function activates an AUX inputs device (type 1, "AUX-O").
//!
//! @param[in]    eLocalCf                                       local control function which is acting as VT client
//!
//! @return                                                      result of activation (see definition of
//!                                                              "EAuxInputsActivationResult")
//!
//! @date         22.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputsActivationResult eIsoStackVtActivateClientAux1Inputs(
    ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function deactivates a VT client, more exactly it sets the state of the "TVtConnection" for the given
//!        local control function to "E_VT_CONNECTION_STATE_INACTIVE" if the state of the stack is
//!        "E_ISO_STACK_STATE_CLOSING" and if the state of the connection is not "E_VT_CONNECTION_STATE_INACTIVE".
//!
//! @pre The local control function needs to have an activated VT client.
//!
//! @param[in]    eLocalCf                local control function which is acting as VT client
//!
//! @retval       TRUE                    deactivation was successful
//! @retval       FALSE                   deactivation was not successful because of one of the following reasons:
//!                                       - "eLocalCf" was not available (only the number of local control functions
//!                                         "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                       - the state of the stack was not "E_ISO_STACK_STATE_CLOSING"
//!                                       - the VT connection was in state "E_VT_CONNECTION_STATE_INACTIVE"
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtConnections    array with a "TVtConnection" for each local control function
//!
//! @date         02.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackVtDeactivateClient(ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function continues the connection process with the current VT server, it starts the pool upload (or
//!        loading from non-volatile memory).
//!
//!        Call this function as quick as possible after a connection request (callback "fpvConnectionRequest").
//!        Note: If there is a connection problem with the VT server before the pool has successfully been
//!              uploaded/loaded, there can be a new connection request.
//!
//! @param[in]    eLocalCf                 local control function which is acting as VT client
//! @param[in]    cptVtClientObjectPool    structure generated by "vt-designer" containing the objects and information
//!                                        about the object pool
//!                                        The object pool can only contain AUX-O OR AUX-N objects and not both types of
//!                                        objects at once.
//! @param[in]    cptAdditionalOffsets     These offsets can be supplied to move objects (typically for centering when
//!                                        object scaling is disabled). If you don't want to use these offsets (normal
//!                                        case), set this pointer to NULL.
//!
//! @retval       TRUE                     no error
//! @retval       FALSE                    error because of one of the following reasons:
//!                                        - "eLocalCf" was not available (only the number of local control functions
//!                                          "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                        - the state of stack was not "E_ISO_STACK_STATE_RUNNING"
//!                                        - the given local control function has not been activated
//!                                        - the VT connection was not in state
//!                                          "E_VT_CONNECTION_STATE_WAIT_FOR_DECISION"
//!                                        - "cptVtClientObjectPool" was NULL
//!                                        - the given local control function was not a working set master
//!                                        - the VT client object pool is not valid
//!                                        - there is no pool part we can upload to the VT server we are connected to
//!                                          because of the VT server version or language code
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtConnections     array with a "TVtConnection" for each local control function
//!
//! @date         02.10.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackVtDoConnect(
    ELocalCf eLocalCf,
    const TVtClientObjectPool *cptVtClientObjectPool,
    const TAdditionalOffsets *cptAdditionalOffsets);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function disconnects the VT client from the current VT server and searches a new server. It can also be
//!        the same again if there is no other one that is suitable.
//!
//! @param[in]    eLocalCf                local control function which is acting as VT client
//!
//! @retval       TRUE                    no error
//! @retval       FALSE                   error because of one of the following reasons:
//!                                       - "eLocalCf" was not available (only the number of local control functions
//!                                         "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                       - the state of stack was not "E_ISO_STACK_STATE_RUNNING"
//!                                       - the given local control function has not been activated
//!                                       - the VT connection was not in state
//!                                         "E_VT_CONNECTION_STATE_WAIT_FOR_DECISION"
//!                                       - the given local control function was not a working set master
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtConnections    array with a "TVtConnection" for each local control function
//!
//! @date         02.10.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackVtDontConnect(ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function can be used to get the ISO name of the VT server the specified local control function is
//!        connected with or is trying to connect with.
//!
//! @param[in]     eLocalCf                local control function which is acting as VT client
//! @param[out]    ptIsoNameOfServer       ISO name of the VT server the specified local control function is connected
//!                                        with or is trying to connect with
//!
//! @retval        TRUE                    no error
//! @retval        FALSE                   error because of one of the following reasons:
//!                                        - "eLocalCf" was not available (only the number of local control functions
//!                                          "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                        - the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
//!                                        - the VT connection was in wrong state
//!                                        - "ptIsoNameOfServer" was NULL
//!
//! Static variables affected:\n
//!  -[in]         \b m_atVtConnections    array with a "TVtConnection" for each local control function
//!
//! @date          01.10.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackVtGetIsoNameOfServer(ELocalCf eLocalCf, TName *ptIsoNameOfServer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function can be used to get the scaling factor for the specified local control function and the
//!        specified type.
//!
//! @param[in]     eLocalCf                  local control function which is acting as VT client
//! @param[in]     eScalingType              scaling type: data mask or soft key
//! @param[out]    ptScalingFactor           scaling factor (numerator and denominator)
//!
//! @retval        TRUE                      no error
//! @retval        FALSE                     error because of one of the following reasons:
//!                                          - "eLocalCf" was not available (only the number of local control functions
//!                                            "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                          - "eScalingType" was not one of the values defined for enumeration
//!                                            "EScalingType"
//!                                          - the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
//!                                          - the VT connection was not in state
//!                                            "E_VT_CONNECTION_STATE_COMMAND_HANDLING"
//!                                          - "ptScalingFactor" was NULL
//!
//! Static variables affected:\n
//!  -[in]         \b m_atVtObjectScaling    array of a "TVtObjectScaling" for each local control function
//!
//! @date          28.04.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackVtGetScalingFactor(
    ELocalCf eLocalCf,
    EScalingType eScalingType,
    TScalingFactor *ptScalingFactor);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Delete Object Pool command. After successful deletion we disconnect
//!        from the current VT server and try to connect to the next VT server.
//!
//! @param[in]    eLocalCf    local control function which is acting as VT client
//!
//! @return                   result of Delete Object Pool command sending
//!
//! @date         07.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtMoveToNextVt(ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Hide Object command.
//!        The Hide/Show Object command is used to hide or show a Container object. This pertains to the visibility of
//!        the object as well as its remembered state. If the object cannot be displayed due to references to missing
//!        objects, the VT generates an error in the response.
//!
//! @param[in]    eLocalCf     local control function which is acting as VT client
//! @param[in]    u16ObjId     object ID
//! @param[in]    u32UserId    user ID (useful to identify a command in the command buffer)
//!
//! @return                    result of Hide Object command sending
//!
//! @date         16.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQHideObject(ELocalCf eLocalCf, TUint16 u16ObjId, TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Show Object command.
//!        The Hide/Show Object command is used to hide or show a Container object. This pertains to the visibility of
//!        the object as well as its remembered state. If the object cannot be displayed due to references to missing
//!        objects, the VT generates an error in the response.
//!
//! @param[in]    eLocalCf     local control function which is acting as VT client
//! @param[in]    u16ObjId     object ID
//! @param[in]    u32UserId    user ID (useful to identify a command in the command buffer)
//!
//! @return                    result of Show Object command sending
//!
//! @date         16.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQShowObject(ELocalCf eLocalCf, TUint16 u16ObjId, TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Disable Object command.
//!        The Enable/Disable Object command is used to enable or disable an input field object or a Button object and
//!        pertains to the accessibility of an input field object or Button object. This command is also used to enable
//!        or disable an Animation object.
//!
//! @param[in]    eLocalCf     local control function which is acting as VT client
//! @param[in]    u16ObjId     object ID
//! @param[in]    u32UserId    user ID (useful to identify a command in the command buffer)
//!
//! @return                    result of Disable Object command sending
//!
//! @date         20.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQDisableObject(ELocalCf eLocalCf, TUint16 u16ObjId, TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of an Enable Object command.
//!        The Enable/Disable Object command is used to enable or disable an input field object or a Button object and
//!        pertains to the accessibility of an input field object or Button object. This command is also used to enable
//!        or disable an Animation object.
//!
//! @param[in]    eLocalCf     local control function which is acting as VT client
//! @param[in]    u16ObjId     object ID
//! @param[in]    u32UserId    user ID (useful to identify a command in the command buffer)
//!
//! @return                    result of Enable Object command sending
//!
//! @date         20.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQEnableObject(ELocalCf eLocalCf, TUint16 u16ObjId, TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Select Input Object command.
//!        This command is used to force the selection of an input field, Button, or Key object.
//!
//! @param[in]    eLocalCf                  local control function which is acting as VT client
//! @param[in]    u16ObjId                  object ID
//! @param[in]    boActivateForDataInput    TRUE     Activate for data input. (Only available in VT Version 4+)
//!                                         FALSE    Don't activate for data input.
//! @param[in]    u32UserId                 user ID (useful to identify a command in the command buffer)
//!
//! @return                                 result of Select Input Object command sending
//!
//! @date         20.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQSelectInputObject(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TBoolean boActivateForDataInput,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of an Escape command.
//!        This command is used to abort operator input.
//!
//! @param[in]    eLocalCf     local control function which is acting as VT client
//! @param[in]    u32UserId    user ID (useful to identify a command in the command buffer)
//!
//! @return                    result of Escape command sending
//!
//! @date         20.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQEsc(ELocalCf eLocalCf, TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Control Audio Signal command.
//!        This command may be used to control the audio on the VT.
//!
//! @param[in]    eLocalCf              local control function which is acting as VT client
//! @param[in]    u8Activations         activations:
//!                                     0       = terminate any audio in process from the originating ECU
//!                                     1 – 255 = number of audio activations
//! @param[in]    u16Frequency          frequency in hz
//! @param[in]    u16OnTimeDuration     on-time duration in ms
//! @param[in]    u16OffTimeDuration    off-time duration in ms
//! @param[in]    u32UserId             user ID (useful to identify a command in the command buffer)
//!
//! @return                             result of Control Audio Signal command sending
//!
//! @date         20.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQControlAudioSignal(
    ELocalCf eLocalCf,
    TUint8 u8Activations,
    TUint16 u16Frequency,
    TUint16 u16OnTimeDuration,
    TUint16 u16OffTimeDuration,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Set Audio Volume command.
//!        This command can be used to control the audio on the VT.
//!
//! @param[in]    eLocalCf                    local control function which is acting as VT client
//! @param[in]    u8PercentOfMaximumVolume    percent (0 - 100 %) of maximum volume set by operator
//! @param[in]    u32UserId                   user ID (useful to identify a command in the command buffer)
//!
//! @return                                   result of Set Audio Volume command sending
//!
//! @date         20.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQSetAudioVolume(
    ELocalCf eLocalCf,
    TUint8 u8PercentOfMaximumVolume,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Size command.
//!        The Change Size command is used to change the size of an object. A value of 0 for width or height or both
//!        means that the object size is 0 and the object is not drawn.
//!
//! @param[in]    eLocalCf        local control function which is acting as VT client
//! @param[in]    u16ObjId        object ID of object to size
//! @param[in]    u16NewWidth     new width
//! @param[in]    u16NewHeight    new heigth
//! @param[in]    u32UserId       user ID (useful to identify a command in the command buffer)
//!
//! @return                       result of Change Size command sending
//!
//! @date         20.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeSize(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint16 u16NewWidth,
    TUint16 u16NewHeight,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Child Position command.
//!        The Change Child Position command is used to change the position of an object.
//!
//! @param[in]    eLocalCf           local control function which is acting as VT client
//! @param[in]    u16ParentObjId     parent object ID
//! @param[in]    u16ObjId           object ID of object to move
//! @param[in]    i16NewPositionX    new X position relative to the top left corner of parent object
//! @param[in]    i16NewPositionY    new Y position relative to the top left corner of parent object
//! @param[in]    u32UserId          user ID (useful to identify a command in the command buffer)
//!
//! @return                          result of Change Child Position command sending
//!
//! @date         16.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeChildPosition(
    ELocalCf eLocalCf,
    TUint16 u16ParentObjId,
    TUint16 u16ObjId,
    TInt16 i16NewPositionX,
    TInt16 i16NewPositionY,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Background Colour command.
//!        This command is used to change the background colour of an object.
//!
//! @param[in]    eLocalCf         local control function which is acting as VT client
//! @param[in]    u16ObjId         object ID of object to change
//! @param[in]    u8ColourValue    new background colour
//! @param[in]    u32UserId        user ID (useful to identify a command in the command buffer)
//!
//! @return                        result of Change Background Colour command sending
//!
//! @date         16.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeBackgroundColour(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint8 u8ColourValue,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Numeric Value command.
//!        This command is used to change the value of an object.It applies only to objects that have a numeric "value"
//!        attribute. The size of the object shall not be changed by this command. Only the object indicated in the
//!        command is to be changed, variables referenced by the object are not changed.
//!
//! @param[in]    eLocalCf       local control function which is acting as VT client
//! @param[in]    u16ObjId       object ID of object to change
//! @param[in]    u32NewValue    new value for value attribute
//! @param[in]    u32UserId      user ID (useful to identify a command in the command buffer)
//!
//! @return                      result of Change Numeric Value command sending
//!
//! @date         16.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeNumericValue(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint32 u32NewValue,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change String Value command.
//!        This command is used to change the value of an object. It applies only to objects that have a string "value"
//!        attribute. The size of the object shall not be changed by this command. Only the object indicated in the
//!        command is to be changed, variables referenced by the object are not changed.
//!
//! @param[in]    eLocalCf              local control function which is acting as VT client
//! @param[in]    u16ObjId              object ID of object to change
//! @param[in]    cpchNewStringValue    new string value (pointer must not be NULL, string has to be null-terminated and
//!                                     maximal length of string is size of VT command buffer defined by application
//!                                     which is maximal 32768 byte)
//! @param[in]    u32UserId             user ID (useful to identify a command in the command buffer)
//!
//! @return                             result of Change String Value command sending
//!
//! @date         21.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeStringValue(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    const TChar *cpchNewStringValue,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change End Point command.
//!        This command is used to change the end point of an Output Line object by changing the width, height and/or
//!        line direction attributes.
//!
//! @param[in]    eLocalCf              local control function which is acting as VT client
//! @param[in]    u16ObjId              object ID of an Output Line object to change
//! @param[in]    u16NewWidth           new width
//! @param[in]    u16NewHeight          new height
//! @param[in]    u8NewLineDirection    new line direction
//! @param[in]    u32UserId             user ID (useful to identify a command in the command buffer)
//!
//! @return                             result of Change End Point command sending
//!
//! @date         20.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeEndPoint(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint16 u16NewWidth,
    TUint16 u16NewHeight,
    TUint8 u8NewLineDirection,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Font Attributes command.
//!        This command is used to change the Font Attributes in a Font Attributes object.
//!
//! @param[in]    eLocalCf        local control function which is acting as VT client
//! @param[in]    u16ObjId        object ID of object to change
//! @param[in]    u8FontColour    font colour
//! @param[in]    u8FontSize      font size
//! @param[in]    u8FontType      font type
//! @param[in]    u8FontStyle     font style
//! @param[in]    u32UserId       user ID (useful to identify a command in the command buffer)
//!
//! @return                       result of Change Font Attributes command sending
//!
//! @date         21.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeFontAttributes(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint8 u8FontColour,
    TUint8 u8FontSize,
    TUint8 u8FontType,
    TUint8 u8FontStyle,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Line Attributes command.
//!        This command is used to change the Line Attributes in a Line Attributes object.
//!
//! @param[in]    eLocalCf        local control function which is acting as VT client
//! @param[in]    u16ObjId        object ID of object to change
//! @param[in]    u8LineColour    line colour
//! @param[in]    u8LineWidth     line width
//! @param[in]    u16LineArt      line art
//! @param[in]    u32UserId       user ID (useful to identify a command in the command buffer)
//!
//! @return                       result of Change Line Attributes command sending
//!
//! @date         21.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeLineAttributes(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint8 u8LineColour,
    TUint8 u8LineWidth,
    TUint16 u16LineArt,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Fill Attributes command.
//!        This command is used to change the Fill Attributes in a Fill Attributes object.
//!
//! @param[in]    eLocalCf               local control function which is acting as VT client
//! @param[in]    u16ObjId               object ID of object to change
//! @param[in]    u8FillType             fill type
//! @param[in]    u8FillColour           fill colour
//! @param[in]    u16FillPatternObjId    fill pattern object ID
//! @param[in]    u32UserId              user ID (useful to identify a command in the command buffer)
//!
//! @return                              result of Change Fill Attributes command sending
//!
//! @date         21.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeFillAttributes(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint8 u8FillType,
    TUint8 u8FillColour,
    TUint16 u16FillPatternObjId,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Active Mask command.
//!        This command is used to change the active mask of a Working Set to either a Data Mask object or an Alarm Mask
//!        object.
//!
//! @param[in]    eLocalCf                 local control function which is acting as VT client
//! @param[in]    u16WorkingSetObjId       working set object ID
//! @param[in]    u16NewActiveMaskObjId    new active mask object ID
//! @param[in]    u32UserId                user ID (useful to identify a command in the command buffer)
//!
//! @return                                result of Change Active Mask command sending
//!
//! @date         16.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeActiveMask(
    ELocalCf eLocalCf,
    TUint16 u16WorkingSetObjId,
    TUint16 u16NewActiveMaskObjId,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Soft Key Mask command.
//!        This command is used to change the Soft Key Mask associated with a Data Mask object or an Alarm Mask object.
//!
//! @param[in]    eLocalCf                  local control function which is acting as VT client
//! @param[in]    eMaskType                 mask type (1 = data, 2 = alarm)
//! @param[in]    u16MaskObjId              Data or Alarm Mask object ID
//! @param[in]    u16NewSoftKeyMaskObjId    new Soft Key Mask object ID
//! @param[in]    u32UserId                 user ID (useful to identify a command in the command buffer)
//!
//! @return                                 result of Change Soft Key Mask command sending
//!
//! @date         21.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeSoftKeyMask(
    ELocalCf eLocalCf,
    EMaskType eMaskType,
    TUint16 u16MaskObjId,
    TUint16 u16NewSoftKeyMaskObjId,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Attribute command (TUint32).
//!        This command is used to change any attribute with an assigned AID. This message cannot be used to change
//!        strings.
//!
//! @param[in]    eLocalCf         local control function which is acting as VT client
//! @param[in]    u16ObjId         object ID of object to change
//! @param[in]    u8AttributeId    attribute ID
//! @param[in]    u32NewValue      new value for attribute (TUint32)
//! @param[in]    u32UserId        user ID (useful to identify a command in the command buffer)
//!
//! @return                        result of Change Attribute command sending
//!
//! @date         16.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeAttributeTUint32(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint8 u8AttributeId,
    TUint32 u32NewValue,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Attribute command (TFloat32).
//!        This command is used to change any attribute with an assigned AID. This message cannot be used to change
//!        strings.
//!
//! @param[in]    eLocalCf         local control function which is acting as VT client
//! @param[in]    u16ObjId         object ID of object to change
//! @param[in]    u8AttributeId    attribute ID
//! @param[in]    f32NewValue      new value for attribute (TFloat32)
//! @param[in]    u32UserId        user ID (useful to identify a command in the command buffer)
//!
//! @return                        result of Change Attribute command sending
//!
//! @date         21.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeAttributeTFloat32(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint8 u8AttributeId,
    TFloat32 f32NewValue,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change Priority command.
//!        This command is used to change the priority of an Alarm Mask. This command causes the VT to evaluate the
//!        priority of all active masks and may cause a change to a different mask if the Alarm Mask being changed
//!        should either become the active Working Set and mask, or should no longer be the active Working Set and mask.
//!
//! @param[in]    eLocalCf     local control function which is acting as VT client
//! @param[in]    u16ObjId     object ID of Alarm Mask
//! @param[in]    u8NewPrio    new priority
//! @param[in]    u32UserId    user ID (useful to identify a command in the command buffer)
//!
//! @return                    result of Change Priority command sending
//!
//! @date         21.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangePriority(
    ELocalCf eLocalCf,
    TUint16 u16ObjId,
    TUint8 u8NewPrio,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a Change List Item command.
//!        This command is used to change a list item in an Input List object, Output List object, Animation object or
//!        External Object Definition object.
//!
//! @param[in]    eLocalCf           local control function which is acting as VT client
//! @param[in]    u16ListObjId       object ID of an Input List object, Output List object, Animation object or External
//!                                  Object Definition object
//! @param[in]    u8ListIndex        list index (items are numbered 0 - n)
//! @param[in]    u16NewItemObjId    new object ID or 0xFFFF to set empty item
//! @param[in]    u32UserId          user ID (useful to identify a command in the command buffer)
//!
//! @return                          result of Change List Item command sending
//!
//! @date         21.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQChangeListItem(
    ELocalCf eLocalCf,
    TUint16 u16ListObjId,
    TUint8 u8ListIndex,
    TUint16 u16NewItemObjId,
    TUint32 u32UserId);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the sending of a proprietary VT command.
//!
//! @param[in]    eLocalCf                    local control function which is acting as VT client
//! @param[in]    cptCU8Buffer                pointer to buffer for command (pointer must not be NULL and also member
//!                                           "cpu8Data" must not be NULL); maximal size of data is size of VT command
//!                                           buffer defined by application (maximal 32768 byte); if data is less than 8
//!                                           bytes, 8 bytes are sent with the missing ones padded with value 0xFF; the
//!                                           first data byte is the "group function byte" and its value has to be in
//!                                           the range for proprietary VT commands which is from 0x60 (decimal: 96) to
//!                                           0x7F (decimal: 127)
//! @param[in]    u16UserId                   user ID (useful to identify a command when the reponse from the VT server
//!                                           is received)
//! @param[in]    u8RetryCount                maximal number of retries ("number of tries" = "number of retries" + 1) if
//!                                           there was no response from the VT server; possible range: 0 - 3; not valid
//!                                           if "u16TimeoutMs" is 0
//! @param[in]    u16TimeoutMs                timeout (in unit ms) for waiting for the response of the VT server before
//!                                           doing a retry; possible range: 0 - 2047; value 0 means "don't wait for
//!                                           response, immediately proceed with next command"
//! @param[in]    boDisconnectIfNoResponse    indicates if we have to disconnect from the connected VT server if there
//!                                           was no response from the server also with retries (the behavior for
//!                                           "normal" (non-proprietary) VT commands is to disconnect in case of no
//!                                           response); not valid if "u16TimeoutMs" is 0
//!
//! @return                                   result of proprietary VT command sending
//!
//! @date         14.10.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EQCommandResult eIsoStackVtQPropCmd(
    ELocalCf eLocalCf,
    const TCU8Buffer *cptCU8Buffer,
    TUint16 u16UserId,
    TUint8 u8RetryCount,
    TUint16 u16TimeoutMs,
    TBoolean boDisconnectIfNoResponse);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the preferred input (more exactly the table with the preferred input candidates) for the
//!        function with object ID "u16FunctionObjectId".
//!        The function is useful for storing the preferred assignments before a power cycle and restoring them
//!        afterwards.
//!        For that the normal procedure is the following:
//!        Before the power cycle you first call "u8IsoStackVtGetNoOfAux2Functions()" to get the number of auxiliary
//!        functions (type 2) and then you store the preferred assignments using function
//!        "boIsoStackVtGetPreferredAux2Input()" for all auxiliary functions (indeces between 0 and
//!        "u8IsoStackVtGetNoOfAux2Functions() - 1").
//!        After the power cycle you restore the preferred assignments for all auxiliary functions using function
//!        "boIsoStackVtSetPreferredAux2Input()".
//!
//! @param[in]    eLocalCf                              local control function which is acting as VT client
//! @param[in]    u16FunctionObjectId                   object ID of function
//! @param[in]    cptTableOfPreferredInputCandidates    table with preferred input canditates of function with object ID
//!                                                     "u16FunctionObjectId"
//!
//! @retval       TRUE                                  table with preferred input canditates could be set successfully
//!               FALSE                                 table with preferred input canditates could not be set
//!                                                     successfully because of one of the following reasons:
//!                                                     - the state of the stack was not
//!                                                       "E_ISO_STACK_STATE_INITIALIZING"
//!                                                     - "eLocalCf" was not available (only the number of local control
//!                                                       functions "NUM_LOCAL_CF", that you defined in AppConfig.h, can
//!                                                       be used)
//!                                                     - "cptTableOfPreferredInputCandidates" was "NULL"
//!                                                     - "cptTableOfPreferredInputCandidates->u16Size" was greater
//!                                                       than MAX_NO_OF_PREFERRED_INPUT_CANDIDATES
//!                                                     - two preferred input candidates were equal
//!                                                     - AUX function was not found in object pool (that is also the
//!                                                       case if the VT client has not yet been activated at all)
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_aatAux2FunctionTable             table containing all AUX functions (type 2)\n
//!  -[in]        \b m_au8Aux2FunctionTableSize         number of AUX functions (type 2) in "m_aatAux2FunctionTable"
//!
//! @date         29.06.2016
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackVtSetPreferredAux2Input(
    ELocalCf eLocalCf,
    TUint16 u16FunctionObjectId,
    const TTableOfPreferredInputCandidates *cptTableOfPreferredInputCandidates);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function writes the object ID of the function with index "u8FunctionIndex" to "pu16FunctionObjectId" and
//!        the table with its preferred input candidates to "ptTableOfPreferredInputCandidates".
//!        The function is intended to be used for storing the preferred assignments before shutdown in order to restore
//!        them during the next boot-up.
//!        This function is not intended to be used triggered by callbacks!
//!        The normal procedure is the following:
//!        Before the power cycle you first call "u8IsoStackVtGetNoOfAux2Functions()" to get the number of auxiliary
//!        functions (type 2) and then you store the preferred assignments using function
//!        "boIsoStackVtGetPreferredAux2Input()" for all auxiliary functions (indeces between 0 and
//!        "u8IsoStackVtGetNoOfAux2Functions() - 1").
//!        After the power cycle you restore the preferred assignments for all auxiliary functions using function
//!        "boIsoStackVtSetPreferredAux2Input()".
//!
//! @param[in]     eLocalCf                             local control function which is acting as VT client
//! @param[in]     u8FunctionIndex                      index of function
//!                                                     (use "u8IsoStackVtGetNoOfAux2Functions()" to determine the
//!                                                     possible range of the indeces, indeces start with 0 so they
//!                                                     always have to be less than the number of functions)
//! @param[out]    pu16FunctionObjectId                 object ID of function with index "u8FunctionIndex"
//! @param[out]    ptTableOfPreferredInputCandidates    table with preferred input canditates of function with index
//!                                                     "u8FunctionIndex"
//!
//! @retval        TRUE                                 object ID and table with preferred input canditates could
//!                                                     successfully be written to "pu16FunctionObjectId" and
//!                                                     "ptTableOfPreferredInputCandidates"
//!                FALSE                                object ID and table with preferred input canditates could not
//!                                                     successfully be written to "pu16FunctionObjectId" and
//!                                                     "ptTableOfPreferredInputCandidates" because of one of the
//!                                                     following reasons:
//!                                                     - the state of the stack was "E_ISO_STACK_STATE_CLOSED" or
//!                                                       "E_ISO_STACK_STATE_INITIALIZING"
//!                                                     - "eLocalCf" was not available (only the number of local control
//!                                                       functions "NUM_LOCAL_CF", that you defined in AppConfig.h, can
//!                                                       be used)
//!                                                     - "u8FunctionIndex" was greater than or equal to the number of
//!                                                       functions
//!                                                     - "pu16FunctionObjectId" was "NULL"
//!                                                     - "ptTableOfPreferredInputCandidates" was "NULL"
//!
//! Static variables affected:\n
//!  -[in]         \b m_aatAux2FunctionTable            table containing all AUX functions (type 2)\n
//!  -[in]         \b m_au8Aux2FunctionTableSize        number of AUX functions (type 2) in "m_aatAux2FunctionTable"
//!
//! @date          29.06.2016
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackVtGetPreferredAux2Input(
    ELocalCf eLocalCf,
    TUint8 u8FunctionIndex,
    TUint16 *pu16FunctionObjectId,
    TTableOfPreferredInputCandidates *ptTableOfPreferredInputCandidates);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the number of Auxiliary Functions (type 2). It can be used to determine the possible
//!        range of the function indeces (needed for calling "boIsoStackVtGetPreferredAux2Input()"). The indeces start
//!        with 0 so they always have to be less than the number of functions.
//!        The function is useful for storing the preferred assignments before a power cycle and restoring them
//!        afterwards.
//!        For that the normal procedure is the following:
//!        Before the power cycle you first call "u8IsoStackVtGetNoOfAux2Functions()" to get the number of auxiliary
//!        functions (type 2) and then you store the preferred assignments using function
//!        "boIsoStackVtGetPreferredAux2Input()" for all auxiliary functions (indeces between 0 and
//!        "u8IsoStackVtGetNoOfAux2Functions() - 1").
//!        After the power cycle you restore the preferred assignments for all auxiliary functions using function
//!        "boIsoStackVtSetPreferredAux2Input()".
//!
//! @param[in]    eLocalCf                         local control function which is acting as VT client
//!
//! @return                                        number of AUX functions or 255 if state of stack was
//!                                                "E_ISO_STACK_STATE_CLOSED" or "E_ISO_STACK_STATE_INITIALIZING" or if
//!                                                "eLocalCf" was not available (only the number of local control
//!                                                functions "NUM_LOCAL_CF", that you defined in AppConfig.h, can be
//!                                                used)
//!
//! Static variables affected:\n
//!  -[in]        \b m_au8Aux2FunctionTableSize    number of AUX functions (type 2) in "m_aatAux2FunctionTable"
//!
//! @date         29.06.2016
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackVtGetNoOfAux2Functions(ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input of type "boolean - latching" or "boolean - non-latching".
//!        Note: The minimal time interval for sending the input status message is 50ms. So if you change values more
//!              often, probably not everything can be sent.
//!
//! @param[in]    eLocalCf                   local control function which is acting as input device
//! @param[in]    u16InputObjectId           object ID of input whose status shall be set
//! @param[in]    boInputPressed             indicates whether input is currently pressed or not
//! @param[in]    boInputActivated           indicates whether input is currently activated or not
//!                                          This is only important if we are in learn mode. Here the user can activate
//!                                          an input to select it for an assignment.
//!                                          To be sure that an Auxiliary Input Type 2 Status message is sent out with
//!                                          "input activated in learn mode", you have to set "boInputActivated" to TRUE
//!                                          for at least 200ms.
//!                                          If an input has been pressed (e.g. a Non-Latching Boolean) by the user for
//!                                          a shorter time interval, the application can decide if it sets
//!                                          "boInputActivated" to TRUE for at least 200ms.
//!                                          For a Latching Boolean the application should set "boInputActivated" to
//!                                          TRUE only on an edge ("not latched to latched" or "latched to not
//!                                          latched").
//!
//! @return                                  result of status setting (see definition of "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux2InputsData    array with AUX inputs data for each local control function
//!
//! @date         09.09.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux2InputBooleanStatus(
    ELocalCf eLocalCf,
    TUint16 u16InputObjectId,
    TBoolean boInputPressed,
    TBoolean boInputActivated);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input of type "analog (maintains position setting)", "analog - return to
//!        50%" or "analog - return to 0%".
//!        Note: The minimal time interval for sending the input status message is 50ms. So if you change values more
//!              often, probably not everything can be sent.
//!
//! @param[in]    eLocalCf                   local control function which is acting as input device
//! @param[in]    u16InputObjectId           object ID of input whose status shall be set
//! @param[in]    u16Value                   current value of input
//!                                            0% (0x0000) = backward, down, left , counter-clockwise
//!                                          100% (0xFAFF) = forward , up  , right, clockwise
//! @param[in]    boInputActivated           indicates whether input is currently activated or not
//!                                          This is only important if we are in learn mode. Here the user can activate
//!                                          an input to select it for an assignment.
//!                                          To be sure that an Auxiliary Input Type 2 Status message is sent out with
//!                                          "input activated in learn mode", you have to set "boInputActivated" to TRUE
//!                                          for at least 200ms.
//!                                          If an input has been pressed (e.g. a Non-Latching Boolean) by the user for
//!                                          a shorter time interval, the application can decide if it sets
//!                                          "boInputActivated" to TRUE for at least 200ms.
//!                                          For a Latching Boolean the application should set "boInputActivated" to
//!                                          TRUE only on an edge ("not latched to latched" or "latched to not
//!                                          latched").
//!
//! @return                                  result of status setting (see definition of "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux2InputsData    array with AUX inputs data for each local control function
//!
//! @date         09.09.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux2InputAnalogStatus(
    ELocalCf eLocalCf,
    TUint16 u16InputObjectId,
    TUint16 u16Value,
    TBoolean boInputActivated);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input of type "dual boolean - both latching", "dual boolean - both
//!        non-latching", "dual boolean - latching (up)" or "dual boolean - latching (down)".
//!        Note: The minimal time interval for sending the input status message is 50ms. So if you change values more
//!              often, probably not everything can be sent.
//!
//! @param[in]    eLocalCf                   local control function which is acting as input device
//! @param[in]    u16InputObjectId           object ID of input whose status shall be set
//! @param[in]    ePos                       current position of input
//! @param[in]    boInputActivated           indicates whether input is currently activated or not
//!                                          This is only important if we are in learn mode. Here the user can activate
//!                                          an input to select it for an assignment.
//!                                          To be sure that an Auxiliary Input Type 2 Status message is sent out with
//!                                          "input activated in learn mode", you have to set "boInputActivated" to TRUE
//!                                          for at least 200ms.
//!                                          If an input has been pressed (e.g. a Non-Latching Boolean) by the user for
//!                                          a shorter time interval, the application can decide if it sets
//!                                          "boInputActivated" to TRUE for at least 200ms.
//!                                          For a Latching Boolean the application should set "boInputActivated" to
//!                                          TRUE only on an edge ("not latched to latched" or "latched to not
//!                                          latched").
//!
//! @return                                  result of status setting (see definition of "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux2InputsData    array with AUX inputs data for each local control function
//!
//! @date         09.09.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux2InputDualBooleanStatus(
    ELocalCf eLocalCf,
    TUint16 u16InputObjectId,
    EAux2InputDualBooleanPosition ePos,
    TBoolean boInputActivated);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input of type "combined analog - return to 50%" or "combined analog -
//!        maintains position setting".
//!        Note: The minimal time interval for sending the input status message is 50ms. So if you change values more
//!              often, probably not everything can be sent.
//!
//! @param[in]    eLocalCf                   local control function which is acting as input device
//! @param[in]    u16InputObjectId           object ID of input whose status shall be set
//! @param[in]    u16Value                   current value of input
//!                                            0% (0x0000) = backward, down, left , counter-clockwise
//!                                          100% (0xFAFF) = forward , up  , right, clockwise
//!                                          0xFB00        = latched forward
//!                                          0xFB01        = latched backward
//! @param[in]    boInputActivated           indicates whether input is currently activated or not
//!                                          This is only important if we are in learn mode. Here the user can activate
//!                                          an input to select it for an assignment.
//!                                          To be sure that an Auxiliary Input Type 2 Status message is sent out with
//!                                          "input activated in learn mode", you have to set "boInputActivated" to TRUE
//!                                          for at least 200ms.
//!                                          If an input has been pressed (e.g. a Non-Latching Boolean) by the user for
//!                                          a shorter time interval, the application can decide if it sets
//!                                          "boInputActivated" to TRUE for at least 200ms.
//!                                          For a Latching Boolean the application should set "boInputActivated" to
//!                                          TRUE only on an edge ("not latched to latched" or "latched to not
//!                                          latched").
//!
//! @return                                  result of status setting (see definition of "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux2InputsData    array with AUX inputs data for each local control function
//!
//! @date         09.09.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux2InputCombinedAnalogStatus(
    ELocalCf eLocalCf,
    TUint16 u16InputObjectId,
    TUint16 u16Value,
    TBoolean boInputActivated);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input of type "quadrature boolean - non-latching".
//!        Note: The minimal time interval for sending the input status message is 50ms. So if you change values more
//!              often, probably not everything can be sent.
//!
//! @param[in]    eLocalCf                       local control function which is acting as input device
//! @param[in]    u16InputObjectId               object ID of input whose status shall be set
//! @param[in]    ePosForwardBackwardOrUpDown    current position of input in direction "forward-backward" or "up-down"
//! @param[in]    ePosRightLeft                  current position of input in direction "right-left"
//! @param[in]    boInputActivated               indicates whether input is currently activated or not
//!                                              This is only important if we are in learn mode. Here the user can
//!                                              activate an input to select it for an assignment.
//!                                              To be sure that an Auxiliary Input Type 2 Status message is sent out
//!                                              with "input activated in learn mode", you have to set
//!                                              "boInputActivated" to TRUE for at least 200ms.
//!                                              If an input has been pressed (e.g. a Non-Latching Boolean) by the user
//!                                              for a shorter time interval, the application can decide if it sets
//!                                              "boInputActivated" to TRUE for at least 200ms.
//!                                              For a Latching Boolean the application should set "boInputActivated" to
//!                                              TRUE only on an edge ("not latched to latched" or "latched to not
//!                                              latched").
//!
//! @return                                      result of status setting (see definition of
//!                                              "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux2InputsData        array with AUX inputs data for each local control function
//!
//! @date         09.09.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux2InputQuadBooleanStatus(
    ELocalCf eLocalCf,
    TUint16 u16InputObjectId,
    EAux2InputDualBooleanPosition ePosForwardBackwardOrUpDown,
    EAux2InputDualBooleanPosition ePosRightLeft,
    TBoolean boInputActivated);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input of type "quadrature analog (maintains position setting)" or
//!        "quadrature analog return to 50%".
//!        Note: The minimal time interval for sending the input status message is 50ms. So if you change values more
//!              often, probably not everything can be sent.
//!
//! @param[in]    eLocalCf                           local control function which is acting as input device
//! @param[in]    u16InputObjectId                   object ID of input whose status shall be set
//! @param[in]    u16ValueForwardBackwardOrUpDown    current value of input in direction "forward-backward" or "up-down"
//!                                                    0% (0x0000) = backward or down
//!                                                  100% (0xFAFF) = forward  or up
//! @param[in]    u16ValueRightLeft                  current value of input in direction "right-left"
//!                                                    0% (0x0000) = left
//!                                                  100% (0xFAFF) = right
//! @param[in]    boInputActivated                   indicates whether input is currently activated or not
//!                                                  This is only important if we are in learn mode. Here the user can
//!                                                  activate an input to select it for an assignment.
//!                                                  To be sure that an Auxiliary Input Type 2 Status message is sent
//!                                                  out with "input activated in learn mode", you have to set
//!                                                  "boInputActivated" to TRUE for at least 200ms.
//!                                                  If an input has been pressed (e.g. a Non-Latching Boolean) by the
//!                                                  user for a shorter time interval, the application can decide if it
//!                                                  sets "boInputActivated" to TRUE for at least 200ms.
//!                                                  For a Latching Boolean the application should set
//!                                                  "boInputActivated" to TRUE only on an edge ("not latched to
//!                                                  latched" or "latched to not latched").
//!
//! @return                                          result of status setting (see definition of
//!                                                  "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux2InputsData            array with AUX inputs data for each local control function
//!
//! @date         09.09.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux2InputQuadAnalogStatus(
    ELocalCf eLocalCf,
    TUint16 u16InputObjectId,
    TUint16 u16ValueForwardBackwardOrUpDown,
    TUint16 u16ValueRightLeft,
    TBoolean boInputActivated);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input of type "bidirectional encoder".
//!        Count increases when turning in the encoders "increase" direction and count decreases when turning in the
//!        opposite direction.
//!        Note: The minimal time interval for sending the input status message is 50ms. So if you change values more
//!              often, probably not everything can be sent.
//!
//! @param[in]    eLocalCf                                         local control function which is acting as input
//!                                                                device
//! @param[in]    u16InputObjectId                                 object ID of input whose status shall be set
//! @param[in]    u16ValueCurrentCount                             current count, 0 to 0xFFFF with rollover to 0
//! @param[in]    u16ValueCalibrationEncoderCountsPerRevolution    calibration - encoder counts per revolution, 1 to
//!                                                                0xFFFF (fixed value)
//! @param[in]    boInputActivated                                 indicates whether input is currently activated or not
//!                                                                This is only important if we are in learn mode. Here
//!                                                                the user can activate an input to select it for an
//!                                                                assignment.
//!                                                                To be sure that an Auxiliary Input Type 2 Status
//!                                                                message is sent out with "input activated in learn
//!                                                                mode", you have to set "boInputActivated" to TRUE for
//!                                                                at least 200ms.
//!                                                                If an input has been pressed (e.g. a Non-Latching
//!                                                                Boolean) by the user for a shorter time interval, the
//!                                                                application can decide if it sets "boInputActivated"
//!                                                                to TRUE for at least 200ms.
//!                                                                For a Latching Boolean the application should set
//!                                                                "boInputActivated" to TRUE only on an edge ("not
//!                                                                latched to latched" or "latched to not latched").
//!
//! @return                                                        result of status setting (see definition of
//!                                                                "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux2InputsData                          array with AUX inputs data for each local control
//!                                                                function
//!
//! @date         09.09.2020
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux2InputBidirectionalEncoderStatus(
    ELocalCf eLocalCf,
    TUint16 u16InputObjectId,
    TUint16 u16ValueCurrentCount,
    TUint16 u16ValueCalibrationEncoderCountsPerRevolution,
    TBoolean boInputActivated);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input (of every type except "bidirectional encoder") to "error" or "not
//!        available" or also back to a valid value which can then be set by the normal setters again. If this function
//!        is never called, the status of the input is always a valid value. If this function is called with "error" or
//!        "not available", the status values set by the normal setters are reset (especially for "held" calculation).
//!        Note: The minimal time interval for sending the input status message is 50ms. So if you change values more
//!              often, probably not everything can be sent.
//!
//! @param[in]    eLocalCf                    local control function which is acting as input device
//! @param[in]    u16InputObjectId            object ID of input whose status shall be set
//! @param[in]    eStatusErrorNotAvailable    see definition of enum "EAuxInputStatusErrorNotAvailable"
//!
//! @return                                   result of status setting (see definition of
//!                                           "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux2InputsData     array with AUX inputs data for each local control function
//!
//! @date         15.02.2023
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux2InputStatusErrorNotAvailable(
    ELocalCf eLocalCf,
    TUint16 u16InputObjectId,
    EAuxInputStatusErrorNotAvailable eStatusErrorNotAvailable);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input of type "boolean - latching" or "boolean - non-latching"
//!        for the auxiliary inputs (type 1, "AUX-O").
//!        Note: The minimal time interval for sending the input status message is 200ms.
//!
//! @param[in]    eLocalCf                   local control function which is acting as input device
//! @param[in]    u8InputNumber              identification number of the input (0 to 250)
//! @param[in]    boInputPressed             indicates whether input is currently pressed or not
//!
//! @return                                  result of status setting (see definition of "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux1InputsData    array with AUX inputs (AUX-O) data for each local control function
//!
//! @date         22.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux1InputBooleanStatus(
    ELocalCf eLocalCf,
    TUint8 u8InputNumber,
    TBoolean boInputPressed);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the status for an input of type "analog" for the auxiliary inputs (type 1, "AUX-O").
//!        Note: The minimal time interval for sending the input status message is 200ms.
//!
//! @param[in]    eLocalCf                   local control function which is acting as input device
//! @param[in]    u8InputNumber              identification number of the input (0 to 250)
//! @param[in]    u16Value                   current value of input:
//!                                            0% (0x0000)
//!                                          100% (0xFFFF)
//!
//! @return                                  result of status setting (see definition of "EAuxInputStatusSettingResult")
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atVtAux1InputsData    array with AUX inputs (AUX-O) data for each local control function
//!
//! @date         22.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EAuxInputStatusSettingResult eIsoStackVtSetAux1InputAnalogStatus(
    ELocalCf eLocalCf,
    TUint8 u8InputNumber,
    TUint16 u16Value);

#endif
