//**********************************************************************************************************************
//! @file        HalTypedef.h
//! @brief       ISOAgLibS typedefs for ARM
//! @author      Markus Schiffmann (MSCI)
//! @date        16.02.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef __HAL_TYPEDEF_H__
#define __HAL_TYPEDEF_H__

// INCLUDES=============================================================================================================
#include <assert.h>
#include <stdio.h> // because we need "printf" and "NULL"

// GLOBAL DEFINES=======================================================================================================
#define FALSE 0
#define TRUE 1
#define HAL_INLINE __inline__
#define ALWAYS_INLINE_ATTRIBUTE __attribute__((always_inline))
#define ISO_OP_MEMORY_CLASS

// GLOBAL DECLARATIONS (NO DATA, I.E. TYPEDEF, ENUM, STRUCT, ...)=======================================================
typedef void TVoid;
typedef char TChar;
typedef signed char TInt8;
typedef signed short TInt16;
typedef signed int TInt32;
typedef unsigned char TBoolean;
typedef unsigned char TUint8;
typedef unsigned short TUint16;
typedef unsigned int TUint32;
typedef float TFloat32;

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION-PROTOTYPE DECLARATIONS===============================================================================

#endif
