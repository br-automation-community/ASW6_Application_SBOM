//**********************************************************************************************************************
//! @file        IsoStackTc_types.h
//! @brief       API for accessing task controller functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        03.08.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_TC_TYPES_H
#define ISOAGLIBS_ISO_STACK_TC_TYPES_H

// INCLUDES=============================================================================================================

#include "IsoStackNw_types.h"

// GLOBAL DEFINES=======================================================================================================

#define TC_NULL_OBJECT_ID 0xFFFFU

#define DEVICE_STRUCTURE_LABEL_SIZE    7U
#define DEVICE_LOCALIZATION_LABEL_SIZE 7U

#define BITMASK_PD_PROPERTIES_MEMBER_OF_DEFAULT_SET 0x01U //!< see ISO11783-10 A.4 Definition of DeviceProcessDataObject
#define BITMASK_PD_PROPERTIES_SETTABLE              0x02U //!< see ISO11783-10 A.4 Definition of DeviceProcessDataObject

#define BITMASK_PD_TRIGGER_METHOD_TIME_INTERVAL     0x01U //!< see ISO11783-10 A.4 Definition of DeviceProcessDataObject
#define BITMASK_PD_TRIGGER_METHOD_DISTANCE_INTERVAL 0x02U //!< see ISO11783-10 A.4 Definition of DeviceProcessDataObject
#define BITMASK_PD_TRIGGER_METHOD_THRESHOLD_LIMITS  0x04U //!< see ISO11783-10 A.4 Definition of DeviceProcessDataObject
#define BITMASK_PD_TRIGGER_METHOD_ON_CHANGE         0x08U //!< see ISO11783-10 A.4 Definition of DeviceProcessDataObject
#define BITMASK_PD_TRIGGER_METHOD_TOTAL             0x10U //!< see ISO11783-10 A.4 Definition of DeviceProcessDataObject
#define BITMASK_MEASUREMENT_POSSIBLE                0x0BU //!< see ISO11783-10 A.4 Definition of DeviceProcessDataObject

#define TIME_INTERVAL_NOT_ACTIVE     0U
#define DISTANCE_INTERVAL_NOT_ACTIVE 0U
#define ON_CHANGE_NOT_ACTIVE         0U
#define MINIMUM_NOT_ACTIVE  2147483647L //!< 2^31 - 1
#define MAXIMUM_NOT_ACTIVE -2147483647L //!< standard specifies (-2^31 + 1) instead of (-2^31)

#define OFFSET_FOR_ERROR_HANDLING 1000U //!< needed for interpretation of return value of u16IsoStackTcActivateClient()

// GLOBAL TYPE DEFINITIONS==============================================================================================

//! The following information is sent in the Version message (see ISO11783-10 B.5.3 Version message).
typedef struct
{
    TUint8 u8Version; //!< ISO11783 version of TC client

    TBoolean boHasTcBas; //!< indicates if TC client supports TC Basic functionality
    TBoolean boHasTcGeo; //!< indicates if TC client supports TC Geo functionality
    TBoolean boHasTcSc;  //!< indicates if TC client supports TC Section Control functionality

    TUint8 u8NoOfBooms;    //!< number of booms the TC client is capable to control
    TUint8 u8NoOfSections; //!< number of sections (total number across all booms) the TC client is capable to control
    TUint8 u8NoOfBins;     //!< number of control channels the TC client is capable to control
} TTcClientCapabilities;

//! The following information is sent in the Version message (see ISO11783-10 B.5.3 Version message).
typedef struct
{
    TUint8 u8Version; //!< ISO11783 version of TC server

    TBoolean boHasTcBas;           //!< indicates if TC server supports TC Basic functionality
    TBoolean boHasTcGeoWithoutPbc; //!< indicates if TC server supports TC Geo functionality w/o position-based control
    TBoolean boHasTcGeoWithPbc;    //!< indicates if TC server supports TC Geo functionality with position-based control
    TBoolean boHasPeerControl;     //!< indicates if TC server supports Peer Control functionality
    TBoolean boHasTcSc;            //!< indicates if TC server supports TC Section Control functionality

    TUint8 u8NoOfBooms;    //!< maximum number of booms the TC server supports
    TUint8 u8NoOfSections; //!< maximum number of sections (total number across all booms) the TC server supports
    TUint8 u8NoOfBins;     //!< maximum number of control channels the TC server supports
} TTcServerCapabilities;

