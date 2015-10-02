#pragma rtGlobals=3		// Use modern global access method and strict wave access.
#pragma IgorVersion=6.37
#pragma version = 0.1

#include ":NMRPTProControls"
#include ":NMRPTProGeneral"
#include ":NMRPTProStructure"


//Main macro to initialize pearidic table
//Initializes variables, then checks if PT is open
Macro NMRPTPro_Initialize()
	InitNMRPTPro()
	
	CheckNMRPTPro()
end

//Checks if PT is open, if not, opens, if it is, brings to front
Function CheckNMRPTPro()

	DoWindow NMRPTPro
	
	if(V_flag==0)	
		Execute "NMRPTPro()"
	elseif(V_flag==1)
		DoWindow/f NMRPTPro
	endif

End

//Initializes folders, variables, and strings
FUnction InitNMRPTPro()
	newdatafolder/o root:NMRPTPro
	setdatafolder root:NMRPTPro
	

	variable/g atomicnumber, iso, spin,gyro, quadmom, ggyro, gK, abundance
	variable/g w0, H0, K, Sys2I, DFI
		
	string/g nucleusname

End


//Creates panel to make PT, if overwritten replace with:
//	PauseUpdate; Silent 1		// building window...
//	NewPanel /W=(612,44,1612,644)
		
//	NMRPTPro_Master()
Window NMRPTPro() : Panel
	PauseUpdate; Silent 1		// building window...
	NewPanel /W=(612,44,1612,644)
		
	NMRPTPro_Master()
End

