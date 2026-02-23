#ifndef _HAL_STORAGE_H
#define _HAL_STORAGE_H

#include <IsoStackCore_types.h>

// returns TRUE in case a file <filename> could be opened, FALSE if not
TBoolean boPlatformStorageFopen(const char *filename, const char *mode);

// returns TRUE in case the standard storage file could be opened, FALSE if not
TBoolean boPlatformStorageOpenStandardStorageFile(TVoid);

// closes the currently opened file stream; in case no file stream is open, nothing happens
TVoid vPlatformStorageFclose(TVoid);

// reads the currently opened file stream; in case no file stream is open, nothing happens
TVoid vPlatformStorageFread(void* Buffer, TUint32 ElementSize, TUint32 ElementCount);

// writes <ElementCount> numbers of elements of size <ElementSize> from <Buffer> to the currently opened file stream;
// in case no file stream is open, nothing happens
TVoid vPlatformStorageFwrite(const void* Buffer, TUint32 ElementSize, TUint32 ElementCount);

#endif // ! _HAL_STORAGE_H

