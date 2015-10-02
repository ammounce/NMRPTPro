#pragma rtGlobals=3		// Use modern global access method and strict wave access.
#pragma IgorVersion=6.37
#pragma version = 0.1

#include ":NMRPTProControls"
#include ":NMRPTProGeneral"
#include ":NMRPTProStructure"

Macro NMRPTPro_Initialize()
	InitNMRPTPro()
	
	CheckNMRPTPro()
end

Function CheckNMRPTPro()

	DoWindow NMRPTPro
	
	if(V_flag==0)	
		Execute "NMRPTPro()"
	elseif(V_flag==1)
		DoWindow/f NMRPTPro
	endif

End

FUnction InitNMRPTPro()
	newdatafolder/o root:NMRPTPro
	setdatafolder root:NMRPTPro
	

	variable/g atomicnumber, iso, spin,gyro, quadmom, ggyro, gK, abundance
	variable/g w0, H0, K, Sys2I, DFI
	
	variable/g SenseH, SenseW
	
	string/g nucleusname

	makenuclearspinwavePT()
	makenucleargyrowavePT()
	makenucleusnamewavePT()
	MakeIsotopewavePT()	
	makequadmomwavePT()
	makeabundancewavePT()
	makesensewavePT()
	makeshiftwavePT()
	makeT1TwavePT()

End


Function MakeNuclearSpinWavePT()

	make/o/n=(104,3) root:NMRPtPro:NuclearSpin=nan
	wave NuclearSpin=root:NMRPtPro:NuclearSpin
	
	
  Nuclearspin[1][0]=1;Nuclearspin[2][0]=1;Nuclearspin[3][0]=2;Nuclearspin[4][0]=3;Nuclearspin[5][0]=6;Nuclearspin[6][0]=1;Nuclearspin[7][0]=2;Nuclearspin[8][0]=5;Nuclearspin[9][0]=1;
Nuclearspin[10][0]=3;Nuclearspin[11][0]=3;Nuclearspin[12][0]=5;Nuclearspin[13][0]=5;Nuclearspin[14][0]=1;Nuclearspin[15][0]=1;Nuclearspin[16][0]=3;Nuclearspin[17][0]=3;Nuclearspin[19][0]=3;
  Nuclearspin[20][0]=7;Nuclearspin[21][0]=7;Nuclearspin[22][0]=5;Nuclearspin[23][0]=12;Nuclearspin[24][0]=3;Nuclearspin[25][0]=5;Nuclearspin[26][0]=1;Nuclearspin[27][0]=7;Nuclearspin[28][0]=3;
Nuclearspin[29][0]=3;Nuclearspin[30][0]=5;Nuclearspin[31][0]=3;Nuclearspin[32][0]=9;Nuclearspin[33][0]=3;Nuclearspin[34][0]=1;Nuclearspin[35][0]=3;Nuclearspin[36][0]=9;Nuclearspin[37][0]=5;
  Nuclearspin[38][0]=9;Nuclearspin[39][0]=1;Nuclearspin[40][0]=5;Nuclearspin[41][0]=9;Nuclearspin[42][0]=5;Nuclearspin[43][0]=9;Nuclearspin[44][0]=5;Nuclearspin[45][0]=1;Nuclearspin[46][0]=5;
Nuclearspin[47][0]=1;Nuclearspin[48][0]=1;Nuclearspin[49][0]=9;Nuclearspin[50][0]=1;Nuclearspin[51][0]=5;Nuclearspin[52][0]=1;Nuclearspin[53][0]=5;Nuclearspin[54][0]=1;Nuclearspin[55][0]=1;
  Nuclearspin[56][0]=3;Nuclearspin[57][0]=7;Nuclearspin[59][0]=5;Nuclearspin[60][0]=7;Nuclearspin[62][0]=7;Nuclearspin[63][0]=5;Nuclearspin[64][0]=3;Nuclearspin[65][0]=3;Nuclearspin[66][0]=3;
Nuclearspin[67][0]=7;Nuclearspin[68][0]=7;Nuclearspin[69][0]=1;Nuclearspin[70][0]=1;Nuclearspin[71][0]=7;Nuclearspin[72][0]=7;Nuclearspin[73][0]=7;Nuclearspin[74][0]=1;Nuclearspin[75][0]=5;
  Nuclearspin[76][0]=1;Nuclearspin[77][0]=3;Nuclearspin[78][0]=1;Nuclearspin[79][0]=3;Nuclearspin[80][0]=1;Nuclearspin[81][0]=1;Nuclearspin[82][0]=1;Nuclearspin[83][0]=9;Nuclearspin[92][0]=7;
Nuclearspin[94][0]=1;

Nuclearspin[1][1]=2;Nuclearspin[3][1]=3;Nuclearspin[5][1]=3;Nuclearspin[7][1]=1;Nuclearspin[17][1]=3;Nuclearspin[19][1]=3;Nuclearspin[22][1]=7;Nuclearspin[23][1]=7;
  Nuclearspin[29][1]=3;Nuclearspin[31][1]=3;Nuclearspin[35][1]=3;Nuclearspin[37][1]=3;Nuclearspin[42][1]=5;Nuclearspin[44][1]=5;Nuclearspin[47][1]=1;Nuclearspin[48][1]=1;Nuclearspin[49][1]=9;
Nuclearspin[50][1]=1;Nuclearspin[51][1]=7;Nuclearspin[52][1]=1;Nuclearspin[54][1]=3;Nuclearspin[56][1]=3;Nuclearspin[60][1]=7;Nuclearspin[62][1]=7;Nuclearspin[63][1]=5;Nuclearspin[64][1]=3;
  Nuclearspin[66][1]=3;Nuclearspin[70][1]=5;Nuclearspin[71][1]=7;Nuclearspin[72][1]=9;Nuclearspin[75][1]=5;Nuclearspin[76][1]=3;Nuclearspin[77][1]=3;Nuclearspin[80][1]=3;Nuclearspin[81][1]=1;
  
  Nuclearspin[1][2]=1;
End

Function MakeNuclearGyroWavePT()

	make/o/n= (104,3) root:NMRPtPro:NuclearGyro=nan
	wave nucleargyro= root:NMRPtPro:NuclearGyro
	
  nucleargyro[1][0]=42.577;nucleargyro[2][0]=32.434;nucleargyro[3][0]=6.2655;nucleargyro[4][0]=5.9833;nucleargyro[5][0]=4.5744;nucleargyro[6][0]=10.705;nucleargyro[7][0]=3.0752;nucleargyro[8][0]=5.7719;
nucleargyro[9][0]=40.059;nucleargyro[10][0]=3.3613;nucleargyro[11][0]=11.262;nucleargyro[12][0]=2.6065;nucleargyro[13][0]=11.094;nucleargyro[14][0]=8.4577;nucleargyro[15][0]=17.236;
  nucleargyro[16][0]=3.2655;nucleargyro[17][0]=4.1717;nucleargyro[19][0]=1.9867;nucleargyro[20][0]=2.8646;nucleargyro[21][0]=10.343;nucleargyro[22][0]=2.4009;nucleargyro[23][0]=2.243;
