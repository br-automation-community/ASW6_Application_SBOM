//**********************************************************************************************************************
//! @file        IsoStackNw.h
//! @brief       API for accessing network functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        01.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_NW_H
#define ISOAGLIBS_ISO_STACK_NW_H

// INCLUDES=============================================================================================================

#include "IsoStackNw_types.h"

// "ISOAGLIBSE_API" can be set to "__declspec(dllexport)" to build the Windows DLL version of ISOAgLib SE and to
// "__declspec(dllimport)" to use the Windows DLL version of ISOAgLib SE (this setting can be done e.g. in file
// "HalTypedef.h" or in project configuration).
#ifndef ISOAGLIBSE_API
#define ISOAGLIBSE_API
#endif

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION DECLARATIONS=========================================================================================

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets ptName->au8Value to the value of cpu8ValueLittleEndian.
//!
//! @param[out]    ptName                   name of control function (pointer must not be NULL)
//! @param[in]     cpu8ValueLittleEndian    array for ptName->au8Value (Little-Endian, size 8 byte, must not be NULL)
//!
//! @date          03.03.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetNameLittleEndian(TName *ptName, const TUint8 *cpu8ValueLittleEndian);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets pu8ValueLittleEndian to the value of cptName->au8Value.
//!
//! @param[in]     cptName                  name of control function (pointer must not be NULL)
//! @param[out]    pu8ValueLittleEndian     value of ptName->au8Value (Little-Endian, size 8 byte, must not be NULL)
//!
//! @date          03.03.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwGetNameLittleEndian(const TName *cptName, TUint8 *pu8ValueLittleEndian);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function completely initializes ptName with the other function parameters.
//!        The "Reserved" field is always initialized with "0".
//!        "Self Configurable Address" is always initialized with "TRUE" as every ISO11783 node needs to be
//!        self-configurable!
//!        The ranges and values for the fields are described in ISO11783-1.
//!        Out-of-range values are not an error and will be wrapped regarding their bit-size!
//!
//! @exception More than 7 parameters here as the struct has 9 fields per ISO11783 and the fields are non-functional.
//!
//! @param[out]    ptName                        name of control function (pointer must not be NULL)
//! @param[in]     u8ValueIndustryGroup          value for field "Industry group" [3 bit]
//! @param[in]     u8ValueDeviceClassInstance    value for field "Device class instance" [4 bit]
//! @param[in]     u8ValueDeviceClass            value for field "Device class" [7 bit]
//! @param[in]     u8ValueFunction               value for field "Function" [8 bit]
//! @param[in]     u8ValueFunctionInstance       value for field "Function instance" [5 bit]
//! @param[in]     u8ValueECUInstance            value for field "ECU instance" [3 bit]
//! @param[in]     u16ValueManufacturerCode      value for field "Manufacturer code" [11 bit]
//! @param[in]     u32ValueIdentityNumber        value for field "Identity number" [21 bit]
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetName(
    TName *ptName,
    TUint8 u8ValueIndustryGroup,
    TUint8 u8ValueDeviceClassInstance,
    TUint8 u8ValueDeviceClass,
    TUint8 u8ValueFunction,
    TUint8 u8ValueFunctionInstance,
    TUint8 u8ValueECUInstance,
    TUint16 u16ValueManufacturerCode,
    TUint32 u32ValueIdentityNumber);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "Self-configurable address" of ptName to u8Value.