typedef enum
{
    E_SERVER_TYPE_TASK_CONTROLLER = 0,
    E_SERVER_TYPE_DATA_LOGGER     = 1,
    E_SERVER_TYPE_LAST            = E_SERVER_TYPE_DATA_LOGGER
} EServerType;

//! You can find the definition of the different Device Element types here: ISO11783-10 A.3 Definition of
//! DeviceElementObject.
typedef enum
{
    E_DEVICE_ELEMENT_TYPE_DEVICE               = 1,
    E_DEVICE_ELEMENT_TYPE_FUNCTION             = 2,
    E_DEVICE_ELEMENT_TYPE_BIN                  = 3,
    E_DEVICE_ELEMENT_TYPE_SECTION              = 4,
    E_DEVICE_ELEMENT_TYPE_UNIT                 = 5,
    E_DEVICE_ELEMENT_TYPE_CONNECTOR            = 6,
    E_DEVICE_ELEMENT_TYPE_NAVIGATION_REFERENCE = 7
} EDeviceElementType;

typedef struct
{
    //------------------------------------------------------------------------------------------------------------------
    //! @brief When a TC (or data logger) is available, we use this callback to ask the application if we shall connect
    //!        to that server.
    //!
    //! @param[in]    eLocalCf                   local control function which is acting as TC client
    //! @param[in]    eServerType                type of server (task controller or data logger)
    //! @param[in]    cptTcServerCapabilities    capabilities of server
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvConnectionRequest)(
        ELocalCf eLocalCf,
        EServerType eServerType,
        const TTcServerCapabilities *cptTcServerCapabilities);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when we disconnect from the TC server we were connected to.
    //!
    //! @param[in]    eLocalCf       local control function which is acting as TC client
    //! @param[in]    eServerType    type of server (task controller or data logger)
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvDisconnectedFromServer)(ELocalCf eLocalCf, EServerType eServerType);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a task is started or when the pool upload is successfully finished and a
    //!        task has already been started.
    //!
    //! @param[in]    eLocalCf       local control function which is acting as TC client
    //! @param[in]    eServerType    type of server (task controller or data logger)
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvTaskStarted)(ELocalCf eLocalCf, EServerType eServerType);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a task is stopped or when we disconnect from the TC server and a task is
    //!        still running.
    //!
    //! @param[in]    eLocalCf       local control function which is acting as TC client
    //! @param[in]    eServerType    type of server (task controller or data logger)
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvTaskStopped)(ELocalCf eLocalCf, EServerType eServerType);
} TTcClientCallbacks;

//! You can find the definition of the Device object here: ISO11783-10 A.2 Definition of DeviceObject.
//! Object ID is always 0 for the device object.
typedef struct
{
    TUint16 u16DeviceDesignatorIndex;      //!< index in array "cpcpchDesignators" of struct "TDeviceDescriptorObjectPool"
    TUint16 u16DeviceSoftwareVersionIndex; //!< index in array "cpcpchDesignators" of struct "TDeviceDescriptorObjectPool"
    TUint16 u16DeviceSerialNumberIndex;    //!< index in array "cpcpchDesignators" of struct "TDeviceDescriptorObjectPool"
    TUint8 au8DeviceStructureLabel[DEVICE_STRUCTURE_LABEL_SIZE];
} TDeviceObject;

//! You can find the definition of the Device Element object here: ISO11783-10 A.3 Definition of DeviceElementObject.
typedef struct
{
    TUint16 u16ObjectId; //!< 1..65534
    EDeviceElementType eDeviceElementType;
    TUint16 u16DeviceElementDesignatorIndex; //!< index in array "cpcpchDesignators" of struct "TDeviceDescriptorObjectPool"
    TUint16 u16DeviceElementNumber;
    TUint16 u16ParentObjectId;
    TUint16 u16NumberOfObjectsToFollow; //!< number of child objects
    const TUint16 *cpu16ObjectIds;      //!< child objects
} TDeviceElementObject;

//! You can find the definition of the Device Process Data object here: ISO11783-10 A.4 Definition of
//! DeviceProcessDataObject.
typedef struct
{
    TUint16 u16ObjectId; //!< 1..65534
    TUint16 u16ProcessDataDdi;
    TUint8 u8ProcessDataProperties;              //!< use the defines BITMASK_PD_PROPERTIES_...     and bitwise OR
    TUint8 u8ProcessDataAvailableTriggerMethods; //!< use the defines BITMASK_PD_TRIGGER_METHOD_... and bitwise OR
    TUint16 u16ProcessDataDesignatorIndex;       //!< index in array "cpcpchDesignators" of struct "TDeviceDescriptorObjectPool"
    TUint16 u16DeviceValuePresentationObjectId;  //!< use "TC_NULL_OBJECT_ID" for "no device value presentation object"
} TDeviceProcessDataObject;