nucleargyro[24][0]=2.4066;nucleargyro[25][0]=10.5;nucleargyro[26][0]=1.3757;nucleargyro[27][0]=10.03;nucleargyro[28][0]=3.8047;nucleargyro[29][0]=11.285;nucleargyro[30][0]=2.6639;
  nucleargyro[31][0]=10.219;nucleargyro[32][0]=1.4852;nucleargyro[33][0]=7.2919;nucleargyro[34][0]=8.13;nucleargyro[35][0]=10.667;nucleargyro[36][0]=1.6384;nucleargyro[37][0]=4.1099;
nucleargyro[38][0]=1.845;nucleargyro[39][0]=2.0864;nucleargyro[40][0]=3.9581;nucleargyro[41][0]=10.405;nucleargyro[42][0]=2.7747;nucleargyro[43][0]=9.5831;nucleargyro[44][0]=1.9607;
  nucleargyro[45][0]=1.3455;nucleargyro[46][0]=1.9484;nucleargyro[47][0]=1.723;nucleargyro[48][0]=9.028;nucleargyro[49][0]=9.3092;nucleargyro[50][0]=10.189;nucleargyro[51][0]=11.16;
nucleargyro[52][0]=8.557;nucleargyro[53][0]=11.776;nucleargyro[54][0]=5.5844;nucleargyro[55][0]=5.5844;nucleargyro[56][0]=4.2295;nucleargyro[57][0]=6.0146;nucleargyro[59][0]=12.471;
  nucleargyro[60][0]=2.33;nucleargyro[62][0]=1.76;nucleargyro[63][0]=10.49;nucleargyro[64][0]=1.28;nucleargyro[65][0]=10.1;nucleargyro[66][0]=1.4027;nucleargyro[67][0]=8.91;nucleargyro[68][0]=1.2305;
nucleargyro[69][0]=3.51;nucleargyro[70][0]=7.44;nucleargyro[71][0]=4.857;nucleargyro[72][0]=1.3286;nucleargyro[73][0]=5.096;nucleargyro[74][0]=1.7716;nucleargyro[75][0]=9.5854;
  nucleargyro[76][0]=0.97174;nucleargyro[77][0]=0.73191;nucleargyro[78][0]=9.094;nucleargyro[79][0]=0.72919;nucleargyro[80][0]=7.5901;nucleargyro[81][0]=24.327;nucleargyro[82][0]=8.874;
nucleargyro[83][0]=6.8418;nucleargyro[92][0]=0.7623;nucleargyro[94][0]=2.39;

  nucleargyro[1][1]=6.5359;nucleargyro[3][1]=16.547;nucleargyro[5][1]=13.655;nucleargyro[7][1]=3.3143;nucleargyro[17][1]=3.4725;nucleargyro[19][1]=1.0905;nucleargyro[22][1]=2.4003;
nucleargyro[23][1]=11.193;nucleargyro[29][1]=12.089;nucleargyro[31][1]=12.985;nucleargyro[35][1]=11.499;nucleargyro[37][1]=13.932;nucleargyro[42][1]=2.8329;nucleargyro[44][1]=2.1976;
  nucleargyro[47][1]=1.9808;nucleargyro[48][1]=9.446;nucleargyro[49][1]=15.867;nucleargyro[50][1]=5.5176;nucleargyro[51][1]=13.454;nucleargyro[53][1]=3.4911;nucleargyro[56][1]=4.7316;
nucleargyro[60][1]=1.4244;nucleargyro[62][1]=1.45;nucleargyro[63][1]=4.632;nucleargyro[64][1]=1.71;nucleargyro[66][1]=1.9515;nucleargyro[70][1]=2.05;nucleargyro[71][1]=3.43;nucleargyro[72][1]=0.7962;
  nucleargyro[75][1]=9.6839;nucleargyro[76][1]=3.3063;nucleargyro[77][1]=0.79684;nucleargyro[80][1]=2.802;nucleargyro[81][1]=24.567;

  nucleargyro[1][2]=45.414;
  End

Function MakeNucleusNameWavePT()

	make/t/o/n=104 root:NMRPtPro:NucleusNamewave
	wave/t nucleusname=root:NMRPtPro:Nucleusnamewave
	
 NucleusName[1][0]="H";NucleusName[2][0]="He";NucleusName[3][0]="Li";NucleusName[4][0]="Be";NucleusName[5][0]="B";NucleusName[6][0]="C";NucleusName[7][0]="N";NucleusName[8][0]="O";NucleusName[9][0]="F";
NucleusName[10][0]="Ne";NucleusName[11][0]="Na";NucleusName[12][0]="Mg";NucleusName[13][0]="Al";NucleusName[14][0]="Si";NucleusName[15][0]="P";NucleusName[16][0]="S";NucleusName[17][0]="Cl";NucleusName[18][0]="Ar";
  NucleusName[19][0]="K";NucleusName[20][0]="Ca";NucleusName[21][0]="Sc";NucleusName[22][0]="Ti";NucleusName[23][0]="V";NucleusName[24][0]="Cr";NucleusName[25][0]="Mn";NucleusName[26][0]="Fe";NucleusName[27][0]="Co";
NucleusName[28][0]="Ni";NucleusName[29][0]="Cu";NucleusName[30][0]="Zn";NucleusName[31][0]="Ga";NucleusName[32][0]="Ge";NucleusName[33][0]="As";NucleusName[34][0]="Se";NucleusName[35][0]="Br";NucleusName[36][0]="Kr";
  NucleusName[37][0]="Rb";NucleusName[38][0]="Sr";NucleusName[39][0]="Y";NucleusName[40][0]="Zr";NucleusName[41][0]="Nb";NucleusName[42][0]="Mo";NucleusName[43][0]="Tc";NucleusName[44][0]="Ru";NucleusName[45][0]="Rh";
NucleusName[46][0]="Pd";NucleusName[47][0]="Ag";NucleusName[48][0]="Cd";NucleusName[49][0]="In";NucleusName[50][0]="Sn";NucleusName[51][0]="Sb";NucleusName[52][0]="Te";NucleusName[53][0]="I";NucleusName[54][0]="Xe";
  NucleusName[55][0]="Cs";NucleusName[56][0]="Ba";NucleusName[57][0]="La";NucleusName[58][0]="Ce";NucleusName[59][0]="Pr";NucleusName[60][0]="Nd";NucleusName[61][0]="Pm";NucleusName[62][0]="Sm";NucleusName[63][0]="Eu";
NucleusName[64][0]="Gd";NucleusName[65][0]="Tb";NucleusName[66][0]="Dy";NucleusName[67][0]="Ho";NucleusName[68][0]="Er";NucleusName[69][0]="Tm";NucleusName[70][0]="Yb";NucleusName[71][0]="Lu";NucleusName[72][0]="Hf";
  NucleusName[73][0]="Ta";NucleusName[74][0]="W";NucleusName[75][0]="Re";NucleusName[76][0]="Os";NucleusName[77][0]="Ir";NucleusName[78][0]="Pt";NucleusName[79][0]="Au";NucleusName[80][0]="Hg";NucleusName[81][0]="Tl";
