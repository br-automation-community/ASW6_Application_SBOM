//**********************************************************************************************************************
//! @file        IsoStackIsb.h
//! @brief       API for accessing ISB (ISOBUS Shortcut Button) functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        09.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_ISB_H
#define ISOAGLIBS_ISO_STACK_ISB_H

// INCLUDES=============================================================================================================

#include "IsoStackIsb_types.h"

// "ISOAGLIBSE_API" can be set to "__declspec(dllexport)" to build the Windows DLL version of ISOAgLib SE and to
// "__declspec(dllimport)" to use the Windows DLL version of ISOAgLib SE (this setting can be done e.g. in file
// "HalTypedef.h" or in project configuration).
#ifndef ISOAGLIBSE_API
#define ISOAGLIBSE_API
#endif

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION DECLARATIONS=========================================================================================

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function activates the ISB (ISOBUS Shortcut Button) module, i.e. it sets the ISB callbacks.
//!        The control function functionalities for the ISB client in the control function functionalities message are
//!        set automatically by the ISOAgLib SE when you have activated the ISB client.
//!
//! @param[in]    cptIsbCallbacks       ISB callbacks ("fpvStopAllImplementOperations" and "fpvNoOfIsbServersChanged")
//!
//! @retval       TRUE                  The activation was successful.
//! @retval       FALSE                 The activation was not successful because the state of stack was not
//!                                     "E_ISO_STACK_STATE_INITIALIZING" or "cptIsbCallbacks",
//!                                     "cptIsbCallbacks->fpvStopAllImplementOperations" or
//!                                     "cptIsbCallbacks->fpvNoOfIsbServersChanged" was NULL.
//!
//! Static variables affected:\n
//!  -[out]       \b m_tIsbCallbacks    ISB callbacks
//!
//! @date         09.07.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackIsbActivate(const TIsbCallbacks *cptIsbCallbacks);

#endif
