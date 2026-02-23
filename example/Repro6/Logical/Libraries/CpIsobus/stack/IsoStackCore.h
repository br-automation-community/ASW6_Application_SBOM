//**********************************************************************************************************************
//! @file        IsoStackCore.h
//! @brief       API for accessing general library functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        01.12.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_CORE_H
#define ISOAGLIBS_ISO_STACK_CORE_H

// INCLUDES=============================================================================================================

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
//! @brief This function returns the state of the stack.
//!
//! @return    state of stack
//!
//! Static variables affected:\n
//!  -[in]     \b m_eIsoStackState    state of ISOAgLibS
//!
//! @date      01.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EIsoStackState eIsoStackCoreGetState(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the time (in ms) since the initializing of the stack.
//!
//! @return    time in ms since initializing of stack or "TIME_NEVER" if stack has not been initialized yet
//!
//! @date      01.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackCoreGetTime(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function initializes the stack (sets the state of the stack to "E_ISO_STACK_STATE_INITIALIZING", sets
//!        hardware as well as safety callbacks and initializes all modules).
//!
//! @param[in]    u16VersionMajor         major version of ISOAgLibSE API; you MUST use "ISOAGLIBSE_VERSION_MAJOR"
//!                                       (defined in IsoStackCore_types.h) as value!!!
//! @param[in]    u16VersionMinor         minor version of ISOAgLibSE API; you MUST use "ISOAGLIBSE_VERSION_MINOR"
//!                                       (defined in IsoStackCore_types.h) as value!!!
//! @param[in]    u16VersionPatch         patch version of ISOAgLibSE API; you MUST use "ISOAGLIBSE_VERSION_PATCH"
//!                                       (defined in IsoStackCore_types.h) as value!!!
//! @param[in]    u16VersionExtra         extra version of ISOAgLibSE API; you MUST use "ISOAGLIBSE_VERSION_EXTRA"
//!                                       (defined in IsoStackCore_types.h) as value!!!
//! @param[in]    cptHardwareCallbacks    hardware callbacks (we don't store the address of this pointer but the
//!                                       addresses of its function pointer members)
//! @param[in]    cptSafetyCallbacks      safety callbacks (we don't store the address of this pointer but the addresses
//!                                       of its function pointer members)
//!
//! @retval       TRUE                    no error
//! @retval       FALSE                   error because of one of the following reasons:
//!                                       - the license protection blocked
//!                                       - the API version, that you passed as parameter, doesn't match the library
//!                                         version (please copy the "includes" passed to the delivered IsoAgLibS
//!                                         library in your project)
//!                                       - the state of the stack was not appropriate
//!                                       - "cptHardwareCallbacks" or "cptSafetyCallbacks" was NULL or one of the
//!                                         callbacks defined in those structures was NULL
//!                                       - one or more defines in "AppConfig.h" are not valid
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_eIsoStackState     state of ISOAgLibS
//!
//! @date         01.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackCoreInit(
    TUint16 u16VersionMajor,
    TUint16 u16VersionMinor,
    TUint16 u16VersionPatch,
    TUint16 u16VersionExtra,
    const THardwareCallbacks *cptHardwareCallbacks,
    const TSafetyCallbacks *cptSafetyCallbacks);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the control function functionalities, enables the CAN, sets "m_u32TimeOfLastRunCall"
//!        initially and sets the state of the stack to "E_ISO_STACK_STATE_RUNNING".
//!
//! @retval       TRUE                         no error
//! @retval       FALSE                        error because state of stack is not appropriate
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_eIsoStackState          state of ISOAgLibS\n
//!  -[out]       \b m_u32TimeOfLastRunCall    time of last run call (here initially set)
//!
//! @date         01.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackCoreInitDone(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function checks if the state of the stack is appropriate ("E_ISO_STACK_STATE_RUNNING"), if a time
//!        overflow impends and if it was called too late. If the checks have been passed, this function calls the
//!        "run"-functions of all modules.
//!
//! @retval       TRUE                         no error
//! @retval       FALSE                        error because state of stack is not appropriate
//!
//! Static variables affected:\n
//!  -[in]        \b m_eIsoStackState          state of ISOAgLibS\n
//!  -[in,out]    \b m_u32TimeOfLastRunCall    time of last run call
//!
//! @date         01.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackCoreRun(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function disables the CAN and sets the state of the stack to "E_ISO_STACK_STATE_CLOSING".
//!
//! @retval       TRUE                   no error
//! @retval       FALSE                  error because state of stack is not appropriate
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_eIsoStackState    state of ISOAgLibS
//!
//! @date         01.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackCoreClose(TVoid);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the state of the stack to "E_ISO_STACK_STATE_CLOSED".
//!
//! @retval       TRUE                   no error
//! @retval       FALSE                  error because state of stack is not appropriate
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_eIsoStackState    state of ISOAgLibS
//!
//! @date         01.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackCoreCloseDone(TVoid);

#endif
