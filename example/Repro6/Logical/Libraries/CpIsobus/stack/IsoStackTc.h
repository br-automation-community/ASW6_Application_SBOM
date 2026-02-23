//**********************************************************************************************************************
//! @file        IsoStackTc.h
//! @brief       API for accessing task controller functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        03.08.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_TC_H
#define ISOAGLIBS_ISO_STACK_TC_H

// INCLUDES=============================================================================================================

#include "IsoStackTc_types.h"
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
//!        "u16PdValueTableSize".
//!
//! @param[in]    u16PdValueTableSize    number of elements
//!
//! @return                              buffer size in byte that is needed for the number of elements given by
//!                                      parameter "u16PdValueTableSize"
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackTcGetPdValueTableConfigMemoryBufferSizeInByte(TUint16 u16PdValueTableSize);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the buffer size in byte that is needed for the number of elements given by parameter
//!        "u16MeasurementTableSize".
//!
//! @param[in]    u16MeasurementTableSize    number of elements
//!
//! @return                                  buffer size in byte that is needed for the number of elements given by
//!                                          parameter "u16MeasurementTableSize"
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackTcGetMeasurementTableConfigMemoryBufferSizeInByte(TUint16 u16MeasurementTableSize);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function configures the buffers for the ISOAgLib-SE-intern tables for the process data values and the
//!        measurements. If you want to use your own buffers here, you have to call this function. Otherwise the
//!        ISOAgLib SE will use its own default buffers. Call this function only in state "E_ISO_STACK_STATE_CLOSED".
//!        Use the functions "u32IsoStackTcGetPdValueTableConfigMemoryBufferSizeInByte()" and
//!        "u32IsoStackTcGetMeasurementTableConfigMemoryBufferSizeInByte()" to determine the buffer sizes that you need.
//!        Only use those return values as buffer sizes. The maximal number of elements in the measurement table has to
//!        be less than or equal to the maximal number of elements in the PD value table. If you used your own buffers
//!        here and want to change to the default buffers after a restart of ISOAgLib SE, you have to explicitely "set
//!        the buffers to zero" (size has to be 0 and buffer pointer has to be NULL).
//!
//! @param[in]    eLocalCf                              local control function
//! @param[in]    cptMemoryBufferForPdValueTable        memory buffer for PD value table; this pointer is not stored by
//!                                                     ISOAgLib SE but the pointer to the buffer itself
//!                                                     ("cptMemoryBuffer->pvBuffer")
//! @param[in]    cptMemoryBufferForMeasurementTable    memory buffer for measurement table; this pointer is not stored
//!                                                     by ISOAgLib SE but the pointer to the buffer itself
//!                                                     ("cptMemoryBuffer->pvBuffer")
//!
//! @return                                             result of configuring (see definition of "EMemConfigResultTc")
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EMemConfigResultTc eIsoStackTcConfigPdValueTableAndMeasurementTable(
    ELocalCf eLocalCf,
    const TMemoryBuffer* cptMemoryBufferForPdValueTable,
    const TMemoryBuffer* cptMemoryBufferForMeasurementTable); // pointers must not be NULL

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function activates a TC client, more exactly diverse checks are done (see retvalue), the state of the TC
//!        client is set to "E_TC_CLIENT_STATE_ACTIVE", the TC capabilities are set and the connections for the TC and
//!        the data logger are activated.
//!
//! @pre The local control function needs to be activated using boIsoStackNwActivateLocalCf.
//!
//! @param[in]    eLocalCf                            local control function which is acting as TC client
//! @param[in]    cptTcClientCapabilities             TC client capabilities (we only store the pointer, not the data it
//!                                                   is pointing to, so the pointer has to be valid as long as the
//!                                                   stack is running)
//! @param[in]    cptTcClientCallbacks                TC client callbacks (we only store the pointer, not the data it is
//!                                                   pointing to, so the pointer has to be valid as long as the stack
//!                                                   is running)
//! @param[in]    cptPdTable                          process data table (we only store the pointer, not the data it is
//!                                                   pointing to, so the pointer has to be valid as long as the stack
//!                                                   is running)
//!
//! @retval       0                                   activation was successful
//! @retval       1                                   activation was not successful because of one of the following
//!                                                   reasons:
//!                                                   - the state of the stack was not "E_ISO_STACK_STATE_INITIALIZING"
//!                                                   - "eLocalCf" was not available (only the number of local control
//!                                                     functions "NUM_LOCAL_CF", that you defined in AppConfig.h, can
//!                                                     be used)
//!                                                   - the given local control function was not activated
//!                                                   - the TC client for that local control function was not in state
//!                                                     "E_TC_CLIENT_STATE_INACTIVE"
//!                                                   - "cptTcClientCapabilities" was "NULL"
//!                                                   - "cptTcClientCallbacks" was "NULL"
//!                                                   - "cptPdTable" was "NULL"
//!                                                   - the given local control function was not a working set master
//!                                                   - the TC client was not version 3
//!                                                   - one of the TC client callbacks was "NULL"
//!                                                   - the size of the PD table was 0 or greater than the configured
//!                                                     maximal size
//!                                                   - "cptPdTable->cptData" was "NULL"
//! @retval       OFFSET_FOR_ERROR_HANDLING..65535    activation was not successful because of one of the following
//!                                                   errors in the entry with index
//!                                                   "retval minus OFFSET_FOR_ERROR_HANDLING" in the PD table:
//!                                                   - "cptDet" was "NULL"
//!                                                   - "cptDpd" was "NULL"
//!                                                   - "u32ElementDdi" didn't match with
//!                                                     "cptDet->u16DeviceElementNumber" and "cptDpd->u16ProcessDataDdi"
//!                                                   - "u32ElementDdi" of this PD table entry was less than or equal to
//!                                                     "u32ElementDdi" of the PD table entry before this one, i.e. the
//!                                                     PD table was not sorted by "u32ElementDdi"
//!                                                   - the PD table entry was a member of the default set and one of
//!                                                     the following points was applicable (the trigger methods that
//!                                                     are mentioned in the following are set in member
//!                                                     "u8ProcessDataAvailableTriggerMethods" of "cptDpd"):
//!                                                     - no measurement was possible
//!                                                     - trigger method "time interval" was available but
//!                                                       "u32DefaultTimeInterval" was set to
//!                                                       "TIME_INTERVAL_NOT_ACTIVE"
//!                                                     - trigger method "time interval" was not available but
//!                                                       "u32DefaultTimeInterval" was not set to
//!                                                       "TIME_INTERVAL_NOT_ACTIVE"
//!                                                     - trigger method "distance interval" was available but
//!                                                       "u32DefaultDistanceInterval" was set to
//!                                                       "DISTANCE_INTERVAL_NOT_ACTIVE"
//!                                                     - trigger method "distance interval" was not available but
//!                                                       "u32DefaultDistanceInterval" was not set to
//!                                                       "DISTANCE_INTERVAL_NOT_ACTIVE"
//!                                                     - trigger method "on change" was available but
//!                                                       "u32DefaultOnChangeDelta" was set to
//!                                                       "ON_CHANGE_NOT_ACTIVE"
//!                                                     - trigger method "on change" was not available but
//!                                                       "u32DefaultOnChangeDelta" was not set to
//!                                                       "ON_CHANGE_NOT_ACTIVE"
//!                                                     - trigger method "threshold limits" was available but
//!                                                       "i32DefaultMinimum" was set to
//!                                                       "MINIMUM_NOT_ACTIVE" or
//!                                                       "i32DefaultMaximum" was set to
//!                                                       "MAXIMUM_NOT_ACTIVE"
//!                                                     - trigger method "threshold limits" was not available but
//!                                                       "i32DefaultMinimum" was not set to
//!                                                       "MINIMUM_NOT_ACTIVE" or
//!                                                       "i32DefaultMaximum" was not set to
//!                                                       "MAXIMUM_NOT_ACTIVE"
//!                                                   - the PD table entry was not a member of the default set and one
//!                                                     of the following points was applicable:
//!                                                     - "u32DefaultTimeInterval" was not set to
//!                                                       "TIME_INTERVAL_NOT_ACTIVE"
//!                                                     - "u32DefaultDistanceInterval" was not set to
//!                                                       "DISTANCE_INTERVAL_NOT_ACTIVE"
//!                                                     - "u32DefaultOnChangeDelta" was not set to
//!                                                       "ON_CHANGE_NOT_ACTIVE"
//!                                                     - "i32DefaultMinimum" was not set to
//!                                                       "MINIMUM_NOT_ACTIVE"
//!                                                     - "i32DefaultMaximum" was not set to
//!                                                       "MAXIMUM_NOT_ACTIVE"
//!                                                   - the PD table entry was settable and one of the following points
//!                                                     was applicable:
//!                                                     - "tSetPointCallbackTc" was "NULL"
//!                                                     - the PD table entry was a total and "tSetPointCallbackDl" was
//!                                                       "NULL"
//!                                                     - the PD table entry was not a total and "tSetPointCallbackDl"
//!                                                       was not "NULL"
//!                                                   - the PD table entry was not settable and one of the following
//!                                                     points was applicable:
//!                                                     - "tSetPointCallbackTc" was not "NULL"
//!                                                     - "tSetPointCallbackDl" was not "NULL"
//!                                                   - a measurement was possible for the PD table entry but the
//!                                                     measurement table was already full
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atTcClientInfo                 array with a "TTcClientInfo" for each local control function
//!
//! @date         03.08.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackTcActivateClient(
    ELocalCf eLocalCf,
    const TTcClientCapabilities *cptTcClientCapabilities,
    const TTcClientCallbacks *cptTcClientCallbacks,
    const TPdTable *cptPdTable);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function deactivates a TC client, more exactly it sets the state of the "TTcClientInfo" for the given