NucleusName[82][0]="Pb";NucleusName[83][0]="Bi";NucleusName[84][0]="Po";NucleusName[85][0]="At";NucleusName[86][0]="Rn";NucleusName[87][0]="Fr";NucleusName[88][0]="Ra";NucleusName[89][0]="Ac";NucleusName[90][0]="Th";
  NucleusName[91][0]="Pa";NucleusName[92][0]="U";NucleusName[93][0]="Np";NucleusName[94][0]="Pu";NucleusName[95][0]="Am";NucleusName[96][0]="Cm";NucleusName[97][0]="Bk";NucleusName[98][0]="Cf";NucleusName[99][0]="Es";
NucleusName[100][0]="Fm";NucleusName[101][0]="Md";NucleusName[102][0]="No";NucleusName[103][0]="Lw";	
end

Function MakeIsotopewavePT()

	make/o/n=(104,3) root:NMRPtPro:IsotopeNumber
	wave isowave=root:NMRPtPro:isotopenumber
	
  isowave[1][0]=1;isowave[2][0]=3;isowave[3][0]=6;isowave[4][0]=9;isowave[5][0]=10;isowave[6][0]=13;isowave[7][0]=14;isowave[8][0]=17;
isowave[9][0]=19;isowave[10][0]=21;isowave[11][0]=23;isowave[12][0]=25;isowave[13][0]=27;isowave[14][0]=29;isowave[15][0]=31;isowave[16][0]=33;
  isowave[17][0]=35;isowave[19][0]=39;isowave[20][0]=43;isowave[21][0]=45;isowave[22][0]=47;isowave[23][0]=50;isowave[24][0]=53;isowave[25][0]=55;
isowave[26][0]=57;isowave[27][0]=59;isowave[28][0]=61;isowave[29][0]=63;isowave[30][0]=67;isowave[31][0]=69;isowave[32][0]=73;isowave[33][0]=75;
  isowave[34][0]=77;isowave[35][0]=79;isowave[36][0]=83;isowave[37][0]=85;isowave[38][0]=87;isowave[39][0]=89;isowave[40][0]=91;isowave[41][0]=93;
isowave[42][0]=95;isowave[43][0]=99;isowave[44][0]=99;isowave[45][0]=103;isowave[46][0]=105;isowave[47][0]=107;isowave[48][0]=111;isowave[49][0]=113;
  isowave[50][0]=117;isowave[51][0]=121;isowave[52][0]=123;isowave[53][0]=127;isowave[54][0]=129;isowave[55][0]=133;isowave[56][0]=135;isowave[57][0]=139;
  isowave[59][0]=141;isowave[60][0]=143;isowave[62][0]=147;isowave[63][0]=151;isowave[64][0]=155;isowave[65][0]=153;isowave[66][0]=161;isowave[67][0]=165;
  isowave[68][0]=167;isowave[69][0]=169;isowave[70][0]=171;isowave[71][0]=175;isowave[72][0]=177;isowave[73][0]=181;isowave[74][0]=183;isowave[75][0]=185;
  isowave[76][0]=187;isowave[77][0]=191;isowave[78][0]=195;isowave[79][0]=197;isowave[80][0]=199;isowave[81][0]=203;isowave[82][0]=207;isowave[83][0]=209;
isowave[92][0]=235;isowave[94][0]=239;

isowave[1][1]=2;isowave[3][1]=7;isowave[5][1]=11;isowave[7][1]=15;isowave[17][1]=37;isowave[19][1]=41;
  isowave[22][1]=49;isowave[23][1]=51;isowave[29][1]=65;isowave[31][1]=71;isowave[35][1]=81;isowave[37][1]=87;isowave[42][1]=97;isowave[44][1]=101;
isowave[47][1]=109;isowave[48][1]=113;isowave[49][1]=115;isowave[50][1]=119;isowave[51][1]=123;isowave[52][1]=125;isowave[54][1]=131;isowave[56][1]=137;
  isowave[60][1]=145;isowave[62][1]=149;isowave[63][1]=153;isowave[64][1]=157;isowave[66][1]=163;isowave[70][1]=173;isowave[71][1]=176;isowave[72][1]=179;
isowave[75][1]=187;isowave[76][1]=189;isowave[77][1]=193;isowave[80][1]=201;isowave[81][1]=205;

isowave[1][2]=3;

End	

Function MakeQuadMomWavePT()
	
	make/o/n=(104,3)  root:NMRPtPro:QuadMomentwave=nan
	wave quadmomentwave=root:NMRPtPro:QuadMomentwave
quadmomentwave[3][0]=-0.0008;quadmomentwave[4][0]=0.052;quadmomentwave[5][0]=0.074;quadmomentwave[7][0]=0.016;quadmomentwave[8][0]=-0.026;quadmomentwave[10][0]=0.09;
quadmomentwave[11][0]=0.12;quadmomentwave[12][0]=0.22;quadmomentwave[13][0]=0.149;quadmomentwave[16][0]=-0.055;quadmomentwave[17][0]=-0.08;quadmomentwave[19][0]=0.055;quadmomentwave[20][0]=-0.05;
  quadmomentwave[21][0]=-0.22;quadmomentwave[22][0]=0.29;quadmomentwave[23][0]=0.21;quadmomentwave[24][0]=0.03;quadmomentwave[25][0]=0.55;quadmomentwave[27][0]=0.4;quadmomentwave[29][0]=-0.211;
quadmomentwave[30][0]=0.15;quadmomentwave[31][0]=0.178;quadmomentwave[32][0]=-0.22;quadmomentwave[33][0]=0.29;quadmomentwave[35][0]=0.33;quadmomentwave[36][0]=0.23;quadmomentwave[37][0]=0.26;
  quadmomentwave[38][0]=0.36;quadmomentwave[40][0]=27.876;quadmomentwave[41][0]=-0.22;quadmomentwave[42][0]=0.12;quadmomentwave[44][0]=0.076;quadmomentwave[46][0]=0.8;quadmomentwave[49][0]=1.14;
quadmomentwave[51][0]=-0.53;quadmomentwave[53][0]=-0.79;quadmomentwave[55][0]=-0.003;quadmomentwave[56][0]=0.18;quadmomentwave[57][0]=0.21;quadmomentwave[60][0]=-0.5;quadmomentwave[62][0]=-0.2;
  quadmomentwave[63][0]=0.95;quadmomentwave[64][0]=1.3;quadmomentwave[65][0]=1.3;quadmomentwave[66][0]=2.3;quadmomentwave[67][0]=3;quadmomentwave[68][0]=2.8;quadmomentwave[71][0]=5.6;
