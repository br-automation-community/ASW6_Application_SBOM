#ifndef _HAL_TEXT_H
#define _HAL_TEXT_H

#include <bur/plctypes.h>
#include <CpIsobus.h>
#include <string.h>

// GLOBAL DEFINES=======================================================================================================
#ifdef __cplusplus
	extern "C"
	{
#endif

#include <IsoStackCore_types.h>

#ifdef __cplusplus
	};
#endif


#define TEST_ASSERT(expr) ((expr) ? (void)0 : AssertionViolated(#expr, __FILE__, __LINE__))

#define DEBUG_INFO(message, ...) \
    do { \
            LogDebugInfo( __FILE__, __LINE__, ( message), ##__VA_ARGS__); \
    } \
    while(0)

void AssertionViolated(const char *assertion, const char *file, unsigned int line);

void WriteToLogger(CpIsobusErrorEnum eventID, const char *message, ...);

void LogDebugInfo(const char * file, int line, const char* message, ...);

void SetLogLevel(enum CpIsobusLogLevelEnum LogLevel);


#endif /* _HAL_TEXT_H */
