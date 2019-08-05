/obj/item/rcbl
	name = "Rapid Conveyor Belt Layer (RCBL)"
	desc = "A device used to rapidly construct conveyor lines.\n<span class='notice'>Use a multitool to change conveyor ID.</span>"
	icon = 'icons/obj/tools.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	icon_state = "rcd"
	flags_1 = CONDUCT_1
	force = 10
	throwforce = 10
	throw_speed = 1
	throw_range = 5
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(/datum/material/iron=75000, /datum/material/glass=37500)
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	var/matter = 0
	var/mattermax = 100
	var/c_id = ""
	var/mode = 1

/obj/item/rcbl/Initialize()
	. = ..()
	c_id = "RCBL[rand(0,999)]"

/obj/item/rcbl/examine(mob/user)
	. = ..()
	. += "<span class='notice'>It currently holds [matter]/[mattermax] fabrication-units.\nID is [c_id].</span>"

/obj/item/rcbl/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/rcd_ammo))
		if((matter + 10) > mattermax)
			to_chat(user, "The RCBL can't hold any more matter.")
			return
		qdel(W)
		matter += 10
		playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
		to_chat(user, "The RCBL now holds [matter]/[mattermax] fabrication-units.")
	else if (istype(W, /obj/item/multitool))
		c_id = input(user, "Input a conveyor id", "Conveyor ID", c_id) as text
	else
		return ..()

/obj/item/rcbl/attack_self(mob/user)
	playsound(src.loc, 'sound/effects/pop.ogg', 50, 0)
	switch(mode)
		if(3)
			mode = 1
			to_chat(user, "Changed mode to 'Conveyor belt'")
		if(1)
			mode = 2
			to_chat(user, "Changed mode to 'Conveyor switch'")
		if(2)
			mode = 3
			to_chat(user, "Changed mode to 'Deconstruction'")

/obj/item/rcbl/afterattack(atom/A, mob/user, proximity)
	. = ..()
	if(!proximity)
		return

	var/bres = istype(A, /obj/machinery/conveyor)
	var/sres = istype(A, /obj/machinery/conveyor_switch)
	if(mode != 3)
		if(bres)
			var/obj/machinery/conveyor/C = A
			if(C.id && GLOB.conveyors_by_id[C.id])
				LAZYREMOVE(GLOB.conveyors_by_id[C.id], C)
			C.id = c_id
			LAZYADD(GLOB.conveyors_by_id[C.id], C)
			return
		else if(sres)
			var/obj/machinery/conveyor_switch/C = A
			C.id = c_id
			return
	else if(bres||sres)
		matter++
		qdel(A)
		to_chat(user, "Deconstructing [A.name]...")
		return

	if (matter < 1)
		to_chat(user, "<span class='warning'>\The [src] doesn't have enough matter left.</span>")
		return

	var/turf/T = get_turf(A)
	playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
	switch(mode)
		if(1)
			to_chat(user, "Constructing Conveyor Belt...")
			var/obj/machinery/conveyor/B = new(T)
			B.id = c_id
			B.dir = user.dir
			B.movedir = user.dir
			LAZYADD(GLOB.conveyors_by_id[B.id], B)
		if(2)
			to_chat(user, "Constructing Conveyor Switch...")
			var/obj/machinery/conveyor_switch/S = new(T)
			S.id = c_id
	matter--
	to_chat(user, "<span class='notice'>The RCBL now holds [matter]/[mattermax] fabrication-units.</span>")

/datum/design/rcbl
	name = "Rapid Conveyor Belt Layer (RCBL)"
	id = "rcbl"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 50000)
	build_path = /obj/item/rcbl
	category = list("hacked", "Construction")