quadmomentwave[72][0]=4.5;quadmomentwave[73][0]=3;quadmomentwave[75][0]=2.8;quadmomentwave[77][0]=1.5;quadmomentwave[79][0]=0.58;quadmomentwave[83][0]=-0.34;quadmomentwave[1][1]=0.00273;
  quadmomentwave[3][1]=-0.045;quadmomentwave[5][1]=0.0355;quadmomentwave[17][1]=-0.0632;quadmomentwave[19][1]=0.067;quadmomentwave[22][1]=0.24;quadmomentwave[23][1]=-0.052;quadmomentwave[29][1]=-0.195;
quadmomentwave[31][1]=0.112;quadmomentwave[35][1]=0.28;quadmomentwave[37][1]=0.12;quadmomentwave[42][1]=1.1;quadmomentwave[44][1]=0.44;quadmomentwave[49][1]=0.83;quadmomentwave[51][1]=-0.68;
  quadmomentwave[54][1]=-0.12;quadmomentwave[56][1]=0.28;quadmomentwave[60][1]=-0.3;quadmomentwave[62][1]=0.058;quadmomentwave[63][1]=2.42;quadmomentwave[64][1]=1.5;quadmomentwave[66][1]=2.5;
quadmomentwave[70][1]=2.8;quadmomentwave[71][1]=8.1;quadmomentwave[72][1]=5.1;quadmomentwave[75][1]=2.6;quadmomentwave[76][1]=0.8;quadmomentwave[77][1]=1.4;quadmomentwave[80][1]=0.45;
	

End

Function MakeAbundancewavePT()
	
	make/o/n=(104,3)  root:NMRPtPro:Abundancewave=nan
	wave abundancewave=root:NMRPtPro:Abundancewave
	
  Abundancewave[1][0]=99.99;Abundancewave[2][0]=0.0001;Abundancewave[3][0]=7.5;Abundancewave[4][0]=100;Abundancewave[5][0]=19.8;Abundancewave[6][0]=1.11;Abundancewave[7][0]=99.6;
Abundancewave[8][0]=0.039;Abundancewave[9][0]=100;Abundancewave[10][0]=0.27;Abundancewave[11][0]=100;Abundancewave[12][0]=10;Abundancewave[13][0]=100;Abundancewave[14][0]=4.7;Abundancewave[15][0]=100;
  Abundancewave[16][0]=0.75;Abundancewave[17][0]=75.77;Abundancewave[19][0]=93.3;Abundancewave[20][0]=0.14;Abundancewave[21][0]=100;Abundancewave[22][0]=7.5;Abundancewave[23][0]=0.25;
Abundancewave[24][0]=9.5;Abundancewave[25][0]=100;Abundancewave[26][0]=2.14;Abundancewave[27][0]=100;Abundancewave[28][0]=1.1;Abundancewave[29][0]=69.1;Abundancewave[30][0]=4.1;
  Abundancewave[31][0]=60;Abundancewave[32][0]=7.7;Abundancewave[33][0]=100;Abundancewave[34][0]=7.5;Abundancewave[35][0]=50.69;Abundancewave[36][0]=11.5;Abundancewave[37][0]=72.17;
Abundancewave[38][0]=7;Abundancewave[39][0]=100;Abundancewave[40][0]=11.2;Abundancewave[41][0]=100;Abundancewave[42][0]=15.9;Abundancewave[43][0]=0;Abundancewave[44][0]=12.7;Abundancewave[45][0]=100;
  Abundancewave[46][0]=22.2;Abundancewave[47][0]=51.83;Abundancewave[48][0]=12.6;Abundancewave[49][0]=4.3;Abundancewave[50][0]=7.6;Abundancewave[51][0]=57.3;Abundancewave[52][0]=0.87;
Abundancewave[53][0]=100;Abundancewave[54][0]=26.4;Abundancewave[55][0]=100;Abundancewave[56][0]=6.5;Abundancewave[57][0]=99.1;Abundancewave[59][0]=100;Abundancewave[60][0]=12.2;
  Abundancewave[62][0]=15;Abundancewave[63][0]=47.9;Abundancewave[64][0]=14.9;Abundancewave[65][0]=100;Abundancewave[66][0]=18.9;Abundancewave[67][0]=100;Abundancewave[68][0]=22.9;
Abundancewave[69][0]=100;Abundancewave[70][0]=14.3;Abundancewave[71][0]=97.4;Abundancewave[72][0]=18.5;Abundancewave[73][0]=100;Abundancewave[74][0]=14.3;Abundancewave[75][0]=37.5;
  Abundancewave[76][0]=1.6;Abundancewave[77][0]=37.4;Abundancewave[78][0]=33.8;Abundancewave[79][0]=100;Abundancewave[80][0]=16.9;Abundancewave[81][0]=29.5;Abundancewave[82][0]=22.1;
Abundancewave[83][0]=100;Abundancewave[1][1]=0.015;Abundancewave[3][1]=92.5;Abundancewave[5][1]=80.2;Abundancewave[7][1]=0.36;Abundancewave[17][1]=24.6;Abundancewave[19][1]=6.7;
  Abundancewave[22][1]=5.5;Abundancewave[23][1]=99.75;Abundancewave[29][1]=30.9;Abundancewave[31][1]=40;Abundancewave[35][1]=49.31;Abundancewave[37][1]=27.83;Abundancewave[42][1]=9.5;
Abundancewave[44][1]=17.1;Abundancewave[47][1]=48.17;Abundancewave[48][1]=12.3;Abundancewave[49][1]=95.7;Abundancewave[50][1]=8.6;Abundancewave[51][1]=42.7;Abundancewave[52][1]=7;
  Abundancewave[54][1]=21.2;Abundancewave[56][1]=11.2;Abundancewave[60][1]=8.3;Abundancewave[62][1]=13.8;Abundancewave[63][1]=52.2;Abundancewave[64][1]=15.7;Abundancewave[66][1]=24.9;
Abundancewave[70][1]=16.2;Abundancewave[71][1]=2.6;Abundancewave[72][1]=13.8;Abundancewave[75][1]=62.5;Abundancewave[76][1]=16.1;Abundancewave[77][1]=62.6;Abundancewave[80][1]=13.2;Abundancewave[81][1]=70.5;
	

End
Function MakeSensewavePT()
	
	make/o/n=(104,3)  root:NMRPtPro:sensewave=nan
	wave sensewave=root:NMRPtPro:sensewave
	
 sensewave[1][0]=1;sensewave[3][0]=0.00063;sensewave[4][0]=0.01382;sensewave[5][0]=0.00386;sensewave[6][0]=0.0002;sensewave[7][0]=0.001;sensewave[8][0]=1.1e-05;sensewave[9][0]=0.82982;
sensewave[10][0]=6e-06;sensewave[11][0]=0.09211;sensewave[12][0]=0.00027;sensewave[13][0]=0.20526;sensewave[14][0]=0.0004;sensewave[15][0]=0.06614;sensewave[16][0]=1.7e-05;sensewave[17][0]=0.00354;
  sensewave[19][0]=0.00047;sensewave[20][0]=9.2e-06;sensewave[21][0]=0.3;sensewave[22][0]=0.00015;sensewave[23][0]=0.0001;sensewave[24][0]=9e-05;sensewave[25][0]=0.17439;sensewave[26][0]=7.4e-07;
