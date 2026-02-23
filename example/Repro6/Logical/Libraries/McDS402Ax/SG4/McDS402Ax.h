/* Automation Studio generated header file */
/* Do not edit ! */
/* McDS402Ax 6.5.1 */

#ifndef _MCDS402AX_
#define _MCDS402AX_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _McDS402Ax_VERSION
#define _McDS402Ax_VERSION 6.5.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif

#ifdef _SG4
#include <McBase.h> 
#include <McAxis.h>
#endif
 
#ifdef _SG3
#include <McBase.h> 
#include <McAxis.h>
#endif
 
#ifdef _SGC
#include <McBase.h> 
#include <McAxis.h>
#endif

/* Datatypes and datatypes of function blocks */
typedef enum McDAPAVREnum
{	mcDAPAVR_DEF = 0,
	mcDAPAVR_SET_MAN = 1
} McDAPAVREnum;

typedef enum McDACSVMCycPosModEnum
{	mcDACSVMCPM_INTRPL_POS = 0,
	mcDACSVMCPM_CYC_SYN_POS = 1
} McDACSVMCycPosModEnum;

typedef enum McDACSVMCycVelModEnum
{	mcDACSVMCVM_PROF_VEL = 0,
	mcDACSVMCVM_CYC_SYN_VEL = 1
} McDACSVMCycVelModEnum;

typedef struct McDS402AxHomingParType
{	enum McHomingModeEnum HomingMode;
	double Position;
	float StartVelocity;
	float HomingVelocity;
	float Acceleration;
	enum McDirectionEnum SwitchEdge;
	enum McDirectionEnum StartDirection;
	enum McDirectionEnum HomingDirection;
	enum McSwitchEnum ReferencePulse;
	enum McSwitchEnum DriveSpecificHoming;
	signed char DriveSpecificHomingMode;
} McDS402AxHomingParType;

typedef struct McDAMEType
{	struct McCfgGearBoxType Gearbox;
	struct McCfgRotToLinTrfType RotaryToLinearTransformation;
} McDAMEType;

typedef struct McDAESType
{	signed long IncrementsPerRevolution;
} McDAESType;

typedef struct McDAPAVRSetManType
{	signed long LowerLimit;
	signed long UpperLimit;
} McDAPAVRSetManType;

typedef struct McDAPAVRType
{	enum McDAPAVREnum Type;
	struct McDAPAVRSetManType SetManually;
} McDAPAVRType;

typedef struct McDACSVMType
{	enum McDACSVMCycPosModEnum CyclicPositionMode;
	enum McDACSVMCycVelModEnum CyclicVelocityMode;
} McDACSVMType;

typedef struct McDAAFType
{	struct McCfgUnboundedArrayType FeatureReference;
} McDAAFType;

typedef struct McCfgDS402AxType
{	struct McCfgReferenceType AxisReference;
	struct McDAMEType MechanicalElements;
	struct McDAESType EncoderSettings;
	struct McDAPAVRType PositionActualValueRange;
	struct McDACSVMType CyclicSetValueModes;
	struct McDAAFType AxisFeatures;
} McCfgDS402AxType;

typedef struct McCfgDS402InvAxType
{	struct McCfgReferenceType AxisReference;
	struct McDAMEType MechanicalElements;
} McCfgDS402InvAxType;

typedef struct McCfgDS402AxRefType
{	struct McCfgReferenceType AxisReference;
} McCfgDS402AxRefType;

typedef struct McCfgDS402AxMechElmType
{	struct McDAMEType MechanicalElements;
} McCfgDS402AxMechElmType;

typedef struct McCfgDS402AxEncSetType
{	struct McDAESType EncoderSettings;
} McCfgDS402AxEncSetType;

typedef struct McCfgDS402AxPosActValRngType
{	struct McDAPAVRType PositionActualValueRange;
} McCfgDS402AxPosActValRngType;

typedef struct McCfgDS402AxCycSetValModType
{	struct McDACSVMType CyclicSetValueModes;
} McCfgDS402AxCycSetValModType;

typedef struct McCfgDS402AxFeatType
{	struct McDAAFType AxisFeatures;
} McCfgDS402AxFeatType;

typedef struct McCfgAcpInvAxType
{	struct McCfgReferenceType AxisReference;
	struct McDAMEType MechanicalElements;
} McCfgAcpInvAxType;

typedef struct McCfgAcpInvAxRefType
{	struct McCfgReferenceType AxisReference;
} McCfgAcpInvAxRefType;

typedef struct McCfgAcpInvAxMechElmType
{	struct McDAMEType MechanicalElements;
} McCfgAcpInvAxMechElmType;

typedef struct MC_BR_InitHome_DS402Ax
{
	/* VAR_INPUT (analog) */
	struct McAxisType* Axis;
	struct McDS402AxHomingParType HomingParameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} MC_BR_InitHome_DS402Ax_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MC_BR_InitHome_DS402Ax(struct MC_BR_InitHome_DS402Ax* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MCDS402AX_ */

