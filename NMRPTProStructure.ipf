#pragma rtGlobals=3		// Use modern global access method and strict wave access.

Structure PT
	SVAR nucleusname

	NVAR iso, atomicnumber
	NVAR gyro
	NVAR spin
	NVAR quadmom
	NVAR abundance
	NVAR K, gK, ggyro
	
	NVAR H0, w0, sys2i, dfi
		
	string panel
	
	wave/t NMRPeriodicTabledata
ENdstructure

Function InitPt(s)
	STRUCT pt &s
	
	SVAR s.nucleusname=root:NMRPtPro:nucleusname
	
	NVAR s.iso=root:NMRPtPro:iso
	NVAR s.atomicnumber=root:NMRPtPro:atomicnumber

	NVAR s.gyro=root:NMRPtPro:gyro
	NVAR s.ggyro=root:NMRPtPro:ggyro
	
	NVAR s.spin=root:NMRPtPro:spin

	NVAR s.quadmom=root:NMRPtPro:quadmom
	
	NVAR s.abundance=root:NMRPtPro:abundance
	
	
	NVAR s.K=root:NMRPtPro:K
	
	NVAR s.gK=root:NMRPtPro:gK
	NVAR s.w0=root:NMRPtPro:w0
	NVAR s.H0=root:NMRPtPro:H0
	NVAR s.sys2I=root:NMRPtPro:sys2I
	NVAR s.DFI=root:NMRPtPro:DFI

	s.panel="NMRPeriodicTable"
	
	wave/t s.NMRperiodictabledata=root:NMRPTPro:NMRPeriodcTableData

End