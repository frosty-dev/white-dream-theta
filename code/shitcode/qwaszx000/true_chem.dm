/*
By qwaszx000
*/
#define true TRUE
#define false FALSE

#include "formulas_n_constants.dm"
#include "true_reagents.dm"

//On new reagent in holder
/datum/reagent/tru/on_new(list/new_data)
	new_data["src"] = src
	new_data["usr"] = usr

	var/all_data = list()
	for(var/datum/reagent/tru/i in holder.reagent_list)
		all_data[i.id] = i.data

	if(canReactWithSome(all_data))
		to_chat(usr, "Reaction!")
		for(var/datum/reagent/tru/i in holder.reagent_list)
			//need to remove some wrong reactions
			var/list/loc_data = list()
			//to_chat(usr, "[i.id]")
			//to_chat(usr, "[i.data["id"]]")//corect data
			loc_data[i.id] = i.data
			loc_data["reagent_id"] = i.id
			//loc_data = i.data
			to_chat(usr, "[loc_data[i.id]["id"]]")
			if(can_react_with(loc_data))
				react_with(loc_data)
	//-------------------------------
	create_data()//update data

/*
Computes reaction with this reagent and reagent with data
"reagent_id" = id
{
	"id" = id,
	"M"  = M,
	"name" = name,
	...
	see true_reagents.dm
}
*/
/datum/reagent/tru/proc/react_with(var/list/new_data)

	if(is_oxyding_reaction(new_data))
		var/new_id = new_data["reagent_id"]
		if(isOxydizer)
			to_chat(usr, "I am Oxydizer")
			to_chat(usr, "New_data id: [new_data[new_id]["id"]]")
			new_data[new_id]["M"] += M
			new_data[new_id]["name"] += " oxyde"
			new_data[new_id]["formula"] = add_formulas_elements(formula, new_data[new_id]["formula"])
			holder.set_data(new_id, new_data[new_id])
			holder.remove_reagent(id, 5)
		else
			to_chat(usr, "Oxydation")
			to_chat(usr, "New_data id: [new_data[new_id]["id"]]")
			M += new_data[new_id]["M"]
			formula = add_formulas_elements(holder.reagent_list[new_id]["formula"], list())
			name += (" oxyde")
			holder.remove_reagent(new_id, 5)

//Add formulas reagents to this or target reagent formulas reagents
/datum/reagent/tru/proc/add_formulas_elements(var/list/formula_new, var/list/formulaTarget)
	if(formulaTarget.len == 0)
		for(var/i in formula_new)
			if(i in formula)
				formula[i] += formula_new[i]
			else
				formula += list(i = formula_new[i])//<------ bad index why???
	else
		for(var/i in formula_new)
			if(i in formula)
				formulaTarget[i] += formula_new[i]
			else
				formulaTarget += list(i = formula_new[i])//<------ bad index why???
		return formulaTarget

//Returns true if reagent can react with at last one reagent in all_data
//For list of reagent datas
/datum/reagent/tru/proc/canReactWithSome(var/list/all_data)
	var/can_counter = 0

	for(var/i in all_data)
		if(i != "reagent_id")
			if(group == 18)
				break

			if(!formula.len)
				holder.del_reagent(id)
				break

			if(!all_data[i]["formula"].len)//bad index
				holder.del_reagent(all_data[i]["id"])
				continue

			if(formula == all_data[i]["formula"])
				continue

			if(all_data[i]["group"] == 18)
				continue

			if(formula.len != all_data[i]["formula"].len)
				can_counter++
				continue

			if(formula != all_data[i]["formula"])
				can_counter++
				continue

	if(can_counter >= 1)
		return TRUE
	else
		return FALSE

//Returns true if reagent can react with reagent in new_data
//For one reagent data
/datum/reagent/tru/proc/can_react_with(var/list/new_data)
	var/new_id = new_data["reagent_id"]

	if(group == 18)
		return FALSE

	if(!formula.len)
		holder.del_reagent(id)//this reagent is empty. Remove it
		return FALSE

	if(!new_data[new_id]["formula"].len)//bad index
		holder.del_reagent(new_data[new_id]["id"])//Target reagent is empty. Remove it
		return FALSE

	if(formula == new_data[new_id]["formula"])
		return FALSE

	if(new_data[new_id]["group"] == 18)
		return FALSE

	if(formula.len != new_data[new_id]["formula"].len)
		return TRUE

	if(formula != new_data[new_id]["formula"])
		return TRUE

//returns true if this reaction is oxyding
/datum/reagent/tru/proc/is_oxyding_reaction(var/list/new_data)
	var/new_id = new_data["reagent_id"]
	if(!isOxydizer && new_data[new_id]["isOxydizer"])
		return TRUE
	else if (isOxydizer && !new_data[new_id]["isOxydizer"])
		return TRUE
	else if (!isOxydizer && !new_data[new_id]["isOxydizer"])
		return FALSE
	else if (isOxydizer && new_data[new_id]["isOxydizer"])
		return FALSE
	else
		return FALSE

/*
"reagent_id" = id
{
	"id" 	  = id,
	"M"  	  = M,
	"name" 	  = name,
	"valence" = valence,
	...
	see true_reagents.dm
}
and
"reagent_id" = id
{
	"id" 	  = id,
	"M"  	  = M,
	"name"    = name,
	"valence" = valence,
	...
	see true_reagents.dm
}
*/
/proc/calculate_coefficients(var/list/data0, var/list/data1)
	return data0//TODO

#undef true
#undef false