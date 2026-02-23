TYPE
	ArPnImSoftwareRevisionType : 	STRUCT 
		Prefix : USINT;
		X : USINT;
		Y : USINT;
		Z : USINT;
	END_STRUCT;
	
	ArPnImIm0Type : 	STRUCT 
		VendorID : UINT;
		OrderID : ARRAY[0..19]OF USINT;
		SerialNumber : ARRAY[0..15]OF USINT;
		HardwareRevision : UINT;
		SoftwareRevision : ArPnImSoftwareRevisionType;
		RevisionCounter : UINT;
		ProfileID : UINT;
		ProfileSpecificType : UINT;
		IMVersion : UINT;
		IMSupported : UINT;
	END_STRUCT;
	
	ArPnImIm5Type : 	STRUCT 
		Annotation : ARRAY[0..63]OF USINT;
		OrderID : ARRAY[0..63]OF USINT;
		VendorID : UINT;
		SerialNumber : ARRAY[0..15]OF USINT;
		HardwareRevision : UINT;
		SoftwareRevision : ArPnImSoftwareRevisionType;
	END_STRUCT;
	
	ArPnImUuidType : STRUCT
		Data : ARRAY[0..15]OF USINT;
	END_STRUCT;
	
	ArPnImAssetEntryType : 
	(
		arPNIM_ASSET_TYPE_FULL := 1,
		arPNIM_ASSET_TYPE_FW_ONLY := 2, 
		arPNIM_ASSET_TYPE_HW_ONLY := 3
	);

	ArPnImAssetLevelTreeType : STRUCT
		Levels: ARRAY[0..11]OF UINT;
	END_STRUCT;

	ArPnImAssetSlotSubslotType : STRUCT
		SlotBegin : UINT;
		SubslotBegin : UINT;
		SlotEnd : UINT;
		SubslotEnd : UINT;
	END_STRUCT;

	ArPnImAssetLocationType : STRUCT
		StructureId : USINT;
		LevelTree : ArPnImAssetLevelTreeType;
		SlotSubslot : ArPnImAssetSlotSubslotType;
	END_STRUCT;

	ArPnImAssetDeviceType: STRUCT
		DeviceSubId : UINT;
		DeviceId : UINT;
		VendorId : UINT;
		Organization : UINT;
	END_STRUCT;

	ArPnImAssetDataType: STRUCT
		EntryType : ArPnImAssetEntryType;
		ImUniqueIdentifier : ArPnImUuidType;
		AmLocation : ArPnImAssetLocationType;
		ImAnnotation : ARRAY[0..63]OF USINT;
		ImOrderId : ARRAY[0..63]OF USINT;
		AmSoftwareRev : ARRAY[0..63]OF USINT;
		AmHardwareRev : ARRAY[0..63]OF USINT;
		ImSerialNumber : ARRAY[0..15]OF USINT;
		ImSoftwareRev : ARRAY[0..3]OF USINT;
		AmDeviceIdentification : ArPnImAssetDeviceType;
		AmTypeIdentification : UINT;
		ImHardwareRev : UINT;
	END_STRUCT;
	
	ArPnImAssetType: STRUCT
		Name : STRING[127];
		ParentName : STRING[127];
		Send : BOOL;
		Valid : BOOL;
		Data : ArPnImAssetDataType;
	END_STRUCT;
END_TYPE