//!        local control function to "E_TC_CLIENT_STATE_INACTIVE" if the state of the stack is
//!        "E_ISO_STACK_STATE_CLOSING" and if the state of the client is not "E_TC_CLIENT_STATE_INACTIVE". If it is
//!        necessary, the function also calls "vTcConnectionDisconnect" for the two connections (TC and data logger).
//!
//! @pre The local control function needs to have an activated TC client.
//!
//! @param[in]    eLocalCf               local control function which is acting as TC client
//!
//! @retval       TRUE                   deactivation was successful
//! @retval       FALSE                  deactivation was not successful because the state of the stack was not
//!                                      "E_ISO_STACK_STATE_CLOSING" or "eLocalCf" was not available (only the number of
//!                                      local control functions "NUM_LOCAL_CF", that you defined in AppConfig.h, can be
//!                                      used) or the TC client for that local control function was in state
//!                                      "E_TC_CLIENT_STATE_INACTIVE"
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atTcClientInfo    array with a "TTcClientInfo" for each local control function
//!
//! @date         03.08.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackTcDeactivateClient(ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the further connecting to the current TC server after diverse checks (see @retval)
//!        have been done.
//!
//! @param[in]    eLocalCf                         local control function which is acting as TC client
//! @param[in]    eServerType                      type of server (TC or data logger)
//! @param[in]    cptDeviceDescriptorObjectPool    device descriptor object pool (we only store the pointer, not the
//!                                                data it is pointing to, so the pointer has to be valid as long as the
//!                                                stack is running)
//!
//! @retval       TRUE                             no error
//! @retval       FALSE                            error because of one of the following points:
//!                                                - the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
//!                                                - "eLocalCf" was not available (only the number of local control
//!                                                  functions "NUM_LOCAL_CF, that you defined in AppConfig.h, can be
//!                                                  used)
//!                                                - "eServerType" was not one of the values defined for enumeration
//!                                                  "EServerType"
//!                                                - the TC client for that local control function was not in state
//!                                                  "E_TC_CLIENT_STATE_ACTIVE"
//!                                                - "cptDeviceDescriptorObjectPool" was "NULL"
//!                                                - "cptDeviceDescriptorObjectPool->cpcpchDesignators" was "NULL"
//!                                                - "cptDeviceDescriptorObjectPool->cptDeviceObject" was "NULL"
//!                                                - "cptDeviceDescriptorObjectPool->cpcptDeviceElementObjects" was not
//!                                                  "NULL" and "u16NumberOfObjectsToFollow" of a device element object
//!                                                  was greater than
//!                                                  "MAX_NO_OF_OBJECTS_TO_FOLLOW_IN_DEVICE_ELEMENT_OBJECT"
//!                                                - the state of the TC connection for the given local control function
//!                                                  and the given server type was not
//!                                                  "E_TC_CONN_STATE_WAIT_FOR_DECISION"
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atTcClientInfo              array with a "TTcClientInfo" for each local control function
//!
//! @date         24.08.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackTcDoConnect(
    ELocalCf eLocalCf,
    EServerType eServerType,
    const TDeviceDescriptorObjectPool *cptDeviceDescriptorObjectPool);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function triggers the disconnecting from the current TC server and the checking for a new TC server
