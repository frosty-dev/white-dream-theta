/obj/machinery/door/xenodoor
	icon = 'code/shitcode/Gargule/icons/xenodoor.dmi'
	name = "resin door"
	desc = "Thick resin solidified into a door."
	density = TRUE
	opacity = 1
	anchored = TRUE
	canSmoothWith = list(/obj/structure/alien/resin)
	max_integrity = 200
	smooth = SMOOTH_TRUE
	var/resintype = "wall"
	CanAtmosPass = ATMOS_PASS_DENSITY
	poddoor = TRUE //may cause some bugs

/obj/machinery/door/xenodoor/Initialize()
	. = ..()
	spark_system = null //but pisos

/obj/machinery/door/xenodoor/attack_paw(mob/user)
	return attack_hand(user)//well, we will try without it

/obj/machinery/door/xenodoor/run_obj_armor(damage_amount, damage_type, damage_flag = 0, attack_dir)
	if(damage_flag == "melee")
		switch(damage_type)
			if(BRUTE)
				damage_amount *= 0.25
			if(BURN)
				damage_amount *= 2
	. = ..()

/obj/machinery/door/xenodoor/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	switch(damage_type)
		if(BRUTE)
			if(damage_amount)
				playsound(loc, 'sound/effects/attackblob.ogg', 100, 1)
			else
				playsound(src, 'sound/weapons/tap.ogg', 50, 1)
		if(BURN)
			if(damage_amount)
				playsound(loc, 'sound/items/welder.ogg', 100, 1)