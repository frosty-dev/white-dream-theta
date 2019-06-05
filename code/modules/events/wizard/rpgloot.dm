/datum/round_event_control/wizard/rpgloot //its time to minmax your shit
	name = "RPG Loot"
	weight = 3
	typepath = /datum/round_event/wizard/rpgloot
	max_occurrences = 1
	earliest_start = 0 MINUTES

/datum/round_event/wizard/rpgloot/start()
	var/upgrade_scroll_chance = 0
	for(var/obj/item/I in world)
<<<<<<< HEAD
		if(!(I.flags_1 & INITIALIZED_1))
			continue

		if(!istype(I.rpg_loot))
			I.rpg_loot = new(I)
=======
		CHECK_TICK

		if(!(I.flags_1 & INITIALIZED_1))
			continue

		I.AddComponent(/datum/component/fantasy)
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c

		if(istype(I, /obj/item/storage))
			var/obj/item/storage/S = I
			var/datum/component/storage/STR = S.GetComponent(/datum/component/storage)
			if(prob(upgrade_scroll_chance) && S.contents.len < STR.max_items && !S.invisibility)
				var/obj/item/upgradescroll/scroll = new(get_turf(S))
				SEND_SIGNAL(S, COMSIG_TRY_STORAGE_INSERT, scroll, null, TRUE, TRUE)
				upgrade_scroll_chance = max(0,upgrade_scroll_chance-100)
				if(isturf(scroll.loc))
					qdel(scroll)

			upgrade_scroll_chance += 25

	GLOB.rpg_loot_items = TRUE

/obj/item/upgradescroll
	name = "item fortification scroll"
	desc = "Somehow, this piece of paper can be applied to items to make them \"better\". Apparently there's a risk of losing the item if it's already \"too good\". <i>This all feels so arbitrary...</i>"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "scroll"
	w_class = WEIGHT_CLASS_TINY

	var/upgrade_amount = 1
	var/can_backfire = TRUE
	var/uses = 1

/obj/item/upgradescroll/afterattack(obj/item/target, mob/user , proximity)
	. = ..()
	if(!proximity || !istype(target))
		return

<<<<<<< HEAD
	var/datum/rpg_loot/rpg_loot_datum = target.rpg_loot
	var/turf/T = get_turf(target)

	if(!istype(rpg_loot_datum))
		var/original_name = "[target]"
		target.rpg_loot = rpg_loot_datum = new /datum/rpg_loot(target)

		var/span
		var/effect_description
		if(target.rpg_loot.quality >= 0)
			span = "<span class='notice'>"
			effect_description = "<span class='heavy_brass'>shimmering golden shield</span>"
		else
			span = "<span class='danger'>"
			effect_description = "<span class='umbra_emphasis'>mottled black glow</span>"

		T.visible_message("[span][original_name] is covered by a [effect_description] and then transforms into [target]!</span>")

	else
		var/quality = rpg_loot_datum.quality

		if(can_backfire && quality > 9 && prob((quality - 9)*10))
			T.visible_message("<span class='danger'>[target] <span class='inathneq_large'>violently glows blue</span> for a while, then evaporates.</span>")
			target.burn()
		else
			T.visible_message("<span class='notice'>[target] <span class='inathneq_small'>glows blue</span> and seems vaguely \"better\"!</span>")
			rpg_loot_datum.modify(upgrade_amount)
=======
	target.AddComponent(/datum/component/fantasy, upgrade_amount, null, null, can_backfire, TRUE)
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c

	if(--uses <= 0)
		qdel(src)

/obj/item/upgradescroll/unlimited
	name = "unlimited foolproof item fortification scroll"
	desc = "Somehow, this piece of paper can be applied to items to make them \"better\". This scroll is made from the tongues of dead paper wizards, and can be used an unlimited number of times, with no drawbacks."
	uses = INFINITY
	can_backfire = FALSE
