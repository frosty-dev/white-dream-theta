/*
By qwaszx000
*/
#include "formulas_n_constants.dm"
#include "true_reagents.dm"

/*
/datum/reagent/tru/on_merge(list/new_data, new_amount)//when adding reagent with data = new_data and with amount = new_amount to this reagent
	/*if(!islist(new_data) || !new_data.len)
		return*/

	/*try
		var/new_isMetal = new_data["isMetal"]
	catch(var/exception/e)
		return*/
	//react
	M += new_data["M"]//Summ of molar mass
	to_chat(usr,"Reaction starts!")
	//--------------oxydation--------
	if(formula == "O" ^ new_data["formula"] == "O")
		formula += new_data["formula"]
		name += (" " + new_data["name"])
	//-------------------------------
	create_data()
*/
/datum/reagent/tru/on_new(list/new_data)
	to_chat(usr, "Reaction!")

	M += new_data["M"]
	formula += new_data["formula"]
	//--------------oxydation--------
	if(new_data["formula"] == "O")
		name += (" oxyde")
	//-------------------------------
	create_data()//update data
/*
//datum/chemical_reaction/true
/datum/chemical_reaction/carbon_ox
	name = "Carbon_ox"
	id = "cox"
	results = list("potassium" = 1)
	required_reagents = list("Nobelium" = 1)
	mix_message = "The mixture dries into a pale blue powder."
	required_temp = 500

*/