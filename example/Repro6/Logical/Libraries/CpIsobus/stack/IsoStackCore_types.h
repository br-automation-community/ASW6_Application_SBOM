//**********************************************************************************************************************
//! @file        IsoStackCore_types.h
//! @brief       API for accessing general library functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        02.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_CORE_TYPES_H
#define ISOAGLIBS_ISO_STACK_CORE_TYPES_H

// INCLUDES=============================================================================================================

#include <HalTypedef.h>

// GLOBAL DEFINES=======================================================================================================

#define ISOAGLIBSE_VERSION_MAJOR 1U
#define ISOAGLIBSE_VERSION_MINOR 6U
#define ISOAGLIBSE_VERSION_PATCH 0U
#define ISOAGLIBSE_VERSION_EXTRA 0U

// GLOBAL TYPE DEFINITIONS==============================================================================================

//! Enum for safety notification callback
typedef enum
{
    //! The library can only operate for one more day before it would get an overflow/wraparound on the 32bit time. No
    //! immediate action is required, but the application needs to make sure that it is not running longer than 1 day.
    E_SAFETY_NOTIFICATION_ONE_DAY_TILL_TIME_MAXIMUM,

    //! The Core's run() function was triggered too late to allow a reliable timing. This is not critical and operation
    //! could continue, yet this should not happen during operation. Either the CPU is overloaded or the application
    //! program has some fault and hence delayed execution of the library.
    E_SAFETY_NOTIFICATION_RUN_CALLED_TOO_LATE,

    //! The application delivered a CAN frame with DLC greater than 8. This indicates a CAN controller problem.
    //! ISOAgLibS can safely continue operation, but the message is discarded.
    E_SAFETY_NOTIFICATION_CAN_FRAME_WITH_DLC_GREATER_THAN_EIGHT,

    //! The CAN-Send-Buffer was already full, so one message could not be sent. This indicates a problem on the ISOBUS.
    //! Correct communication can not be ensured, so it's proposed to close the library (from main-loop, not callback).
    E_SAFETY_NOTIFICATION_FULL_SEND_BUFFER,

    //! The called API function is only allowed in the state ::E_ISO_STACK_STATE_INITIALIZING and did not execute.
    //! ISOAgLibS can safely continue operation, but as the API function call was not executed it will probably not
    //! meet the Application's expectations.
    E_SAFETY_NOTIFICATION_INITIALIZING_STATE_REQUIRED,

    //! The called API function is only allowed in the state ::E_ISO_STACK_STATE_RUNNING and did not execute.
    //! ISOAgLibS can safely continue operation, but as the API function call was not executed it will probably not
    //! meet the Application's expectations.
    E_SAFETY_NOTIFICATION_RUNNING_STATE_REQUIRED,

    //! The called API function is only allowed in the state ::E_ISO_STACK_STATE_RUNNING or ::E_ISO_STACK_STATE_CLOSING
    //! and did not execute. ISOAgLibS can safely continue operation, but as the API function call was not executed
    //! it will probably not meet the Application's expectations.
    E_SAFETY_NOTIFICATION_RUNNING_OR_CLOSING_STATE_REQUIRED,

    //! A NULL-pointer was passed as parameter to an API function and the failure could not be indicated by the
    //! return-value. ISOAgLibS can safely continue operation, but as the API function call was not executed
    //! it will probably not meet the Application's expectations and the return value of the called API-function
    //! does not provide a proper value.
    E_SAFETY_NOTIFICATION_NULL_POINTER_AS_PARAMETER,

    //! An API function was called for a local control function that is not available. Only the number of local control
    //! functions "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used. ISOAgLibS can safely continue operation,
    //! but as the API function call was not executed it will probably not meet the Application's expectations and the
    //! return value of the called API-function does not provide a proper value.
    E_SAFETY_NOTIFICATION_LCF_UNAVAILABLE,

    //! An API function was called for a local control function that is not active but it has to be active. ISOAgLibS
    //! can safely continue operation, but as the API function call was not executed it will probably not meet the
    //! Application's expectations and the return value of the called API-function does not provide a proper value.
    //! So for a proper functioning you have to activate the local control function before you call this API function.
    E_SAFETY_NOTIFICATION_LCF_INACTIVE
} ESafetyNotification;

