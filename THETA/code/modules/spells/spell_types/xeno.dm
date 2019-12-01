obj/effect/proc_holder/spell/aoe_turf/repulse/xeno_weak //for a humans with alien tail
	name = "Weak Tail Sweep"
	desc = "Throw back attackers with a sweep of your tail."
	sound = 'sound/magic/tail_swing.ogg'
	charge_max = 200
	clothes_req = 0
	range = 1
	cooldown_min = 200
	invocation_type = "none"
	sparkle_path = /obj/effect/temp_visual/dir_setting/tailsweep
	action_icon = 'icons/mob/actions/actions_xeno.dmi'
	action_icon_state = "tailsweep"
	action_background_icon_state = "bg_alien"
	anti_magic_check = FALSE

/obj/effect/proc_holder/spell/aoe_turf/repulse/xeno_weak/cast(list/targets,mob/user = usr)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		playsound(C.loc, 'sound/voice/hiss5.ogg', 80, 1, 1)
		C.spin(6,1)
	..(targets, user, 30)

//xeno hivenoder [WIP] need rework strings
/obj/effect/proc_holder/alien/hivenoder
	name = "Queen's blessing"
	desc = "Only for loyal creatures"
	plasma_cost = 150
	action_icon = 'icons/obj/surgery.dmi'
	action_icon_state = "plasma"

/obj/effect/proc_holder/alien/hivenoder/fire(mob/living/carbon/user)
	if(user.grab_state == 2)
		var/mob/M = user.pulling
		if(iscarbon(M))
			var/mob/living/carbon/target = M
			var/node = M.getorgan(/obj/item/organ/alien/hivenode)
			var/vessel = M.getorgan(/obj/item/organ/alien/plasmavessel)
			if(!node || !vessel)
				if(!node)
					var/obj/item/organ/O = new /obj/item/organ/alien/hivenode
					O.Insert(target)
				if(!vessel)
					var/obj/item/organ/O = new /obj/item/organ/alien/plasmavessel/small
					O.Insert(target)
				user.visible_message("<span class='alertalien'>[user] has planted something into [target]!</span>")
				return 1
			else
				to_chat(user, "This one already has node and plasmavessel")
				return 0

	to_chat(user, "You must grab someone by the neck for this")

	return 0
