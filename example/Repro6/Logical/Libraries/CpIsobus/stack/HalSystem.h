#ifndef _HAL_SYSTEM_H
#define _HAL_SYSTEM_H

#include <bur/plctypes.h>
#include <IsoStackCore_types.h>

TUint32 u32PlatformSystemHardwareGetTime(TVoid);
TVoid vPlatformSystemTestSetTimeOffset(TUint32 newValue);
TVoid vPlatformSystemSleep(TUint32 sleepTimeInMs);

UDINT CreateMemoryPartition(UDINT size);
void *AllocateMemoryBlock(UDINT partition, UDINT size);
void FreeMemoryBlock(UDINT partition, void *memory);
void DestroyMemoryPartition(UDINT *partition);


#endif // !_HAL_SYSTEM_H
