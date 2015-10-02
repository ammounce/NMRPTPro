#pragma rtGlobals=3		// Use modern global access method and strict wave access.


Function ElementSelect(ctrlname):ButtonControl
	string ctrlname
	
	STRUCT pt pt; initpt(pt)
	
	variable element=str2num(Replacestring("button", ctrlname, ""))

	String buttontitle

	pt.atomicnumber=element
	pt.nucleusname=pt.nucleusnamewave[element]
	
	variable isotopes
	
	if(numtype(pt.spinwave[element][2])!=2)
		isotopes=3
	elseif(numtype(pt.spinwave[element][1])!=2)
		isotopes=2
	else
		isotopes=1
	endif
	
	variable i=1
			
	do
		if(numtype(pt.isonumber[element][i-1])==2)
			buttontitle="\\Z30\\K(65535,0,0)\\S \\M\\Z30\\K(65535,0,0)" +pt.nucleusname + "\r"
		else
			buttontitle="\\Z30\\K(65535,0,0)\\S "+num2str(pt.isonumber[element][i-1])+"\\M\\Z30\\K(65535,0,0)" +pt.nucleusname + "\r"
		endif
		
		if(numtype(pt.spinwave[element][i-1])==2)
			buttontitle+="\\M\\Z20\\K(0,0,0) -  \r"	
		elseif(mod(pt.spinwave[element][i-1],2)==0)
			buttontitle+="\\M\\Z20\\K(0,0,0)"+num2str(pt.spinwave[element][i-1]/2)+" \r"
		else
			buttontitle+="\\M\\Z20\\K(0,0,0)"+num2str(pt.spinwave[element][i-1])+"/2 \r"
		endif
		
		if(numtype(pt.gyrowave[element][i-1])==2)
			buttontitle+="- \r"
		else
			buttontitle+=num2str(pt.gyrowave[element][i-1])+"\r"
		endif
	
		if(abs(pt.quadmomwave[element][i-1])>0)
			buttontitle+=num2str(pt.quadmomwave[element][i-1])+"\r"
		else
			buttontitle+="-\r"
		endif
		
		if(pt.abundancewave[element][i-1]>0)
			buttontitle+=num2str(pt.abundancewave[element][i-1])+"\r"
		else
			buttontitle+="- \r"
		endif
		
		if(pt.sensewave[element][i-1]>0)
			buttontitle+=num2str(pt.sensewave[element][i-1])+"\r"
		else
			buttontitle+="- \r"
		endif
	
		if(pt.shiftwave[element]>0)
			buttontitle+=num2str(pt.shiftwave[element])+"\r"
		else
			buttontitle+="-\r"
		endif
		
		if(pt.T1Twave[element][i-1]>0)
			buttontitle+=num2str(pt.T1Twave[element][i-1])
		else
			buttontitle+="-"
		endif
		
		
		if(i==1)
			Button buttoniso1,pos={350-50*(isotopes-1), 25},size={90,225},proc=IsotopeSelect
			Button buttoniso1, title=buttontitle
			print buttontitle
		elseif(i==2 && isotopes>1)
			Button buttoniso2,pos={450-50*(isotopes-1), 25},size={90,225},proc=IsotopeSelect
			Button buttoniso2, title=buttontitle
		elseif(i==2 && isotopes==1)
			KillControl buttoniso2
		elseif(i==3 && isotopes >2)
			Button buttoniso3,pos={450, 25},size={90,225},proc=IsotopeSelect
			Button buttoniso3, title=buttontitle
		elseif(i==3 && isotopes<3)
			KillControl buttoniso3
		endif
			
		i+=1
	while(i<4)

	buttontitle="\\JR\\M\\Z30\\K(0,0,0)" +num2str(pt.atomicnumber)+ "\r"
	buttontitle+="\\M\\Z21\\K(0,0,0) Spin\r"
	buttontitle+="\F'Symbol'g\F'Arial'\r"
	buttontitle+="Q\r"
	buttontitle+="a\r"
	buttontitle+="sensit.\r"
	buttontitle+="K\r"
	buttontitle+="T\B1\M \Z21 T"
	
	TitleBox parameters, pos={285-50*(isotopes-1), 35}, size={90,225}, frame=0
	Titlebox parameters, title=buttontitle

	//TextBox

End


Function IsotopeSelect(ctrlName) : ButtonControl
	String ctrlName
	
	print ctrlname
	
	STRUCT pt pt; initpt(pt)
	
	variable isotope=str2num(Replacestring("buttoniso", ctrlname, ""))
		
	pt.ggyro=pt.gyrowave[pt.atomicnumber][isotope-1]
	pt.spin=pt.spinwave[pt.atomicnumber][isotope-1]
	pt.iso=pt.isonumber[pt.atomicnumber][isotope-1]
	pt.nucleusname=pt.nucleusnamewave[pt.atomicnumber][isotope-1]
	pt.abundance=pt.abundancewave[pt.atomicnumber][isotope-1]

	if(numtype(pt.shiftwave[pt.atomicnumber][isotope-1])!=2)
		pt.gK=pt.shiftwave[pt.atomicnumber][isotope-1]
	endif

	pt.sensew=2/3*(pt.spin/2+1)*pt.ggyro/pt.gyrowave[1][0]*pt.abundance/100
	pt.senseH=(pt.spin/2+1)/6/(pt.spin/2)^2*pt.ggyro^3/pt.gyrowave[1][0]^3*pt.abundance/100
	
End

Function CalcHwKGI(ctrlName): ButtonControl
	String ctrlName
	
	STRUCT pt pt; initpt(pt)

	if(samestring(ctrlname, "calcH0")==1)
		pt.H0=pt.w0/pt.ggyro/(1-pt.gK/100)
		print pt.gK, pt.w0, pt.ggyro
		pt.sys2I=pt.H0/.11425
		pt.DFI=pt.H0/.12037
	elseif(samestring(ctrlname,"calcw0")==1)
		pt.w0=pt.ggyro*pt.H0*(1+pt.gK/100)
	elseif(samestring(ctrlname, "calcK")==1)
		pt.gK=100*(pt.w0/pt.ggyro/pt.H0-1)		
	endif	
	
	
End

Function SetVarHI(ctrlName,varNum,varStr,varName) : SetVariableControl
	String ctrlName
	Variable varNum	// value of variable as number
	String varStr		// value of variable as string
	String varName	// name
	
	STRUCT pt pt; initpt(pt)

	if(samestring(varname,"H0")==1)
		pt.sys2i=pt.h0/.11425
		pt.DFI=pt.h0/.12037
	elseif(samestring(varname, "sys2I")==1)
		pt.H0=pt.sys2I*.11425
		pt.DFI=pt.sys2I*.12037/.11425
	elseif(samestring(varname, "DFI")==1)
		pt.H0=pt.DFI*.12037
		pt.sys2I=pt.dfi*.11425/.12037
	endif
	
	
end