/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARPNIM_
#define _ARPNIM_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum ArPnImAssetEntryType
{	arPNIM_ASSET_TYPE_FULL = 1,
	arPNIM_ASSET_TYPE_FW_ONLY = 2,
	arPNIM_ASSET_TYPE_HW_ONLY = 3
} ArPnImAssetEntryType;

typedef struct ArPnImSoftwareRevisionType
{	unsigned char Prefix;
	unsigned char X;
	unsigned char Y;
	unsigned char Z;
} ArPnImSoftwareRevisionType;

typedef struct ArPnImIm0Type
{	unsigned short VendorID;
	unsigned char OrderID[20];
	unsigned char SerialNumber[16];
	unsigned short HardwareRevision;
	struct ArPnImSoftwareRevisionType SoftwareRevision;
	unsigned short RevisionCounter;
	unsigned short ProfileID;
	unsigned short ProfileSpecificType;
	unsigned short IMVersion;
	unsigned short IMSupported;
} ArPnImIm0Type;

typedef struct ArPnImIm5Type
{	unsigned char Annotation[64];
	unsigned char OrderID[64];
	unsigned short VendorID;
	unsigned char SerialNumber[16];
	unsigned short HardwareRevision;
	struct ArPnImSoftwareRevisionType SoftwareRevision;
} ArPnImIm5Type;

typedef struct ArPnImUuidType
{	unsigned char Data[16];
} ArPnImUuidType;

typedef struct ArPnImAssetLevelTreeType
{	unsigned short Levels[12];
} ArPnImAssetLevelTreeType;

typedef struct ArPnImAssetSlotSubslotType
{	unsigned short SlotBegin;
	unsigned short SubslotBegin;
	unsigned short SlotEnd;
	unsigned short SubslotEnd;
} ArPnImAssetSlotSubslotType;

typedef struct ArPnImAssetLocationType
{	unsigned char StructureId;
	struct ArPnImAssetLevelTreeType LevelTree;
	struct ArPnImAssetSlotSubslotType SlotSubslot;
} ArPnImAssetLocationType;

typedef struct ArPnImAssetDeviceType
{	unsigned short DeviceSubId;
	unsigned short DeviceId;
	unsigned short VendorId;
	unsigned short Organization;
} ArPnImAssetDeviceType;

typedef struct ArPnImAssetDataType
{	enum ArPnImAssetEntryType EntryType;
	struct ArPnImUuidType ImUniqueIdentifier;
	struct ArPnImAssetLocationType AmLocation;
	unsigned char ImAnnotation[64];
	unsigned char ImOrderId[64];
	unsigned char AmSoftwareRev[64];
	unsigned char AmHardwareRev[64];
	unsigned char ImSerialNumber[16];
	unsigned char ImSoftwareRev[4];
	struct ArPnImAssetDeviceType AmDeviceIdentification;
	unsigned short AmTypeIdentification;
	unsigned short ImHardwareRev;
} ArPnImAssetDataType;

typedef struct ArPnImAssetType
{	plcstring Name[128];
	plcstring ParentName[128];
	plcbit Send;
	plcbit Valid;
	struct ArPnImAssetDataType Data;
} ArPnImAssetType;

