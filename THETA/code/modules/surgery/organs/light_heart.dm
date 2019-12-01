/datum/plant_gene/trait/glow/strong
	name = "Strong Bioluminescence"
	rate = 0.05
	glow_color = null

/obj/item/organ/heart/attackby(obj/item/F, mob/user)
	.=..()
	if(istype(F, /obj/item/reagent_containers/food/snacks/grown) && isstrictlytype(src, /obj/item/organ/heart))
		var/obj/item/reagent_containers/food/snacks/grown/FT = F
		var/pow = 0
		var/obj/item/seeds/berry/S = FT.seed
		if(S.get_gene(/datum/plant_gene/trait/glow))
			pow = S.potency*2/100//if trait any of biolums
			if(S.get_gene(/datum/plant_gene/trait/glow/strong))
				pow += 1//if trait glow-berry
			if(pow > 0)
				var/obj/item/organ/heart/light/N = new(user.loc)
				N.power = pow
				N.brightness_on = 4+pow
				qdel(F)
				qdel(src)

/obj/item/organ/heart/light
	name = "heart of Light"
	desc = "Full of Light essence."
	//synthetic = TRUE //floral power prevents heart attacks
	actions_types = list(/datum/action/item_action/toggle_light)
	icon = 'THETA/icons/icons.dmi'
	icon_state = "heartlight-on"
	var/power = 3
	var/on = FALSE
	var/brightness_on = 5 //range of light when on
	var/flashlight_power = 1 //strength of the light when on
	var/inside = 0

/obj/item/organ/heart/light/on_life()
	. = ..()
	if(ispodperson(owner)) //extra healing for podmans
		owner.nutrition += 5
		owner.heal_overall_damage(power,power,power/2)
		owner.adjustToxLoss(-power)
		owner.adjustOxyLoss(-power)
		if(owner.nutrition > NUTRITION_LEVEL_FULL)
			owner.nutrition = NUTRITION_LEVEL_FULL

/obj/item/organ/heart/light/proc/update_brightness(mob/user = null)
	if(on)
		icon_state = "[initial(icon_state)]-on"
		if(flashlight_power)
			set_light(l_range = brightness_on, l_power = flashlight_power)
		else
			set_light(brightness_on)
	else
		icon_state = initial(icon_state)
		set_light(0)

/obj/item/organ/heart/light/Insert()
	.=..()
	inside = 1
	if(!src.loc)
		src.loc = owner

/obj/item/organ/heart/light/Remove(mob/living/carbon/M, special = FALSE)
	.=..()
	inside = 0
	src.loc = null

/obj/item/organ/heart/light/attack_self(mob/user)
	.=..()
	if(inside)
		on = !on
		update_brightness(user)
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtonIcon()
		if(on)
			owner.show_message("Your skin emmits light!")
		else
			owner.show_message("You wanna stay in darkness")
		return 1

/obj/item/organ/heart/light/attack(mob/M, mob/living/carbon/user, obj/target)
	if(M != user)
		return ..()
	user.show_message("You raise your mouth and devour it!")
	playsound(user, 'sound/magic/demon_consume.ogg', 50, 1)
	user.show_message("It tastes sweet and grows inside of you")
	user.temporarilyRemoveItemFromInventory(src, TRUE)
	Insert(user)