//! State of ISOAgLibS
typedef enum
{
    E_ISO_STACK_STATE_CLOSED,       //!< ISOAgLibS was CLOSED or is still in initial state
    E_ISO_STACK_STATE_INITIALIZING, //!< ISOAgLibS is initializing
    E_ISO_STACK_STATE_RUNNING,      //!< ISOAgLibS is running, i.e. the run()-function must be triggered cyclically
    E_ISO_STACK_STATE_CLOSING       //!< ISOAgLibS is shutting down
} EIsoStackState;

//! Enum for return values of memory configuration functions
typedef enum
{
    E_MEM_CONFIG_RESULT_CONFIG_SUCCESSFUL,                    //!< configuring was successful
    E_MEM_CONFIG_RESULT_LOCAL_CF_NOT_AVAILABLE,               //!< "eLocalCf" was not available (only the number of
                                                              //!< local control functions "NUM_LOCAL_CF" that are
                                                              //!< defined in AppConfig.h can be used)
    E_MEM_CONFIG_RESULT_STACK_STATE_NOT_CLOSED,               //!< the state of the stack was not
                                                              //!< "E_ISO_STACK_STATE_CLOSED"
    E_MEM_CONFIG_RESULT_MEM_BUFFER_STRUCT_POINTER_NULL,       //!< "cptMemoryBuffer" (pointer to memory buffer
                                                              //!< structure) was NULL
    E_MEM_CONFIG_RESULT_BUFFER_NULL_AND_SIZE_NOT_ZERO,        //!< "cptMemoryBuffer->pvBuffer" was NULL and
                                                              //!< "cptMemoryBuffer->u32ByteSize" was not 0
    E_MEM_CONFIG_RESULT_BUFFER_NOT_NULL_AND_SIZE_NOT_SUITABLE //!< "cptMemoryBuffer->pvBuffer" was not NULL and
                                                              //!< "cptMemoryBuffer->u32ByteSize" was not suitable
} EMemConfigResult;

//! This structure is modelling one complete single CAN frame as
//! needed by the Interface "Data Link Layer <-> CAN-Transceiver"
typedef struct
{
    TBoolean  boXtd;              //!< :=FALSE  11bit-Identifier, :=TRUE  29bit-Identifier
    TUint32   u32Id;              //!< Identifier
    TUint8    u8Dlc;              //!< Datalengthcode
    TUint8    au8Data[8];         //!< Databuffer
} TCanFrame;

typedef struct
{
    TUint32 u32ByteSize;
    TVoid *pvBuffer;
} TMemoryBuffer;

//! This structure is a read-only "TUint8" data buffer.
typedef struct
{
    TUint32 u32Size;        //!< number of bytes in the buffer
    const TUint8 *cpu8Data; //!< buffer data
} TCU8Buffer;

//! This structure contains all the hardware callbacks. See \ref IntegrationHardware for further details.
typedef struct
{
    //! gets the time from the hardware, see \ref TIME for further details
    TUint32(*fpu32HardwareGetTime)(TVoid);

    //! enables the CAN bus, see \ref ABLE for further details
    TVoid(*fpvHardwareCanEnable)(TVoid);

    //! disables the CAN bus, see \ref ABLE for further details
    TVoid(*fpvHardwareCanDisable)(TVoid);

    //! gets a CAN frame if there is a new one, see \ref CANRX for further details
    TBoolean(*fpboHardwareCanGetFrame)(TCanFrame *ptCanFrame);

    //! sends a CAN frame if possible, see \ref CANTX for further details
    TBoolean(*fpboHardwareCanSendFrame)(const TCanFrame *cptCanFrame);

    //! returns the number of the CAN send slots that are free or -1 if no hardware buffer is available, see
    //! \ref CANFILL for further details
    TInt8(*fpi8HardwareCanGetFreeSendSlots)(TVoid);
} THardwareCallbacks;

//! This structure contains the safety callbacks. See \ref IntegrationSafety for further details.
typedef struct
{
    //! general safety notification, see \ref SafetyNotify for further details
    TVoid(*fpvSafetyNotification)(ESafetyNotification eSafetyNotification);

    //! assertion violation, see \ref SafetyAssert for further details
    TVoid(*fpvSafetyAssertionViolation)(const TChar *cpchAssertion, const TChar *cpchFile, TUint32 u32Line);
} TSafetyCallbacks;

#endif