sensewave[27][0]=0.27544;sensewave[28][0]=4e-05;sensewave[29][0]=0.06404;sensewave[30][0]=0.00012;sensewave[31][0]=0.04158;sensewave[32][0]=0.0001;sensewave[33][0]=0.02509;sensewave[34][0]=0.00052;
  sensewave[35][0]=0.03865;sensewave[36][0]=0.0002;sensewave[37][0]=0.00754;sensewave[38][0]=0.00019;sensewave[39][0]=0.0001;sensewave[40][0]=0.00106;sensewave[41][0]=0.4807;sensewave[42][0]=0.0005;
sensewave[43][0]=0.37439;sensewave[44][0]=0.00015;sensewave[45][0]=3.1e-05;sensewave[46][0]=0.0002;sensewave[47][0]=3.4e-05;sensewave[48][0]=0.00122;sensewave[49][0]=0.0147;sensewave[50][0]=0.0034;
  sensewave[51][0]=0.09123;sensewave[52][0]=0.00016;sensewave[53][0]=0.09298;sensewave[54][0]=0.0056;sensewave[55][0]=0.04719;sensewave[56][0]=0.00032;sensewave[57][0]=0.0589;sensewave[59][0]=0.2982;
sensewave[60][0]=0.0004;sensewave[62][0]=2.2e-05;sensewave[63][0]=0.08421;sensewave[64][0]=4e-05;sensewave[65][0]=0.05789;sensewave[66][0]=7.9e-05;sensewave[67][0]=0.17544;sensewave[68][0]=0.0001;
  sensewave[69][0]=0.00056;sensewave[70][0]=0.00071;sensewave[71][0]=0.02737;sensewave[72][0]=0.00015;sensewave[73][0]=0.0358;sensewave[74][0]=1e-05;sensewave[75][0]=0.04912;sensewave[76][0]=2e-07;
sensewave[77][0]=4e-06;sensewave[78][0]=0.0034;sensewave[79][0]=1.1e-05;sensewave[80][0]=0.00095;sensewave[81][0]=0.0507;sensewave[82][0]=0.0021;sensewave[83][0]=0.13632;sensewave[1][1]=1.4e-06;
  sensewave[3][1]=0.27018;sensewave[5][1]=0.13228;sensewave[7][1]=3.8e-06;sensewave[17][1]=0.00066;sensewave[19][1]=5.8e-06;sensewave[22][1]=0.00021;sensewave[23][1]=0.3789;sensewave[29][1]=0.03526;
sensewave[31][1]=0.05596;sensewave[35][1]=0.0486;sensewave[37][1]=0.0486;sensewave[42][1]=0.0003;sensewave[44][1]=0.00027;sensewave[47][1]=4.8e-05;sensewave[48][1]=0.00133;sensewave[49][1]=0.33158;
  sensewave[50][1]=0.0044;sensewave[51][1]=0.01947;sensewave[52][1]=0.00219;sensewave[54][1]=0.0006;sensewave[56][1]=0.00077;sensewave[60][1]=6e-05;sensewave[62][1]=0.0001;sensewave[63][1]=0.00789;
sensewave[64][1]=8e-05;sensewave[66][1]=0.00028;sensewave[70][1]=0.0002;sensewave[71][1]=0.0009;sensewave[72][1]=4.7e-05;sensewave[75][1]=0.08596;sensewave[76][1]=0.00037;sensewave[77][1]=8.8e-06;
  sensewave[80][1]=0.00019;sensewave[81][1]=0.13291;
	

End

Function MakeshiftwavePT()
	
	make/o/n=104  root:NMRPtPro:shiftwave=nan
	wave shiftwave=root:NMRPtPro:shiftwave
	
shiftwave[3][0]=42;shiftwave[4][0]=-0.0025;shiftwave[5][0]=0.09;shiftwave[6][0]=0.01;shiftwave[11][0]=0.113;shiftwave[12][0]=0.112;shiftwave[13][0]=0.164;shiftwave[14][0]=0.19;
shiftwave[19][0]=0.26;shiftwave[20][0]=0.31;shiftwave[21][0]=0.253;shiftwave[22][0]=0.4;shiftwave[23][0]=0.58;shiftwave[24][0]=0.69;shiftwave[25][0]=0.375;shiftwave[29][0]=0.2394;shiftwave[30][0]=0.2;
  shiftwave[31][0]=0.155;shiftwave[34][0]=0.062;shiftwave[37][0]=0.651;shiftwave[38][0]=0.9;shiftwave[39][0]=0.352;shiftwave[41][0]=0.87;shiftwave[42][0]=0.61;shiftwave[43][0]=0.72;
shiftwave[45][0]=0.4122;shiftwave[46][0]=-3.05;shiftwave[47][0]=0.525;shiftwave[48][0]=0.415;shiftwave[49][0]=0.82;shiftwave[50][0]=0.735;shiftwave[52][0]=-0.062;shiftwave[55][0]=1.49;
  shiftwave[56][0]=0.403;shiftwave[57][0]=0.005;shiftwave[70][0]=0.01;shiftwave[73][0]=1.1;shiftwave[74][0]=0.104;shiftwave[75][0]=1.02;shiftwave[77][0]=1.3;shiftwave[78][0]=-2.918;
shiftwave[79][0]=1.65;shiftwave[80][0]=2.72;shiftwave[81][0]=1.55;shiftwave[82][0]=1.5;shiftwave[83][0]=-1.25;
	

End

Function MakeT1TwavePT()
	
	make/o/n=(104,3)  root:NMRPtPro:T1Twave=nan
	wave T1Twave=root:NMRPtPro:T1Twave
	
 T1Twave[1][0]=1016;T1Twave[4][0]=18000;T1Twave[6][0]=27000;T1Twave[11][0]=4.6;T1Twave[13][0]=1.85;T1Twave[14][0]=50000;T1Twave[19][0]=25;T1Twave[21][0]=1.3;T1Twave[22][0]=150;T1Twave[25][0]=0.21;
T1Twave[29][0]=1.27;T1Twave[31][0]=0.46;T1Twave[32][0]=2655;T1Twave[34][0]=6.4;T1Twave[37][0]=0.048;T1Twave[39][0]=15;T1Twave[41][0]=0.36;T1Twave[42][0]=30;T1Twave[43][0]=0.8;T1Twave[45][0]=9;
  T1Twave[46][0]=0.72;T1Twave[47][0]=8.7;T1Twave[48][0]=0.35;T1Twave[55][0]=0.11;T1Twave[57][0]=0.45;T1Twave[74][0]=39;T1Twave[77][0]=2.8;T1Twave[78][0]=0.033;T1Twave[79][0]=4.6;T1Twave[80][0]=0.016;
