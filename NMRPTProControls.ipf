#pragma rtGlobals=3		// Use modern global access method and strict wave access.


Function ElementSelect(ctrlname):ButtonControl
	string ctrlname
	
	STRUCT pt pt; initpt(pt)
	
	variable element=str2num(Replacestring("button", ctrlname, ""))

	String buttontitle

	pt.atomicnumber=element
	
	findvalue/Text=(num2str(element)) pt.nmrperiodictabledata
		
	pt.nucleusname=pt.nmrperiodictabledata[v_value][1]
	
	print v_value
	variable isotopes
	
	if(samestring(pt.nmrperiodictabledata[v_value+2][0], num2str(element))==1)
		isotopes=3
	elseif(samestring(pt.nmrperiodictabledata[v_value+1][0], num2str(element))==1)
		isotopes=2
	else
		isotopes=1
	endif
	
	variable i=0
			
	do
		if(samestring(pt.nmrperiodictabledata[v_value+i][2],"-")==1)
			buttontitle="\\Z30\\K(65535,0,0)\\S \\M\\Z30\\K(65535,0,0)" +pt.nucleusname + "\r"
		else
			buttontitle="\\Z30\\K(65535,0,0)\\S "+pt.nmrperiodictabledata[v_value+i][2]+"\\M\\Z30\\K(65535,0,0)" +pt.nucleusname + "\r"
		endif		
		
		buttontitle+="\\M\\Z21\\K(0,0,0)"+pt.nmrperiodictabledata[v_value+i][3]+"\r"
		
		buttontitle+=pt.nmrperiodictabledata[v_value+i][4]+"\r"

		buttontitle+=pt.nmrperiodictabledata[v_value+i][5]+"\r"

		buttontitle+=pt.nmrperiodictabledata[v_value+i][6]+"\r"

		buttontitle+=pt.nmrperiodictabledata[v_value+i][7]+"\r"

		buttontitle+=pt.nmrperiodictabledata[v_value+i][8]+"\r"

		buttontitle+=pt.nmrperiodictabledata[v_value+i][9]

		if(i==0)
			Button buttoniso0, pos={250+50*(3-isotopes), 25}, disable=0, title=buttontitle
		elseif(i==1)
			Button buttoniso1, pos={350+50*(3-isotopes)	, 25}, disable=0, title=buttontitle
		elseif(i==2)
			Button buttoniso2, pos={450, 25}, disable=0, title=buttontitle
		endif
		
		i+=1
	while(i<isotopes)

	if(isotopes==1)
		Button buttoniso1, disable=1
		Button buttoniso2, disable=1			
	elseif(isotopes==2)
		Button buttoniso2, disable=1
	endif


	buttontitle="\\JR\\M\\Z30\\K(0,0,0)" +num2str(pt.atomicnumber)+ "\r"
	buttontitle+="\\M\\Z21\\K(0,0,0) Spin\r"
	buttontitle+="\F'Symbol'g/2p\F'Arial'(MHz/T)\r"
	buttontitle+="Q (barns)\r"
	
	string buttontitle2=""
	
	buttontitle2+="\JR\Z19N. A.\r"
	buttontitle2+="Sens.\r"
	buttontitle2+="K (%)\r"
	buttontitle2+="T\B1\M\Z21T(sK)"
	
	TitleBox parameters, pos={225-50*(isotopes-1), 30}, size={90,225}, frame=0
	Titlebox parameters, title=buttontitle

	TitleBox parameters2, pos={260-50*(isotopes-1), 145}, size={90, 225}, frame=0
	titlebox parameters2, title=buttontitle2

End



Function IsotopeSelect(ctrlName) : ButtonControl
	String ctrlName
			
	STRUCT pt pt; initpt(pt)
		
	findvalue/Text=(num2str(pt.atomicnumber)) pt.nmrperiodictabledata
				
	variable isotope=str2num(Replacestring("buttoniso", ctrlname, ""))
	
	v_value+=isotope


	if(strsearch(pt.nmrperiodictabledata[v_value][4], "-",0)==0)
		return 0
	else
		pt.ggyro=str2num(pt.nmrperiodictabledata[v_value][4])
	endif
	
	if(strsearch(pt.nmrperiodictabledata[v_value][3], "/",0)>=0)
		pt.spin=str2num(removeending(pt.nmrperiodictabledata[v_value][3],"/2"))/2
	else
		pt.spin=str2num(pt.nmrperiodictabledata[v_value][3])
	endif

	pt.iso=str2num(pt.nmrperiodictabledata[v_value][2])
	pt.abundance=str2num(pt.nmrperiodictabledata[v_value][7])

	if(strsearch(pt.nmrperiodictabledata[v_value][8], "-",0)!=0)
		pt.gK=str2num(pt.nmrperiodictabledata[v_value][8])
	endif
	
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