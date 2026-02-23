#ifndef _HAL_CAN_H
#define _HAL_CAN_H

#include <IsoStackCore_types.h>

TVoid vPlatformCanTestSetDlcToNine(TVoid);
TVoid vPlatformCanTestEnableSending(TVoid);
TVoid vPlatformCanTestDisableSending(TVoid);
TVoid vPlatformSetCanInterface(const char* canInterface);

TVoid vPlatformCanHardwareCanEnable(TVoid);
TVoid vPlatformCanHardwareCanDisable(TVoid);

//! @return TRUE: moved frame from controller queue to *ptCanFrame
//!         FALSE: no frame pending, nothing moved to *ptCanFrame
TBoolean boPlatformCanHardwareCanGetFrame(TCanFrame *ptCanFrame);

TBoolean boPlatformCanHardwareCanSendFrame(const TCanFrame *cptCanFrame);

//! Returning -1 means that the queue can't be queried,
//! but it definitely has enough space to put messages in!
TInt8 i8PlatformCanHardwareCanGetFreeSendSlots(TVoid);

//void InitCan(plcstring* szCanDevice);

#endif //_HAL_CAN_H