//Creates all buttons and displayes ect.  Edit PT here
Function NMRPTPro_Master()		
	Button button1,pos={50,150},size={40,40},proc=ElementSelect,title="H",fSize=20
	Button button3,pos={50,200},size={40,40},proc=ElementSelect,title="Li",fSize=20
	Button button11,pos={50,250},size={40,40},proc=ElementSelect,title="Na", fSize=20
	Button button19,pos={50,300},size={40,40},proc=ElementSelect,title="K", fSize=20
	Button button37,pos={50,350},size={40,40},proc=ElementSelect,title="Rb", fSize=20
	Button button55,pos={50,400},size={40,40},proc=ElementSelect,title="Cs", fSize=20
	Button button87,pos={50,450},size={40,40},proc=ElementSelect,title="Fr", fSize=20

	Button button4,pos={100,200},size={40,40},proc=ElementSelect,title="Be",fSize=20
	Button button12,pos={100,250},size={40,40},proc=ElementSelect,title="Mg", fSize=20
	Button button20,pos={100,300},size={40,40},proc=ElementSelect,title="Ca", fSize=20
	Button button38,pos={100,350},size={40,40},proc=ElementSelect,title="Sr", fSize=20
	Button button56,pos={100,400},size={40,40},proc=ElementSelect,title="Ba", fSize=20
	Button button88,pos={100,450},size={40,40},proc=ElementSelect,title="Ra", fSize=20

	Button button21,pos={150,300},size={40,40},proc=ElementSelect,title="Sc", fSize=20
	Button button39,pos={150,350},size={40,40},proc=ElementSelect,title="Y", fSize=20
	Button button57,pos={150,400},size={40,40},proc=ElementSelect,title="La", fSize=20
	Button button89,pos={150,450},size={40,40},proc=ElementSelect,title="Ac", fSize=20

	Button button22,pos={200,300},size={40,40},proc=ElementSelect,title="Ti", fSize=20
	Button button40,pos={200,350},size={40,40},proc=ElementSelect,title="Zr", fSize=20
	Button button72,pos={200,400},size={40,40},proc=ElementSelect,title="Hf", fSize=20

	Button button23,pos={250,300},size={40,40},proc=ElementSelect,title="V", fSize=20
	Button button41,pos={250,350},size={40,40},proc=ElementSelect,title="Nb", fSize=20
	Button button73,pos={250,400},size={40,40},proc=ElementSelect,title="Ta", fSize=20

	Button button24,pos={300,300},size={40,40},proc=ElementSelect,title="Cr", fSize=20
	Button button42,pos={300,350},size={40,40},proc=ElementSelect,title="Mo", fSize=20
	Button button74,pos={300,400},size={40,40},proc=ElementSelect,title="W", fSize=20

	Button button25,pos={350,300},size={40,40},proc=ElementSelect,title="Mn", fSize=20
	Button button43,pos={350,350},size={40,40},proc=ElementSelect,title="Tc", fSize=20
	Button button75,pos={350,400},size={40,40},proc=ElementSelect,title="Re", fSize=20

	Button button26,pos={400,300},size={40,40},proc=ElementSelect,title="Fe", fSize=20
	Button button44,pos={400,350},size={40,40},proc=ElementSelect,title="Ru", fSize=20
	Button button76,pos={400,400},size={40,40},proc=ElementSelect,title="Os", fSize=20

	Button button27,pos={450,300},size={40,40},proc=ElementSelect,title="Co", fSize=20
	Button button45,pos={450,350},size={40,40},proc=ElementSelect,title="Rh", fSize=20
	Button button77,pos={450,400},size={40,40},proc=ElementSelect,title="Ir", fSize=20
	
	Button button28,pos={500,300},size={40,40},proc=ElementSelect,title="Ni", fSize=20
	Button button46,pos={500,350},size={40,40},proc=ElementSelect,title="Pd", fSize=20
	Button button78,pos={500,400},size={40,40},proc=ElementSelect,title="Pt", fSize=20
	
	Button button29,pos={550,300},size={40,40},proc=ElementSelect,title="Cu", fSize=20
	Button button47,pos={550,350},size={40,40},proc=ElementSelect,title="Ag", fSize=20
	Button button79,pos={550,400},size={40,40},proc=ElementSelect,title="Au", fSize=20
	
	Button button30,pos={600,300},size={40,40},proc=ElementSelect,title="Zn", fSize=20
	Button button48,pos={600,350},size={40,40},proc=ElementSelect,title="Cd", fSize=20
	Button button80,pos={600,400},size={40,40},proc=ElementSelect,title="Hg", fSize=20
	
	Button button5,pos={650,200},size={40,40},proc=ElementSelect,title="B",fSize=20
	Button button13,pos={650,250},size={40,40},proc=ElementSelect,title="Al", fSize=20
	Button button31,pos={650,300},size={40,40},proc=ElementSelect,title="Ga", fSize=20
	Button button49,pos={650,350},size={40,40},proc=ElementSelect,title="In", fSize=20
	Button button81,pos={650,400},size={40,40},proc=ElementSelect,title="Tl", fSize=20

	Button button6,pos={700,200},size={40,40},proc=ElementSelect,title="C",fSize=20
	Button button14,pos={700,250},size={40,40},proc=ElementSelect,title="Si", fSize=20
	Button button32,pos={700,300},size={40,40},proc=ElementSelect,title="Ge", fSize=20
	Button button50,pos={700,350},size={40,40},proc=ElementSelect,title="Sn", fSize=20
	Button button82,pos={700,400},size={40,40},proc=ElementSelect,title="Pb", fSize=20

	Button button7,pos={750,200},size={40,40},proc=ElementSelect,title="N",fSize=20
	Button button15,pos={750,250},size={40,40},proc=ElementSelect,title="P", fSize=20
	Button button33,pos={750,300},size={40,40},proc=ElementSelect,title="As", fSize=20
	Button button51,pos={750,350},size={40,40},proc=ElementSelect,title="Sb", fSize=20
	Button button83,pos={750,400},size={40,40},proc=ElementSelect,title="Bi", fSize=20
	
	Button button8,pos={800,200},size={40,40},proc=ElementSelect,title="O",fSize=20
	Button button16,pos={800,250},size={40,40},proc=ElementSelect,title="S", fSize=20
	Button button34,pos={800,300},size={40,40},proc=ElementSelect,title="Se", fSize=20
	Button button52,pos={800,350},size={40,40},proc=ElementSelect,title="Te", fSize=20
	Button button84,pos={800,400},size={40,40},proc=ElementSelect,title="Po", fSize=20
	
	Button button9,pos={850,200},size={40,40},proc=ElementSelect,title="F",fSize=20
	Button button17,pos={850,250},size={40,40},proc=ElementSelect,title="Cl", fSize=20
	Button button35,pos={850,300},size={40,40},proc=ElementSelect,title="Br", fSize=20
	Button button53,pos={850,350},size={40,40},proc=ElementSelect,title="I", fSize=20
	Button button85,pos={850,400},size={40,40},proc=ElementSelect,title="At", fSize=20
	
	Button button2,pos={900,150},size={40,40},proc=ElementSelect,title="He",fSize=20
	Button button10,pos={900,200},size={40,40},proc=ElementSelect,title="Ne",fSize=20
	Button button18,pos={900,250},size={40,40},proc=ElementSelect,title="Ar", fSize=20
	Button button36,pos={900,300},size={40,40},proc=ElementSelect,title="Kr", fSize=20
	Button button54,pos={900,350},size={40,40},proc=ElementSelect,title="Xe", fSize=20
	Button button86,pos={900,400},size={40,40},proc=ElementSelect,title="Rn", fSize=20
	
	Button button58,pos={200,500},size={40,40},proc=ElementSelect,title="Ce", fSize=20
	Button button90,pos={200,550},size={40,40},proc=ElementSelect,title="Th", fSize=20
	
	Button button59,pos={250,500},size={40,40},proc=ElementSelect,title="Pr", fSize=20
	Button button91,pos={250,550},size={40,40},proc=ElementSelect,title="Pa", fSize=20
	
	Button button60,pos={300,500},size={40,40},proc=ElementSelect,title="Nd", fSize=20
	Button button92,pos={300,550},size={40,40},proc=ElementSelect,title="U", fSize=20

	Button button61,pos={350,500},size={40,40},proc=ElementSelect,title="Pm", fSize=20
	Button button93,pos={350,550},size={40,40},proc=ElementSelect,title="Np", fSize=20

	Button button62,pos={400,500},size={40,40},proc=ElementSelect,title="Sm", fSize=20
	Button button94,pos={400,550},size={40,40},proc=ElementSelect,title="Pu", fSize=20

	Button button63,pos={450,500},size={40,40},proc=ElementSelect,title="Eu", fSize=20
	Button button95,pos={450,550},size={40,40},proc=ElementSelect,title="Am", fSize=20
	
	Button button64,pos={500,500},size={40,40},proc=ElementSelect,title="Gd", fSize=20
	Button button96,pos={500,550},size={40,40},proc=ElementSelect,title="Cm", fSize=20
	
	Button button65,pos={550,500},size={40,40},proc=ElementSelect,title="Tb", fSize=20
	Button button97,pos={550,550},size={40,40},proc=ElementSelect,title="Bk", fSize=20
	
	Button button66,pos={600,500},size={40,40},proc=ElementSelect,title="Dy", fSize=20
	Button button98,pos={600,550},size={40,40},proc=ElementSelect,title="Cf", fSize=20
	
	Button button67,pos={650,500},size={40,40},proc=ElementSelect,title="Ho", fSize=20
	Button button99,pos={650,550},size={40,40},proc=ElementSelect,title="Es", fSize=20
	
	Button button68,pos={700,500},size={40,40},proc=ElementSelect,title="Er", fSize=20
	Button button100,pos={700,550},size={40,40},proc=ElementSelect,title="Fm", fSize=20
	
	Button button69,pos={750,500},size={40,40},proc=ElementSelect,title="Tm", fSize=20
	Button button101,pos={750,550},size={40,40},proc=ElementSelect,title="Md", fSize=20

	Button button70,pos={750,500},size={40,40},proc=ElementSelect,title="Yb", fSize=20
	Button button102,pos={750,550},size={40,40},proc=ElementSelect,title="No", fSize=20
	
	Button button71,pos={800,500},size={40,40},proc=ElementSelect,title="Lu", fSize=20
	Button button103,pos={800,550},size={40,40},proc=ElementSelect,title="Lw", fSize=20

	Button buttoniso0,pos={250, 25},size={90,225},proc=IsotopeSelect
	Button buttoniso0, title=""

	Button buttoniso1,pos={350,25},size={90,225},proc=IsotopeSelect
	Button buttoniso1, title="", disable=0

	Button buttoniso2,pos={450,25},size={90,225},proc=IsotopeSelect
	Button buttoniso2, title="", disable=0

	SetVariable setvarH0, pos={630,25}, value=root:NMRPtPro:H0, size={150,15},fSize=14, title="H\B0\M (T)", proc=setvarHI
	Button calcH0, pos={785, 25}, size={20,20}, proc=CalcHwKGI, title=""
	SetVariable setvarw0, pos={630,55}, value=root:NMRPtPro:w0, size={150,15},fSize=14, title="w\B0\M (MHz)"
	Button calcw0, pos={785, 55}, size={20,20}, proc=CalcHwKGI, title=""
	SetVariable setvarK, pos={630,85}, value=root:NMRPtPro:gK, size={150,15},fSize=14, title="K(%)"
	Button calcK, pos={785, 85}, size={20,20}, proc=CalcHwKGI, title=""
	SetVariable setvargyro, pos={600,115}, value=root:NMRPtPro:ggyro, size={180,15},fSize=14, title="\F'Symbol'g\F'Arial' (MHz/T)"
	SetVariable setvarSYS2I, pos={815,40}, value=root:NMRPtPro:sys2I, size={180,15},fSize=14, title="Sys2 I (A)", proc=setvarHI
	SetVariable setvarDFI pos={815,70}, value=root:NMRPtPro:DFI, size={180,15},fSize=14, title="Dil F (A)", proc=setvarHI

EndMacro

