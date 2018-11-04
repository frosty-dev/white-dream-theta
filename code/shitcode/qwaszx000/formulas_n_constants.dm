//-----------------Constants-------------------------
var/const/V_m = 22.4//liters/mol
//---------------------------------------------------
/proc/GetSubstanceMol(var/M, var/m)//gram/mol, gram
	return (m/M)

/proc/GetGasVolume(var/M, var/m)//gram/mol, gram
	var/mols = GetSubstanceMol(M, m)
	return (V_m*mols)