T1Twave[82][0]=0.025;T1Twave[3][1]=0.026;T1Twave[23][1]=0.79;T1Twave[49][1]=0.079;T1Twave[50][1]=0.045;T1Twave[52][1]=6000;	
	

End

Function Printname()

	wave/t nucleusname=root:NMRPtPro:nucleusname
	
	string output, output2, output3
	variable i=1
	
	output="NucleusName["+num2istr(i)+"][0]="+nucleusname[i][0]+";"
	
	do
		i+=1
		output+="NucleusName["+num2istr(i)+"][0]="+nucleusname[i][0]+";"
	while(i<dimsize(nucleusname,0)-1)
	
	print output
		
	i=1
	output2="NucleusName["+num2istr(i)+"][1]="+nucleusname[i][1]+";"

	do
		i+=1
		if(strlen(nucleusname[i][1])>0)
			output2+="NucleusName["+num2istr(i)+"][1]="+nucleusname[i][1]+";"
		endif
	while(i<dimsize(nucleusname,0)-1)
	
	print output2
	i=1	
	
	output3="NucleusName["+num2istr(i)+"][2]="+nucleusname[i][2]+";"

	do
		i+=1
		if(strlen(nucleusname[i][2])>0)
			output+="NucleusName["+num2istr(i)+"][2]="+nucleusname[i][2]+";"
		endif
	while(i<dimsize(nucleusname,0)-1)
	
	print output3
	
end

Function PrintSpin()
	wave spinwave=root:NMRPtPro:nuclearspin
	
	variable i=1, j=0
	
	string output
	output="Nuclearspin["+num2str(i)+"]["+num2str(j)+"]="+num2str(spinwave[i][j])+";"
	
	do
		do
			i+=1
			if(numtype(spinwave[i][j])!=2)
				output+="Nuclearspin["+num2str(i)+"]["+num2str(j)+"]="+num2str(spinwave[i][j])+";"
			endif
		while(i<103)
		i=0
		j+=1
	while(j<3)
		
	
	print output
	
end

Function PrintIso()
	wave isowave=root:NMRPtPro:isotopenumber
	
	variable i=1, j=0
	
	string output
	output="IsotopeNumber["+num2str(i)+"]["+num2str(j)+"]="+num2str(isowave[i][j])+";"
	
	do
		do
			i+=1
			if(numtype(isowave[i][j])!=2)
				output+="IsotopeNumber["+num2str(i)+"]["+num2str(j)+"]="+num2str(isowave[i][j])+";"
			endif
		while(i<103)
		i=0
		j+=1
	while(j<3)
		
	
	print output
	
end

Function PrintAbund()
	wave abundwave=root:NMRPtPro:abundancewave
	
	variable i=1, j=0
	
	string output
	output="Abundancewave["+num2str(i)+"]["+num2str(j)+"]="+num2str(abundwave[i][j])+";"
	
	do
		do
			i+=1
			if(numtype(abundwave[i][j])!=2)
				output+="Abundancewave["+num2str(i)+"]["+num2str(j)+"]="+num2str(abundwave[i][j])+";"
			endif
		while(i<103)
		i=0
		j+=1
	while(j<3)
		
	
	print output
	
end

Function PrintQuad()
	wave quadwave=root:NMRPtPro:quadmomentwave
	
	variable i=1, j=0
	
	string output
	output="Quadmomentwave["+num2str(i)+"]["+num2str(j)+"]="+num2str(quadwave[i][j])+";"
	
	do
		do
			i+=1
			if(numtype(quadwave[i][j])!=2)
				output+="quadmomentwave["+num2str(i)+"]["+num2str(j)+"]="+num2str(quadwave[i][j])+";"
			endif
		while(i<103)
		i=0
		j+=1
	while(j<3)
		
	
	print output
	
end

Function Printsense()
	wave sensewave=root:NMRPtPro:sensewave
	
	variable i=1, j=0
	
	string output
	output="sensewave["+num2str(i)+"]["+num2str(j)+"]="+num2str(sensewave[i][j])+";"
	
	do
		do
			i+=1
			if(numtype(sensewave[i][j])!=2)
				output+="sensewave["+num2str(i)+"]["+num2str(j)+"]="+num2str(sensewave[i][j])+";"
			endif
		while(i<103)
		i=0
		j+=1
	while(j<3)
		
	print output
	
end

Function Printshift()
	wave shiftwave=root:NMRPtPro:shiftwave
	
	variable i=1, j=0
	
	string output
	output="shiftwave["+num2str(i)+"]["+num2str(j)+"]="+num2str(shiftwave[i][j])+";"
	
	do
		do
			i+=1
			if(numtype(shiftwave[i][j])!=2)
				output+="shiftwave["+num2str(i)+"]["+num2str(j)+"]="+num2str(shiftwave[i][j])+";"
			endif
		while(i<103)
		i=0
		j+=1
	while(j<1)
		
	print output
	
end

Function PrintT1T()
	wave T1Twave=root:NMRPtPro:T1Twave
	
	variable i=1, j=0
	
	string output
	output="T1Twave["+num2str(i)+"]["+num2str(j)+"]="+num2str(T1Twave[i][j])+";"
	
	do
		do
			i+=1
			if(numtype(T1Twave[i][j])!=2)
				output+="T1Twave["+num2str(i)+"]["+num2str(j)+"]="+num2str(T1Twave[i][j])+";"
			endif
		while(i<103)
		i=0
		j+=1
	while(j<3)
		
	print output
	
end

Function Printgyro()

	wave nucleargyro=root:NMRPtPro:nucleargyrosource
	
	string output, output2, output3
	variable i=1
	
	output="nucleargyro["+num2istr(i)+"][0]="+num2str(nucleargyro[i][0])+";"
	
	do
		i+=1
		if(nucleargyro[i][0]>0)
			output+="nucleargyro["+num2istr(i)+"][0]="+num2str(nucleargyro[i][0])+";"
		endif
	while(i<dimsize(nucleargyro,0)-1)
	
	print output
		
	i=1
	output2="nucleargyro["+num2istr(i)+"][1]="+num2str(nucleargyro[i][1])+";"

	do
		i+=1
		if(nucleargyro[i][1]>0)
			output2+="nucleargyro["+num2istr(i)+"][1]="+num2str(nucleargyro[i][1])+";"
		endif
	while(i<dimsize(nucleargyro,0)-1)
	
	print output2
	i=1	
	
	output3="nucleargyro["+num2istr(i)+"][2]="+num2str(nucleargyro[i][2])+";"

	do
		i+=1
		if(nucleargyro[i][2]>0)
			output+="nucleargyro["+num2istr(i)+"][2]="+num2str(nucleargyro[i][2])+";"
		endif
	while(i<dimsize(nucleargyro,0)-1)
	
	print output3
	
end


Window NMRPTPro() : Panel
	PauseUpdate; Silent 1		// building window...
	NewPanel /W=(612,44,1612,644)
		
	NMRPTPro_Master()
	
