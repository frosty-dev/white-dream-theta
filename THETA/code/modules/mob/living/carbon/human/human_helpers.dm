/mob/living/carbon/human/can_see_reagents()//to do, create NORMAL system for this /tg/ shit
	.=..()
	if(src.internal_organs_slot[ORGAN_SLOT_HUD])
		var/obj/item/organ/cyberimp/eyes/hud/science/H = src.internal_organs_slot[ORGAN_SLOT_HUD]
		if(istype(H) && H.scan_reagents)
			return 1