//!
//! @param[out]    ptName     name of control function (pointer must not be NULL)
//! @param[in]     u8Value    value for field "Self-configurable address"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetSelfConfigurableAddress(TName *ptName, TUint8 u8Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "Self-configurable address" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @retval       0          Control function is not self-configurable.
//! @retval       1          Control function is self-configurable.
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackNwGetSelfConfigurableAddress(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "Industry group" of ptName to u8Value.
//!
//! @param[out]    ptName     name of control function (pointer must not be NULL)
//! @param[in]     u8Value    value for field "Industry group"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetIndustryGroup(TName *ptName, TUint8 u8Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "Industry group" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @return                  value of field "Industry group"
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackNwGetIndustryGroup(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "Device class instance" of ptName to u8Value.
//!
//! @param[out]    ptName     name of control function (pointer must not be NULL)
//! @param[in]     u8Value    value for field "Device class instance"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetDeviceClassInstance(TName *ptName, TUint8 u8Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "Device class instance" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @return                  value of field "Device class instance"
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackNwGetDeviceClassInstance(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "Device class" of ptName to u8Value.
//!
//! @param[out]    ptName     name of control function (pointer must not be NULL)
//! @param[in]     u8Value    value for field "Device class"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetDeviceClass(TName *ptName, TUint8 u8Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "Device class" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @return                  value of field "Device class"
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackNwGetDeviceClass(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "Reserved" of ptName to u8Value.
//!
//! @param[out]    ptName     name of control function (pointer must not be NULL)
//! @param[in]     u8Value    value for field "Reserved"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetReserved(TName *ptName, TUint8 u8Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "Reserved" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @return                  value of field "Reserved"
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackNwGetReserved(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "Function" of ptName to u8Value.
//!
//! @param[out]    ptName     name of control function (pointer must not be NULL)
//! @param[in]     u8Value    value for field "Function"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetFunction(TName *ptName, TUint8 u8Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "Function" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @return                  value of field "Function"
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackNwGetFunction(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "Function instance" of ptName to u8Value.
//!
//! @param[out]    ptName     name of control function (pointer must not be NULL)
//! @param[in]     u8Value    value for field "Function instance"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetFunctionInstance(TName *ptName, TUint8 u8Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "Function instance" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @return                  value of field "Function instance"
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackNwGetFunctionInstance(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "ECU instance" of ptName to u8Value.
//!
//! @param[out]    ptName     name of control function (pointer must not be NULL)
//! @param[in]     u8Value    value for field "ECU instance"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetECUInstance(TName *ptName, TUint8 u8Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "ECU instance" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @return                  value of field "ECU instance"
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint8 u8IsoStackNwGetECUInstance(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "Manufacturer code" of ptName to u16Value.
//!
//! @param[out]    ptName      name of control function (pointer must not be NULL)
//! @param[in]     u16Value    value for field "Manufacturer code"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetManufacturerCode(TName *ptName, TUint16 u16Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "Manufacturer code" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @return                  value of field "Manufacturer code"
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackNwGetManufacturerCode(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets field "Identity number" of ptName to u32Value.
//!
//! @param[out]    ptName      name of control function (pointer must not be NULL)
//! @param[in]     u32Value    value for field "Identity number"
//!
//! @date          27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwSetIdentityNumber(TName *ptName, TUint32 u32Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the value of field "Identity number" of cptName.
//!
//! @param[in]    cptName    name of control function (pointer must not be NULL)
//!
//! @return                  value of field "Identity number"
//!
//! @date         27.02.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackNwGetIdentityNumber(const TName *cptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function activates a local control function, i.e. all members of the corresponding entry in the local
//!        control function table are set.
//!
//! @param[in]    eLocalCf               local control function
//! @param[in]    cptName                name of control function (pointer must not be NULL)
//! @param[in]    ptLocalCfStorage       storage of control function (optional, pointer can be NULL)
//! @param[in]    tLocalCfCallback       callback for control function state (optional, pointer can be NULL)
//!
//! @retval       TRUE                   activation was successful
//! @retval       FALSE                  activation was not successful because "eLocalCf" was not available (only the
//!                                      number of local control functions "NUM_LOCAL_CF", that you defined in
//!                                      AppConfig.h, can be used) or state of stack was not
//!                                      "E_ISO_STACK_STATE_INITIALIZING" or control function was already active or
//!                                      "cptName" was NULL
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atLocalCfTable    local control function table
//!
//! @date         05.03.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackNwActivateLocalCf(
    ELocalCf eLocalCf,
    const TName *cptName,
    TLocalCfStorage *ptLocalCfStorage,
    TLocalCfCallback tLocalCfCallback);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function deactivates a local control function. After deactivating the data from the Storage-structure
//!        passed at activation must be saved to non-volatile memory to be read back after a Power-Cycle and used for
//!        the activation of the CF at the next time then.
//!
//! @param[in]    eLocalCf               local control function
//!
//! @retval       TRUE                   deactivation was successful
//! @retval       FALSE                  deactivation was not successful because "eLocalCf" was not available (only the
//!                                      number of local control functions "NUM_LOCAL_CF", that you defined in
//!                                      AppConfig.h, can be used) or state of stack was not "E_ISO_STACK_STATE_CLOSING"
//!                                      or control function was not active
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atLocalCfTable    local control function table
//!
//! @date         05.03.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackNwDeactivateLocalCf(ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the NAME of the remote control function with index "u8RemoteCfIndex" in the intern
//!        remote control function table of ISOAgLib SE.
//!
//! @param[in]     u8RemoteCfIndex         index of remote control function in intern remote control function table of
//!                                        ISOAgLib SE
//! @param[out]    ptName                  pointer to NAME structure where NAME of remote control function is
//!                                        written to (pointer must not be NULL)
//!
//! @return                                result of getting of NAME (see definition of "EGetNameResult")
//!
//! Static variables affected:\n
//!  -[in]         \b m_atRemoteCfTable    intern remote control function table of ISOAgLib SE
//!
//! @date          14.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EGetNameResult eIsoStackNwGetName(TUint8 u8RemoteCfIndex, TName *ptName);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets an entry of m_atWsLocalCfTable.
//!
//! @param[in]    eLocalCf                          local control function
//! @param[in]    u8NoOfMembers                     number of members (must be "1" for now)
//! @param[in]    cptNamesOfMembersWithoutMaster    pointer to array of member names (must be NULL for now)
//!
//! @retval       TRUE                              setting was successful
//! @retval       FALSE                             setting was not successful because state of stack was not
//!                                                 "E_ISO_STACK_STATE_INITIALIZING" or "eLocalCf" was not available
//!                                                 (only the number of local control functions "NUM_LOCAL_CF", that you
//!                                                 defined in AppConfig.h, can be used) or "u8NoOfMembers" was not 1 or
//!                                                 "cptNamesOfMembersWithoutMaster" was not NULL
//!
//! Static variables affected:\n
//!  -[out]       \b m_atWsLocalCfTable             working set data table for the local control functions
//!
//! @date         13.05.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackNwSetMember(
    ELocalCf eLocalCf,
    TUint8 u8NoOfMembers,
    const TName *cptNamesOfMembersWithoutMaster);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the callback that is called when a remote control function changes its status.
//!
//! @param[in]    tRemoteCfModificationCallback    callback that is called when a remote control function changes its
//!                                                status (pointer can be NULL for resetting/deactivation)
//!
//! @date         14.11.2022
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TVoid vIsoStackNwActivateRemoteCfMonitoring(TRemoteCfModificationCallback tRemoteCfModificationCallback);

#endif