typedef struct ArPnImGetDeviceIm0
{
	/* VAR_INPUT (analog) */
	plcstring Device[128];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct ArPnImIm0Type Im0;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArPnImGetDeviceIm0_typ;

typedef struct ArPnImSetDeviceIdentification
{
	/* VAR_INPUT (analog) */
	plcstring Device[128];
	unsigned short DeviceID;
	unsigned char DeviceType[25];
	struct ArPnImIm0Type Im0;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArPnImSetDeviceIdentification_typ;

typedef struct ArPnImSetDeviceIm5
{
	/* VAR_INPUT (analog) */
	plcstring Device[128];
	struct ArPnImIm5Type Im5;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArPnImSetDeviceIm5_typ;

typedef struct ArPnImSetAssets
{
	/* VAR_INPUT (analog) */
	plcstring Device[128];
	unsigned long AssetArray;
	unsigned long AssetCount;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArPnImSetAssets_typ;

typedef struct ArPnImRemoveAssets
{
	/* VAR_INPUT (analog) */
	plcstring Device[128];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArPnImRemoveAssets_typ;

typedef struct ArPnImGenerateAssets
{
	/* VAR_INPUT (analog) */
	unsigned long AssetArray;
	unsigned long AssetArrayLen;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long AssetCount;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArPnImGenerateAssets_typ;

typedef struct ArPnImGenerateAssetLevels
{
	/* VAR_INPUT (analog) */
	unsigned long AssetArray;
	unsigned long AssetCount;
	plcstring StartAsset[128];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long InvalidElementIndex;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArPnImGenerateAssetLevels_typ;

typedef struct ArPnImGenerateAssetUuids
{
	/* VAR_INPUT (analog) */
	unsigned long AssetArray;
	unsigned long AssetCount;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArPnImGenerateAssetUuids_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArPnImGetDeviceIm0(struct ArPnImGetDeviceIm0* inst);
_BUR_PUBLIC void ArPnImSetDeviceIdentification(struct ArPnImSetDeviceIdentification* inst);
_BUR_PUBLIC void ArPnImSetDeviceIm5(struct ArPnImSetDeviceIm5* inst);
_BUR_PUBLIC void ArPnImSetAssets(struct ArPnImSetAssets* inst);
_BUR_PUBLIC void ArPnImRemoveAssets(struct ArPnImRemoveAssets* inst);
_BUR_PUBLIC void ArPnImGenerateAssets(struct ArPnImGenerateAssets* inst);
_BUR_PUBLIC void ArPnImGenerateAssetLevels(struct ArPnImGenerateAssetLevels* inst);
_BUR_PUBLIC void ArPnImGenerateAssetUuids(struct ArPnImGenerateAssetUuids* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arPNIM_STRUCTURE_ID_SLOT_SUBSLOT 2U
 #define arPNIM_STRUCTURE_ID_LEVEL_TREE 1U
 #define arPNIM_INF_ARRAY_LEN 1076899952
 #define arPNIM_ERR_IM_PARAMETER (-1070583734)
 #define arPNIM_ERR_SW_PREFIX (-1070583735)
 #define arPNIM_ERR_VENDOR_ID (-1070583736)
 #define arPNIM_ERR_ASSET_NAME (-1070583737)
 #define arPNIM_ERR_ASSET_DEPTH (-1070583740)
 #define arPNIM_ERR_INVALID_START (-1070583741)
 #define arPNIM_ERR_FLOATING_ASSET (-1070583742)
 #define arPNIM_ERR_DUPLICATE_ASSET (-1070583743)
 #define arPNIM_ERR_ASSET_ARRAY (-1070583744)
 #define arPNIM_ERR_NO_ROOT (-1070583745)
 #define arPNIM_ERR_DEVICE (-1070583746)
#else
 _GLOBAL_CONST unsigned char arPNIM_STRUCTURE_ID_SLOT_SUBSLOT;
 _GLOBAL_CONST unsigned char arPNIM_STRUCTURE_ID_LEVEL_TREE;
 _GLOBAL_CONST signed long arPNIM_INF_ARRAY_LEN;
 _GLOBAL_CONST signed long arPNIM_ERR_IM_PARAMETER;
 _GLOBAL_CONST signed long arPNIM_ERR_SW_PREFIX;
 _GLOBAL_CONST signed long arPNIM_ERR_VENDOR_ID;
 _GLOBAL_CONST signed long arPNIM_ERR_ASSET_NAME;
 _GLOBAL_CONST signed long arPNIM_ERR_ASSET_DEPTH;
 _GLOBAL_CONST signed long arPNIM_ERR_INVALID_START;
 _GLOBAL_CONST signed long arPNIM_ERR_FLOATING_ASSET;
 _GLOBAL_CONST signed long arPNIM_ERR_DUPLICATE_ASSET;
 _GLOBAL_CONST signed long arPNIM_ERR_ASSET_ARRAY;
 _GLOBAL_CONST signed long arPNIM_ERR_NO_ROOT;
 _GLOBAL_CONST signed long arPNIM_ERR_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARPNIM_ */

