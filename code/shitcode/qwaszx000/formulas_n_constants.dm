//-----------------Constants-------------------------
var/const/V_m = 22.4//liters/mol
//---------------------------------------------------
/proc/GetSubstanceMol(var/M, var/m)//gram/mol, gram
	return (m/M)

/proc/GetGasVolume(var/M, var/m)//gram/mol, gram
	var/mols = GetSubstanceMol(M, m)
	return (V_m*mols)

//returns 0 if asoc list a == asoc list b
/proc/AsocListCmp(var/list/a, var/list/b)
	//to_chat(usr, "a len = [a.len]")
	//to_chat(usr, "b len = [b.len]")
	if(a.len == b.len)
		var/count = a.len
		for(var/ia in a)
			//to_chat(usr, "ia = [ia]")
			//to_chat(usr, "a\[ia] = [ia]")
			//to_chat(usr, "b\[ia] = [ia]")
			if(a[ia] == b[ia])
				//to_chat(usr, "[count]")
				//to_chat(usr, "[a[ia]] == [b[ia]]")
				count -= 1
		return count
	return 1