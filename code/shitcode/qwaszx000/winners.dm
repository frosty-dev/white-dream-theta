#define ENGINEER_WINER_CKEY "laxesh"
#define ROBUST_WINER_CKEY "darkkeeper072"

/obj/item/extinguisher/robust
	name = "Robust fire extinguisher"
	desc = "Used to kill humans."
	icon_state = "foam_extinguisher0"
	//item_state = "foam_extinguisher" needs sprite
	dog_fashion = null
	sprite_name = "foam_extinguisher"
	throwforce = 15
	force = 15
	precision = TRUE


/obj/item/clothing/neck/cloak/engineer_winer
	name = "Main engineer's cloak"
	desc = "Winner engineer trophy."
	armor = list("melee" = 15, "bullet" = 10, "laser" = 5, "energy" = 10, "bomb" = 20, "bio" = 10, "rad" = 50, "fire" = 20, "acid" = 20)
	icon_state = "cecloak"


/obj/structure/displaycase/winner
	name = "winner case"
	var/need_key = null

/obj/structure/displaycase/winner/attackby(obj/item/W, mob/user, params)
	if(W.tool_behaviour == TOOL_WELDER && user.a_intent == INTENT_HELP && !broken)
		if(obj_integrity < max_integrity)
			if(!W.tool_start_check(user, amount=5))
				return

			to_chat(user, "<span class='notice'>You begin repairing [src].</span>")
			if(W.use_tool(src, user, 40, amount=5, volume=50))
				obj_integrity = max_integrity
				update_icon()
				to_chat(user, "<span class='notice'>You repair [src].</span>")
		else
			to_chat(user, "<span class='warning'>[src] is already in good condition!</span>")
		return
	else if(!alert && W.tool_behaviour == TOOL_CROWBAR && openable) //Only applies to the lab cage and player made display cases
		if(broken)
			if(showpiece)
				to_chat(user, "<span class='notice'>Remove the displayed object first.</span>")
			else
				to_chat(user, "<span class='notice'>You remove the destroyed case</span>")
				qdel(src)
		else
			to_chat(user, "<span class='notice'>You start to [open ? "close":"open"] [src].</span>")
			if(W.use_tool(src, user, 20))
				to_chat(user,  "<span class='notice'>You [open ? "close":"open"] [src].</span>")
				toggle_lock(user)
	else if(open && !showpiece)
		if(user.transferItemToLoc(W, src))
			showpiece = W
			to_chat(user, "<span class='notice'>You put [W] on display</span>")
			update_icon()
	else if(istype(W, /obj/item/stack/sheet/glass) && broken)
		var/obj/item/stack/sheet/glass/G = W
		if(G.get_amount() < 2)
			to_chat(user, "<span class='warning'>You need two glass sheets to fix the case!</span>")
			return
		to_chat(user, "<span class='notice'>You start fixing [src]...</span>")
		if(do_after(user, 20, target = src))
			G.use(2)
			broken = 0
			obj_integrity = max_integrity
			update_icon()
	else
		return ..()

/obj/structure/displaycase/winner/attack_hand(mob/user)
	if(lowertext(user.ckey) == lowertext(need_key) && !broken && openable)
		to_chat(user,  "<span class='notice'>You [open ? "close":"open"] [src].</span>")
		toggle_lock(user)
	else
		to_chat(user, "<span class='warning'>Access denied.</span>")

/obj/structure/displaycase/winner/AltClick(mob/user)
	if(open)
		var/atom/L = drop_location()
		showpiece.forceMove(L)
		showpiece = null
		update_icon()

/obj/structure/displaycase/winner/robust
	need_key = ROBUST_WINER_CKEY
	//showpiece = /obj/item/extinguisher/robust
	start_showpiece_type = /obj/item/extinguisher/robust
	//start_showpieces = list("type" = /obj/item/extinguisher/robust, "trophy_message" = "Winner!!!")

/obj/structure/displaycase/winner/engineer
	need_key = ENGINEER_WINER_CKEY
	//showpiece = /obj/item/clothing/neck/cloak/engineer_winer
	start_showpiece_type = /obj/item/clothing/neck/cloak/engineer_winer
	//start_showpieces = list("type" = /obj/item/clothing/neck/cloak/engineer_winer, "trophy_message" = "Winner!!!")