End


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

	Button buttoniso3,pos={340,25},size={120,225},proc=IsotopeSelect
	Button buttoniso3, title=""

	Button buttoniso2,pos={470,25},size={120,225},proc=IsotopeSelect
	Button buttoniso2, title=""

	Button buttoniso1,pos={210, 25},size={120,225},proc=IsotopeSelect
	Button buttoniso1, title=""

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

Window nmrperiodictablepluscalc() : Panel
	PauseUpdate; Silent 1		// building window...
	NewPanel /W=(1,44,1005,903)
	Button button1,pos={50,150},size={40,40},proc=ElementSelect,title="H",fSize=20
	Button button3,pos={50,200},size={40,40},proc=ElementSelect,title="Li",fSize=20
	Button button11,pos={50,250},size={40,40},proc=ElementSelect,title="Na",fSize=20
	Button button19,pos={50,300},size={40,40},proc=ElementSelect,title="K",fSize=20
	Button button37,pos={50,350},size={40,40},proc=ElementSelect,title="Rb",fSize=20
	Button button55,pos={50,400},size={40,40},proc=ElementSelect,title="Cs",fSize=20
	Button button87,pos={50,450},size={40,40},proc=ElementSelect,title="Fr",fSize=20
	Button button4,pos={100,200},size={40,40},proc=ElementSelect,title="Be",fSize=20
	Button button12,pos={100,250},size={40,40},proc=ElementSelect,title="Mg"
	Button button12,fSize=20
	Button button20,pos={100,300},size={40,40},proc=ElementSelect,title="Ca"
	Button button20,fSize=20
	Button button38,pos={100,350},size={40,40},proc=ElementSelect,title="Sr"
	Button button38,fSize=20
	Button button56,pos={100,400},size={40,40},proc=ElementSelect,title="Ba"
	Button button56,fSize=20
	Button button88,pos={100,450},size={40,40},proc=ElementSelect,title="Ra"
	Button button88,fSize=20
	Button button21,pos={150,300},size={40,40},proc=ElementSelect,title="Sc"
	Button button21,fSize=20
	Button button39,pos={150,350},size={40,40},proc=ElementSelect,title="Y",fSize=20
	Button button57,pos={150,400},size={40,40},proc=ElementSelect,title="La"
	Button button57,fSize=20
	Button button89,pos={150,450},size={40,40},proc=ElementSelect,title="Ac"
	Button button89,fSize=20
	Button button22,pos={200,300},size={40,40},proc=ElementSelect,title="Ti"
	Button button22,fSize=20
	Button button40,pos={200,350},size={40,40},proc=ElementSelect,title="Zr"
	Button button40,fSize=20
	Button button72,pos={200,400},size={40,40},proc=ElementSelect,title="Hf"
	Button button72,fSize=20
	Button button23,pos={250,300},size={40,40},proc=ElementSelect,title="V",fSize=20
	Button button41,pos={250,350},size={40,40},proc=ElementSelect,title="Nb"
	Button button41,fSize=20
	Button button73,pos={250,400},size={40,40},proc=ElementSelect,title="Ta"
	Button button73,fSize=20
	Button button24,pos={300,300},size={40,40},proc=ElementSelect,title="Cr"
	Button button24,fSize=20
	Button button42,pos={300,350},size={40,40},proc=ElementSelect,title="Mo"
	Button button42,fSize=20
	Button button74,pos={300,400},size={40,40},proc=ElementSelect,title="W",fSize=20
	Button button25,pos={350,300},size={40,40},proc=ElementSelect,title="Mn"
	Button button25,fSize=20
	Button button43,pos={350,350},size={40,40},proc=ElementSelect,title="Tc"
	Button button43,fSize=20
	Button button75,pos={350,400},size={40,40},proc=ElementSelect,title="Re"
	Button button75,fSize=20
	Button button26,pos={400,300},size={40,40},proc=ElementSelect,title="Fe"
	Button button26,fSize=20
	Button button44,pos={400,350},size={40,40},proc=ElementSelect,title="Ru"
	Button button44,fSize=20
	Button button76,pos={400,400},size={40,40},proc=ElementSelect,title="Os"
	Button button76,fSize=20
	Button button27,pos={450,300},size={40,40},proc=ElementSelect,title="Co"
	Button button27,fSize=20
	Button button45,pos={450,350},size={40,40},proc=ElementSelect,title="Rh"
	Button button45,fSize=20
	Button button77,pos={450,400},size={40,40},proc=ElementSelect,title="Ir"
	Button button77,fSize=20
	Button button28,pos={500,300},size={40,40},proc=ElementSelect,title="Ni"
	Button button28,fSize=20
	Button button46,pos={500,350},size={40,40},proc=ElementSelect,title="Pd"
	Button button46,fSize=20
	Button button78,pos={500,400},size={40,40},proc=ElementSelect,title="Pt"
	Button button78,fSize=20
	Button button29,pos={550,300},size={40,40},proc=ElementSelect,title="Cu"
	Button button29,fSize=20
	Button button47,pos={550,350},size={40,40},proc=ElementSelect,title="Ag"
	Button button47,fSize=20
	Button button79,pos={550,400},size={40,40},proc=ElementSelect,title="Au"
	Button button79,fSize=20
	Button button30,pos={600,300},size={40,40},proc=ElementSelect,title="Zn"
	Button button30,fSize=20
	Button button48,pos={600,350},size={40,40},proc=ElementSelect,title="Cd"
	Button button48,fSize=20
	Button button80,pos={600,400},size={40,40},proc=ElementSelect,title="Hg"
	Button button80,fSize=20
	Button button5,pos={650,200},size={40,40},proc=ElementSelect,title="B",fSize=20
	Button button13,pos={650,250},size={40,40},proc=ElementSelect,title="Al"
	Button button13,fSize=20
	Button button31,pos={650,300},size={40,40},proc=ElementSelect,title="Ga"
	Button button31,fSize=20
	Button button49,pos={650,350},size={40,40},proc=ElementSelect,title="In"
	Button button49,fSize=20
	Button button81,pos={650,400},size={40,40},proc=ElementSelect,title="Tl"
	Button button81,fSize=20
	Button button6,pos={700,200},size={40,40},proc=ElementSelect,title="C",fSize=20
	Button button14,pos={700,250},size={40,40},proc=ElementSelect,title="Si"
	Button button14,fSize=20
	Button button32,pos={700,300},size={40,40},proc=ElementSelect,title="Ge"
	Button button32,fSize=20
	Button button50,pos={700,350},size={40,40},proc=ElementSelect,title="Sn"
	Button button50,fSize=20
	Button button82,pos={700,400},size={40,40},proc=ElementSelect,title="Pb"
	Button button82,fSize=20
	Button button7,pos={750,200},size={40,40},proc=ElementSelect,title="N",fSize=20
	Button button15,pos={750,250},size={40,40},proc=ElementSelect,title="P",fSize=20
	Button button33,pos={750,300},size={40,40},proc=ElementSelect,title="As"
	Button button33,fSize=20
	Button button51,pos={750,350},size={40,40},proc=ElementSelect,title="Sb"
	Button button51,fSize=20
	Button button83,pos={750,400},size={40,40},proc=ElementSelect,title="Bi"
	Button button83,fSize=20
	Button button8,pos={800,200},size={40,40},proc=ElementSelect,title="O",fSize=20
	Button button16,pos={800,250},size={40,40},proc=ElementSelect,title="S",fSize=20
	Button button34,pos={800,300},size={40,40},proc=ElementSelect,title="Se"
	Button button34,fSize=20
	Button button52,pos={800,350},size={40,40},proc=ElementSelect,title="Te"
	Button button52,fSize=20
	Button button84,pos={800,400},size={40,40},proc=ElementSelect,title="Po"
	Button button84,fSize=20
	Button button9,pos={850,200},size={40,40},proc=ElementSelect,title="F",fSize=20
	Button button17,pos={850,250},size={40,40},proc=ElementSelect,title="Cl"
	Button button17,fSize=20
	Button button35,pos={850,300},size={40,40},proc=ElementSelect,title="Br"
	Button button35,fSize=20
	Button button53,pos={850,350},size={40,40},proc=ElementSelect,title="I",fSize=20
	Button button85,pos={850,400},size={40,40},proc=ElementSelect,title="At"
	Button button85,fSize=20
	Button button2,pos={900,150},size={40,40},proc=ElementSelect,title="He",fSize=20
	Button button10,pos={900,200},size={40,40},proc=ElementSelect,title="Ne"
	Button button10,fSize=20
	Button button18,pos={900,250},size={40,40},proc=ElementSelect,title="Ar"
	Button button18,fSize=20
	Button button36,pos={900,300},size={40,40},proc=ElementSelect,title="Kr"
	Button button36,fSize=20
	Button button54,pos={900,350},size={40,40},proc=ElementSelect,title="Xe"
	Button button54,fSize=20
	Button button86,pos={900,400},size={40,40},proc=ElementSelect,title="Rn"
	Button button86,fSize=20
	Button button58,pos={200,500},size={40,40},proc=ElementSelect,title="Ce"
	Button button58,fSize=20
	Button button90,pos={200,550},size={40,40},proc=ElementSelect,title="Th"
	Button button90,fSize=20
	Button button59,pos={250,500},size={40,40},proc=ElementSelect,title="Pr"
	Button button59,fSize=20
	Button button91,pos={250,550},size={40,40},proc=ElementSelect,title="Pa"
	Button button91,fSize=20
	Button button60,pos={300,500},size={40,40},proc=ElementSelect,title="Nd"
	Button button60,fSize=20
	Button button92,pos={300,550},size={40,40},proc=ElementSelect,title="U",fSize=20
	Button button61,pos={350,500},size={40,40},proc=ElementSelect,title="Pm"
	Button button61,fSize=20
	Button button93,pos={350,550},size={40,40},proc=ElementSelect,title="Np"
	Button button93,fSize=20
	Button button62,pos={400,500},size={40,40},proc=ElementSelect,title="Sm"
	Button button62,fSize=20
	Button button94,pos={400,550},size={40,40},proc=ElementSelect,title="Pu"
	Button button94,fSize=20
	Button button63,pos={450,500},size={40,40},proc=ElementSelect,title="Eu"
	Button button63,fSize=20
	Button button95,pos={450,550},size={40,40},proc=ElementSelect,title="Am"
	Button button95,fSize=20
	Button button64,pos={500,500},size={40,40},proc=ElementSelect,title="Gd"
	Button button64,fSize=20
	Button button96,pos={500,550},size={40,40},proc=ElementSelect,title="Cm"
	Button button96,fSize=20
	Button button65,pos={550,500},size={40,40},proc=ElementSelect,title="Tb"
	Button button65,fSize=20
	Button button97,pos={550,550},size={40,40},proc=ElementSelect,title="Bk"
	Button button97,fSize=20
	Button button66,pos={600,500},size={40,40},proc=ElementSelect,title="Dy"
	Button button66,fSize=20
	Button button98,pos={600,550},size={40,40},proc=ElementSelect,title="Cf"
	Button button98,fSize=20
	Button button67,pos={650,500},size={40,40},proc=ElementSelect,title="Ho"
	Button button67,fSize=20
	Button button99,pos={650,550},size={40,40},proc=ElementSelect,title="Es"
	Button button99,fSize=20
	Button button68,pos={700,500},size={40,40},proc=ElementSelect,title="Er"
	Button button68,fSize=20
	Button button100,pos={700,550},size={40,40},proc=ElementSelect,title="Fm"
	Button button100,fSize=20
	Button button69,pos={750,500},size={40,40},proc=ElementSelect,title="Tm"
	Button button69,fSize=20
	Button button101,pos={750,550},size={40,40},proc=ElementSelect,title="Md"
	Button button101,fSize=20
	Button button70,pos={750,500},size={40,40},proc=ElementSelect,title="Yb"
	Button button70,fSize=20
	Button button102,pos={750,550},size={40,40},proc=ElementSelect,title="No"
	Button button102,fSize=20
	Button button71,pos={800,500},size={40,40},proc=ElementSelect,title="Lu"
	Button button71,fSize=20
	Button button103,pos={800,550},size={40,40},proc=ElementSelect,title="Lw"
	Button button103,fSize=20
	Button buttoniso3,pos={340,25},size={120,225},proc=IsotopeSelect,title=""
	Button buttoniso2,pos={470,25},size={120,225},proc=IsotopeSelect,title=""
	Button buttoniso1,pos={210,25},size={120,225},proc=IsotopeSelect,title=""
	SetVariable setvarH0,pos={630,25},size={150,22},proc=setvarHI,title="H (T)"
	SetVariable setvarH0,fSize=14,value= root:NMRPtPro:H0
	Button calcH0,pos={785,25},size={20,20},proc=CalcHwKGI,title=""
	SetVariable setvarw0,pos={630,55},size={150,22},title="w (MHz)",fSize=14
	SetVariable setvarw0,value= root:NMRPtPro:w0
	Button calcw0,pos={785,55},size={20,20},proc=CalcHwKGI,title=""
	SetVariable setvarK,pos={630,85},size={150,22},title="K(%)",fSize=14
	SetVariable setvarK,value= root:NMRPtPro:gK
	Button calcK,pos={785,85},size={20,20},proc=CalcHwKGI,title=""
	SetVariable setvargyro,pos={600,115},size={180,22},title="G (MHz/T)",fSize=14
	SetVariable setvargyro,value= root:NMRPtPro:ggyro
	SetVariable setvarSYS2I,pos={815,40},size={180,22},proc=setvarHI,title="Sys2 I (A)"
	SetVariable setvarSYS2I,fSize=14,value= root:NMRPtPro:sys2I
	SetVariable setvarDFI,pos={815,70},size={180,22},proc=setvarHI,title="Dil F (A)"
	SetVariable setvarDFI,fSize=14,value= root:NMRPtPro:DFI
EndMacro
