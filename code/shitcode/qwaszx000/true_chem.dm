/*
By qwaszx000
*/
#define true TRUE
#define false FALSE

#include "formulas_n_constants.dm"
#include "true_reagents.dm"

//On new reagent in holder
/datum/reagent/tru/on_new(list/new_data)

	if(can_react_with(new_data))
		to_chat(usr, "Reaction!")
		//--------------oxydation--------
		if((new_data["formula"]["O"] >= 1 && new_data["formula"].len == 1 && formula["O"] == 0) || (formula["O"] >= 1 && formula.len == 1 && new_data["formula"]["O"] == 0))
			M += new_data["M"]
			add_formulas_elements(new_data["formula"])
			name += (" oxyde")
		holder.del_reagent(new_data["id"])
	//-------------------------------
	create_data()//update data

//Add formulas reagents to this reagent formulas reagents
/datum/reagent/tru/proc/add_formulas_elements(var/list/formula_new)
	for(var/i in formula)
		if(i in formula_new)
			formula[i] += formula_new[i]
		else
			formula[i] = formula_new[i]

//Returns true if reagents can react
/datum/reagent/tru/proc/can_react_with(var/list/new_data)
	if(formula.len != new_data["formula"].len)
		return TRUE

	if(formula != new_data["formula"])
		return TRUE

	if(formula == new_data["formula"])
		return FALSE

	//for(var/i in formula)
	//	if(formula[i] != new_data["formula"][i])
	//		return TRUE



	if(new_data["group"] == 18 || group == 18)//Inert gases
		return FALSE

	return TRUE

#undef true
#undef false