//! You can find the definition of the Device Property object here: ISO11783-10 A.5 Definition of DevicePropertyObject.
typedef struct
{
    TUint16 u16ObjectId; //!< 1..65534
    TUint16 u16PropertyDdi;
    TInt32 i32PropertyValue;
    TUint16 u16PropertyDesignatorIndex;         //!< index in array "cpcpchDesignators" of struct "TDeviceDescriptorObjectPool"
    TUint16 u16DeviceValuePresentationObjectId; //!< use "TC_NULL_OBJECT_ID" for "no device value presentation object"
} TDevicePropertyObject;

//! You can find the definition of the Device Value Presentation object here: ISO11783-10 A.6 Definition of
//! DeviceValuePresentationObject.
typedef struct
{
    TUint16 u16ObjectId;            //!< 1..65534
    TInt32 i32Offset;               //!< offset to be applied to the value for presentation
    TFloat32 f32Scale;              //!< scale to be applied to the value for presentation
    TUint8 u8NumberOfDecimals;      //!< number of decimals to display after the decimal point
    TUint16 u16UnitDesignatorIndex; //!< index in array "cpcpchDesignators" of struct "TDeviceDescriptorObjectPool"
} TDeviceValuePresentationObject;

typedef struct
{
    const TChar * const *cpcpchDesignators; //!< array of (null-terminated) strings (max. length of each string is 32)
    const TDeviceObject *cptDeviceObject;
    const TDeviceElementObject * const *cpcptDeviceElementObjects;                     //!< The last element has to be NULL to identify the end of the array.
    const TDeviceProcessDataObject * const *cpcptDeviceProcessDataObjects;             //!< The last element has to be NULL to identify the end of the array.
    const TDevicePropertyObject * const *cpcptDevicePropertyObjects;                   //!< The last element has to be NULL to identify the end of the array.
    const TDeviceValuePresentationObject * const *cpcptDeviceValuePresentationObjects; //!< The last element has to be NULL to identify the end of the array.
} TDeviceDescriptorObjectPool;

//----------------------------------------------------------------------------------------------------------------------
//! @brief This callback tells the application that a set point was received from the TC. It is also called (with value
//!        0) for all task totals (settable totals) when a task is started.
//!
//! @param[in]    eLocalCf            local control function which is acting as TC client
//! @param[in]    eServerType         type of server (task controller or data logger)
//! @param[in]    u16PdTableIndex     index in process data table (see definition of struct "TPdTable")
//! @param[in]    i32SetPointValue    value of setpoint
//----------------------------------------------------------------------------------------------------------------------
typedef TVoid(*TTcClientSetPointCallback)(
    ELocalCf eLocalCf,
    EServerType eServerType,
    TUint16 u16PdTableIndex,
    TInt32 i32SetPointValue);

//! Struct with process data object and definition of setpoint callbacks, parameters for default data logging ...
//! We need different callbacks for TC and data logger because we can connect to both at the same time. Availability
//! depends on member "u8ProcessDataProperties" (bit "BITMASK_PD_PROPERTIES_SETTABLE") of this process data object.
//! The values of the five members "u32DefaultTimeInterval", "u32DefaultDistanceInterval", "u32DefaultOnChangeDelta",
//! "i32DefaultMinimum" and "i32DefaultMaximum" apply for default data logging. Availability depends on members
//! "u8ProcessDataProperties" (bit "BITMASK_PD_PROPERTIES_MEMBER_OF_DEFAULT_SET") and
//! "u8ProcessDataAvailableTriggerMethods" of this process data object. You can also use the defines
//! "..._NOT_ACTIVE" (see above).
typedef struct
{
    TUint32 u32ElementDdi; //!< "u16DeviceElementNumber of parent" << 16 | DDI
    TTcClientSetPointCallback tSetPointCallbackTc;
    TTcClientSetPointCallback tSetPointCallbackDl;
    const TDeviceElementObject *cptDet;     //!< parent object
    const TDeviceProcessDataObject *cptDpd; //!< object itself
    TUint32 u32DefaultTimeInterval;     //!< 0 to   60000, time     interval for data log in  ms, 0 stops measurement, 100 ms is the minimum time interval
    TUint32 u32DefaultDistanceInterval; //!< 0 to 1000000, distance interval for data log in  mm, 0 stops measurement
    TUint32 u32DefaultOnChangeDelta;    //!< (-2^31+1) to (2^31-1), change  threshold to activate the data log, 0 stops measurement, 1 logs each change
    TInt32 i32DefaultMinimum;           //!< (-2^31+1) to (2^31-1), minimum threshold to activate the data log, threshold limit value is included in the value range to log, (2^31-1)  stops measurement
    TInt32 i32DefaultMaximum;           //!< (-2^31+1) to (2^31-1), maximum threshold to activate the data log, threshold limit value is included in the value range to log, (-2^31+1) stops measurement
} TPdTableEntry;

