
TYPE
	ArEcoWakeupModeEnum : 
		( (*Wake-up mode*)
		arECO_WAKEUPMODE_DISABLED := 0, (*Disable the wake-up trigger*)
		arECO_WAKEUPMODE_VISIBLE := 1, (*Wake-up visible: Turn on display and LEDs*)
		arECO_WAKEUPMODE_SILENT := 2 (*Wake-up silent: Turn off display and LEDs*)
		);
	ArEcoWakeupTriggerType : 	STRUCT  (*Wake-up trigger parameters*)
		Name : STRING[80]; (*Name of the wake-up trigger*)
		Mode : ArEcoWakeupModeEnum; (*Wake-up mode*)
	END_STRUCT;
	ArEcoWakeupTimeType : 	STRUCT  (*Wake-up time parameters*)
		Time : TIME; (*Target time for wake-up*)
		Mode : ArEcoWakeupModeEnum; (*Wake-up mode*)
	END_STRUCT;
END_TYPE
