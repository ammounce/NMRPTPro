#pragma rtGlobals=3		// Use modern global access method and strict wave access.


Function Lastpoint(wname)
	wave wname
	
	return dimsize(wname,0)-1
End

Function Firstxpoint(wname)
	wave wname
	
	return pnt2x(wname, 0)
end


Function Lastxpoint(wname)
	wave wname
	
	return pnt2x(wname, dimsize(wname, 0)-1)
End


Function/s ListofWavesinFolder()

	setdatafolder root:

	string list=""
	variable numwaves,index=0
	
	numwaves = Countobjects(":",1)
	do
		list=list + GetIndexedObjName(":", 1, index)+";"
		index +=1
	while(index < numwaves)
	
	return(Sortlist(list))
	
End

Function Samestring(string1, string2)
	string string1, string2
	
	if(cmpstr(string1, string2)==0)
		return 1
	else
		return 0
	endif
End