//! Process data table (with process data objects and for each one: definition of setpoint callbacks, parameters for
//! default data logging ...)
typedef struct
{
    TUint16 u16Size;
    const TPdTableEntry *cptData;
} TPdTable;

//! Enum for return values of memory configuration functions
typedef enum
{
    E_MEM_CONF_RESULT_TC_CONFIG_SUCCESSFUL,                     //!< configuring was successful
    E_MEM_CONF_RESULT_TC_LOCAL_CF_NOT_AVAILABLE,                //!< "eLocalCf" was not available (only the number of
                                                                //!< local control functions "NUM_LOCAL_CF" that are
                                                                //!< defined in AppConfig.h can be used)
    E_MEM_CONF_RESULT_TC_STACK_STATE_NOT_CLOSED,                //!< the state of the stack was not
                                                                //!< "E_ISO_STACK_STATE_CLOSED"
    E_MEM_CONF_RESULT_TC_PD_MEM_BUFFER_STRUCT_POINTER_NULL,     //!< "cptMemoryBufferForPdValueTable" (pointer to memory
                                                                //!< buffer structure for PD value table) was NULL
    E_MEM_CONF_RESULT_TC_ME_MEM_BUFFER_STRUCT_POINTER_NULL,     //!< "cptMemoryBufferForMeasurementTable" (pointer to
                                                                //!< memory buffer structure for measurement table) was
                                                                //!< NULL
    E_MEM_CONF_RESULT_TC_PD_BUF_NULL_AND_SIZE_NOT_ZERO,         //!< "cptMemoryBufferForPdValueTable->pvBuffer" was NULL
                                                                //!< and "cptMemoryBufferForPdValueTable->u32ByteSize"
                                                                //!< was not 0
    E_MEM_CONF_RESULT_TC_ME_BUF_NULL_AND_SIZE_NOT_ZERO,         //!< "cptMemoryBufferForMeasurementTable->pvBuffer" was
                                                                //!< NULL and
                                                                //!< "cptMemoryBufferForMeasurementTable->u32ByteSize"
                                                                //!< was not 0
    E_MEM_CONF_RESULT_TC_PD_BUF_NOT_NULL_AND_SIZE_NOT_SUITABLE, //!< "cptMemoryBufferForPdValueTable->pvBuffer" was not
                                                                //!< NULL and
                                                                //!< "cptMemoryBufferForPdValueTable->u32ByteSize" was
                                                                //!< not suitable
    E_MEM_CONF_RESULT_TC_ME_BUF_NOT_NULL_AND_SIZE_NOT_SUITABLE, //!< "cptMemoryBufferForMeasurementTable->pvBuffer" was
                                                                //!< not NULL and
                                                                //!< "cptMemoryBufferForMeasurementTable->u32ByteSize"
                                                                //!< was not suitable
    E_MEM_CONF_RESULT_TC_PD_SIZE_ZERO_AND_ME_SIZE_NOT_ZERO,     //!< "cptMemoryBufferForPdValueTable->u32ByteSize" was 0
                                                                //!< and
                                                                //!< "cptMemoryBufferForMeasurementTable->u32ByteSize"
                                                                //!< was not 0
    E_MEM_CONF_RESULT_TC_PD_SIZE_NOT_ZERO_AND_ME_SIZE_ZERO,     //!< "cptMemoryBufferForPdValueTable->u32ByteSize" was
                                                                //!< not 0 and
                                                                //!< "cptMemoryBufferForMeasurementTable->u32ByteSize"
                                                                //!< was 0
    E_MEM_CONF_RESULT_TC_ME_TAB_GREATER_THAN_PD_TAB             //!< maximal number of elements in measurement table was
                                                                //!< greater than maximal number of elements in PD value
                                                                //!< table
} EMemConfigResultTc;

#endif
