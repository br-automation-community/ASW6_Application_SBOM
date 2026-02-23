
TYPE
	IORTI_DOUTTIME : 	STRUCT 
		MODE_INACT : UDINT := 16#00000000; (*Digital Output Mode inactiv*)
		MODE_BOOL : UDINT := 16#00000001; (*Digital Output Mode boolean *)
		MODE_BASE_OFFS : UDINT := 16#00000002; (*Digital Output Mode Base and Offset one shot*)
		MODE_BASE_OFFS_PER : UDINT := 16#00000004; (*Digital Output Mode Base and Offset periodic*)
		MODE_ABSOLUT : UDINT := 16#00000008; (*Digital Output Mode absolut comparator values*)
		MODE_BOOL_INV : UDINT := 16#00000011; (*Digital Output Mode boolean inverted*)
		MODE_BASE_OFFS_INV : UDINT := 16#00000012; (*Digital Output Mode Base and Offset one shot  inverted*)
		MODE_BASE_OFFS_PER_INV : UDINT := 16#00000014; (*Digital Output Mode Base and Offset periodic  inverted*)
		MODE_ABSOLUT_INV : UDINT := 16#00000018; (*Digital Output Mode absolut comparator values inverted*)
	END_STRUCT;
	IORTI_COMP : 	STRUCT 
		MODE_DISABLE : UDINT := 16#00000000; (*Comp Mode inactive*)
		MODE_ENABLE : UDINT := 16#00000001; (*Comp Mode active*)
		MODE_EQ : UDINT := 16#00000003; (*In1 is equal to In2*)
		MODE_NE : UDINT := 16#0000000D; (*In1 is not equal to In2*)
		MODE_GTU : UDINT := 16#00000005; (*In1 is greater than In2   (unsigned)*)
		MODE_GEU : UDINT := 16#00000007; (*In1 is greater or equal to In2   (unsigned)*)
		MODE_LTU : UDINT := 16#00000009; (*In1 is less than In2   (unsigned)*)
		MODE_LEU : UDINT := 16#0000000B; (*In1 is less or equal to In2   (unsigned)*)
		MODE_GT : UDINT := 16#80000005; (*In1 is greater than In2   (signed)*)
		MODE_GE : UDINT := 16#80000007; (*In1 is greater or equal to In2   (signed)*)
		MODE_LT : UDINT := 16#80000009; (*In1 is less than In2   (signed)*)
		MODE_LE : UDINT := 16#8000000B; (*In1 is less or equal to In2   (signed)*)
	END_STRUCT;
	IORTI_MUL : 	STRUCT 
		MODE_UNSIGNED : UDINT := 16#00000000; (*Multiplication Mode unsigned*)
		MODE_SIGNED : UDINT := 16#80000000; (*Multiplication Mode signed*)
	END_STRUCT;
	IORTI_DIV : 	STRUCT 
		MODE_UNSIGNED : UDINT := 16#00000000; (*Division Mode unsigned*)
		MODE_SIGNED : UDINT := 16#80000000; (*Division Mode signed*)
	END_STRUCT;
	IORTI_PWM : 	STRUCT 
		MODE_INACT : UDINT := 16#00000000; (*Pwm Mode inactiv*)
		MODE_LEFT_PROC : UDINT := 16#00000001; (*Pwm Mode active left aligned  hightime as procentual value*)
		MODE_LEFT_PROC_DB : UDINT := 16#00000009; (*Pwm Mode active left aligned  hightime as procentual value, deadband enable*)
		MODE_LEFT_PROC_INV : UDINT := 16#00000011; (*Pwm Mode active left aligned  hightime as procentual value, inverted*)
		MODE_LEFT_PROC_DB_INV : UDINT := 16#00000019; (*Pwm Mode active left aligned  hightime as procentual value, deadband enable, inverted*)
		MODE_LEFT_TIME : UDINT := 16#00000005; (*Pwm Mode active left aligned  hightime as time value*)
		MODE_LEFT_TIME_DB : UDINT := 16#0000000D; (*Pwm Mode active left aligned  hightime as time value, deadband enable*)
		MODE_LEFT_TIME_INV : UDINT := 16#00000015; (*Pwm Mode active left aligned  hightime as time value, inverted*)
		MODE_LEFT_TIME_DB_INV : UDINT := 16#0000001D; (*Pwm Mode active left aligned  hightime as time value, deadband enable, inverted*)
		MODE_CENT_PROC : UDINT := 16#00000003; (*Pwm Mode active centered hightime as procentual value*)
		MODE_CENT_PROC_DB : UDINT := 16#0000000B; (*Pwm Mode active centered hightime as procentual value, deadband enable*)
		MODE_CENT_PROC_INV : UDINT := 16#00000013; (*Pwm Mode active centered hightime as procentual value, inverted*)
		MODE_CENT_PROC_DB_INV : UDINT := 16#0000001B; (*Pwm Mode active centered hightime as procentual value, deadband enable, inverted*)
		MODE_CENT_TIME : UDINT := 16#00000007; (*Pwm Mode active centered hightime as time value*)
		MODE_CENT_TIME_DB : UDINT := 16#0000000F; (*Pwm Mode active centered hightime as time value, deadband enable*)
		MODE_CENT_TIME_INV : UDINT := 16#00000017; (*Pwm Mode active centered hightime as time value, inverted*)
		MODE_CENT_TIME_DB_INV : UDINT := 16#0000001F; (*Pwm Mode active centered hightime as time value, deadband enable, inverted*)
		MODE_USE_START_AS_BASE : UDINT := 16#00000020; (*Pwm Mode Start used as Basetime*)
	END_STRUCT;
	IORTI_COUNT : 	STRUCT 
		MODE_UPDWN_NOSTOP : UDINT := 16#00000000; (*Eventcounter Mode Up/Down with overrun*)
		MODE_CLKDIR_NOSTOP : UDINT := 16#00000001; (*Eventcounter Mode Clock and direction with overrun*)
		MODE_UPDWN_STOP : UDINT := 16#00000002; (*Eventcounter Mode Up/Down, stop at overrun*)
		MODE_CLKDIR_STOP : UDINT := 16#00000003; (*Eventcounter Mode Clock and direction, stop at overrun*)
	END_STRUCT;
	IORTI_REGISTER : 	STRUCT 
		MODE_FREEZED : UDINT := 16#00000000; (*Register freezed*)
		MODE_TRANSPARENT : UDINT := 16#00000001; (*Register transparent*)
		MODE_EDGE_RISING : UDINT := 16#00000010; (*Register latch on rising edge*)
		MODE_EDGE_FALLING : UDINT := 16#00000011; (*Register latch on falling edge*)
		MODE_EDGE_BOTH : UDINT := 16#00000012; (*Register latch on both edges*)
		MODE_LEVEL_LOW : UDINT := 16#00000020; (*Register transparent if Latch low*)
		MODE_LEVEL_HIGH : UDINT := 16#00000021; (*Register transparent if Latch high*)
	END_STRUCT;
	IORTI_REAL : 	STRUCT 
		TYPE_NORM : DINT := 16#00000000; (*Result is normalized*)
		TYPE_ZERO : DINT := 16#00000001; (*Result is zero*)
		TYPE_NAN : DINT := 16#00000002; (*Result is not a number*)
		TYPE_UNDER : DINT := 16#00000004; (*Result is underflow *)
		TYPE_OVER : DINT := 16#00000008; (*Result is overflow*)
		TYPE_DIVZERO : DINT := 16#00000010; (*Result is divide by zero*)
		TYPE_INFINITE : DINT := 16#00000020; (*Result is infinite*)
	END_STRUCT;
END_TYPE
