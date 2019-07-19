/obj/item/flextape
	name = "Flex tape"
	desc = "Use on a monkey holding an item to tape item to its hands."

/obj/item/flextape/afterattack(atom/A, mob/user, proximity)
	. = ..()
	if(!proximity)
		return

	if(!istype(A, /mob/living/carbon/monkey))
		return

	var/mob/living/carbon/monkey/M = A
	if(M.mind)
		return

	for(var/obj/item/I in M.held_items)
		if(!HAS_TRAIT_FROM(I,TRAIT_NODROP, "flextape"))
			to_chat(user, "<span class='warning'>You tape [I.name] to [M.name]'s hands.</span>")
			ADD_TRAIT(I,TRAIT_NODROP, "flextape")


/obj/item/flextape_remover
	name = "Superglue superremover"
	desc = "Use on a monkey to remove any type of glue from its hands."

/obj/item/flextape_remover/afterattack(atom/A, mob/user, proximity)
	. = ..()
	if(!proximity)
		return

	if(!istype(A, /mob/living/carbon/monkey))
		return

	var/mob/living/carbon/monkey/M = A
	if(M.mind)
		return

	for(var/obj/item/I in M.held_items)
		if(HAS_TRAIT_FROM(I,TRAIT_NODROP, "flextape"))
			to_chat(user, "<span class='warning'>You remove tape from [M.name]'s hands, freeing their grip on [I.name].</span>")
			REMOVE_TRAIT(I,TRAIT_NODROP, "flextape")

/datum/design/flextape
	name = "Flextape"
	id = "flextape"
	build_type = AUTOLATHE
	materials = list(MAT_METAL = 12000, MAT_GLASS=8000)
	build_path = /obj/item/flextape
	category = list("hacked", "Misc")

/datum/design/flextape_r
	name = "Flextape Remover"
	id = "flextape_r"
	build_type = AUTOLATHE
	materials = list(MAT_METAL = 12000, MAT_GLASS=8000)
	build_path = /obj/item/flextape_remover
	category = list("hacked", "Misc")