//!        after diverse checks (see @retval) have been done.
//!
//! @param[in]    eLocalCf               local control function which is acting as TC client
//! @param[in]    eServerType            type of server (TC or data logger)
//!
//! @retval       TRUE                   no error
//! @retval       FALSE                  error because of one of the following points:
//!                                      - the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
//!                                      - "eLocalCf" was not available (only the number of local control functions
//!                                        "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                      - "eServerType" was not one of the values defined for enumeration "EServerType"
//!                                      - the TC client for that local control function was not in state
//!                                        "E_TC_CLIENT_STATE_ACTIVE"
//!                                      - the state of the TC connection for the given local control function and the
//!                                        given server type was not "E_TC_CONN_STATE_WAIT_FOR_DECISION"
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atTcClientInfo    array with a "TTcClientInfo" for each local control function
//!
//! @date         24.08.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackTcDontConnect(ELocalCf eLocalCf, EServerType eServerType);

//----------------------------------------------------------------------------------------------------------------------
//! @brief  This function sets the current value of a certain process data (for TC and DL).
//!
//! @param[in]    eLocalCf               local control function which is acting as TC client
//! @param[in]    u16PdTableIndex        index of entry in process data table that shall be set with i32Value
//!                                      NOTE: Please take care to use the correct index!!!
//! @param[in]    i32Value               value
//!
//! @retval       TRUE                   no error
//! @retval       FALSE                  error because of one of the following points:
//!                                      - the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
//!                                      - "eLocalCf" was not available (only the number of local control functions
//!                                        "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                      - the TC client for that local control function was not in state
//!                                        "E_TC_CLIENT_STATE_ACTIVE"
//!                                      - "u16PdTableIndex" was greater than or equal to the size of the PD table for
//!                                        the given local control function and server type
//!                                        "E_SERVER_TYPE_TASK_CONTROLLER"
//!                                      - "u16PdTableIndex" was greater than or equal to the size of the PD table for
//!                                        the given local control function and server type
//!                                        "E_SERVER_TYPE_DATA_LOGGER"
//!
//! Static variables affected:\n
//!  -[in]        \b m_atTcClientInfo    array with a "TTcClientInfo" for each local control function
//!
//! @date         16.09.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackTcSetCurrentValueTcAndDl(ELocalCf eLocalCf, TUint16 u16PdTableIndex, TInt32 i32Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the current value of a certain process data (for TC).
//!
//! @param[in]    eLocalCf               local control function which is acting as TC client
//! @param[in]    u16PdTableIndex        index of entry in process data table that shall be set with i32Value
//!                                      NOTE: Please take care to use the correct index!!!
//! @param[in]    i32Value               value
//!
//! @retval       TRUE                   no error
//! @retval       FALSE                  error because of one of the following points:
//!                                      - the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
//!                                      - "eLocalCf" was not available (only the number of local control functions
//!                                        "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                      - the TC client for that local control function was not in state
//!                                        "E_TC_CLIENT_STATE_ACTIVE"
//!                                      - "u16PdTableIndex" was greater than or equal to the size of the PD table for
//!                                        the given local control function and server type
//!                                        "E_SERVER_TYPE_TASK_CONTROLLER"
//!
//! Static variables affected:\n
//!  -[in]        \b m_atTcClientInfo    array with a "TTcClientInfo" for each local control function
//!
//! @date         16.09.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackTcSetCurrentValueTc(ELocalCf eLocalCf, TUint16 u16PdTableIndex, TInt32 i32Value);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the current value of a certain process data (for DL).
//!
//! @param[in]    eLocalCf               local control function which is acting as TC client
//! @param[in]    u16PdTableIndex        index of entry in process data table that shall be set with i32Value
//!                                      NOTE: Please take care to use the correct index!!!
//! @param[in]    i32Value               value
//!
//! @retval       TRUE                   no error
//! @retval       FALSE                  error because of one of the following points:
//!                                      - the state of the stack was not "E_ISO_STACK_STATE_RUNNING"
//!                                      - "eLocalCf" was not available (only the number of local control functions
//!                                        "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used)
//!                                      - the TC client for that local control function was not in state
//!                                        "E_TC_CLIENT_STATE_ACTIVE"
//!                                      - "u16PdTableIndex" was greater than or equal to the size of the PD table for
//!                                        the given local control function and server type
//!                                        "E_SERVER_TYPE_DATA_LOGGER"
//!
//! Static variables affected:\n
//!  -[in]        \b m_atTcClientInfo    array with a "TTcClientInfo" for each local control function
//!
//! @date         16.09.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackTcSetCurrentValueDl(ELocalCf eLocalCf, TUint16 u16PdTableIndex, TInt32 i32Value);

#endif
