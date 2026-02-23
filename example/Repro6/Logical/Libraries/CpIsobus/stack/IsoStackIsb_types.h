//**********************************************************************************************************************
//! @file        IsoStackIsb_types.h
//! @brief       API for accessing ISB (ISOBUS Shortcut Button) functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        09.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_ISB_TYPES_H
#define ISOAGLIBS_ISO_STACK_ISB_TYPES_H

// INCLUDES=============================================================================================================

#include <HalTypedef.h>

// GLOBAL DEFINES=======================================================================================================

// GLOBAL TYPE DEFINITIONS==============================================================================================

//! General information regarding the following structure with callbacks:
//! When an ISB server does not send the "all implements stop operations switch state" message for more than 3 seconds,
//! we handle that as a shut-down of the ISB server and in that case we call callback "fpvNoOfIsbServersChanged" and
//! also callback "fpvStopAllImplementOperations". This callback is called once with parameter
//! "boStopAllImplementOperations" set to TRUE and then again with parameter "boStopAllImplementOperations" set to
//! FALSE.
//! It's up to the application developer how that is handled. Normally a good handling is to go to some safe state and
//! to display an alarm mask.
typedef struct
{
    //! This callback tells the application if an ISB (ISOBUS Shortcut Button) is activated/pressed. The function is
    //! only called on change.
    //! More exactly this callback is called with parameter "boStopAllImplementOperations" set to TRUE when the "all
    //! implements stop operations switch state" message indicates "stop" or "error" and when an "all implements stop
    //! operations switch state" message indicating "stop" has been missed (ISOAgLib SE can detect that via the number
    //! of transitions from "permit" to "stop" reported in the message) and also on shut-down of an ISB server.
    TVoid(*fpvStopAllImplementOperations)(TBoolean boStopAllImplementOperations);

    //! This callback tells the application the number of ISB servers (parameter "u8NoOfIsbServers") up to the maximal
    //! number we support and the callback also tells the application if there are more ISB servers on the CAN bus than
    //! we support (parameter "boTooManyIsbServers"). The function is only called on change.
    TVoid(*fpvNoOfIsbServersChanged)(TUint8 u8NoOfIsbServers, TBoolean boTooManyIsbServers);
} TIsbCallbacks;

#endif
