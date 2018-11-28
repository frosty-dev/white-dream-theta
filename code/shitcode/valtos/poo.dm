////////////////////////////////////////////
// POO POO PEE PEE
// what the fuck now are you retarded?
/////////////////////////////////////

/obj/item/reagent_containers/food/snacks/poo
	name = "poo"
	desc = "Пахнет классикой."
	icon = 'code/shitcode/valtos/icons/poo.dmi'
	icon_state = "poo1"
	tastes = list("shit" = 1, "poo" = 1)
	var/random_icon_states = list("poo1", "poo2", "poo3", "poo4", "poo5", "poo6")
	list_reagents = list("poo" = 5)
	cooked_type = /obj/item/reagent_containers/food/snacks/poo/cooked
	filling_color = "#4B3320"
	foodtype = MEAT | RAW | TOXIC
	grind_results = list()

/obj/item/reagent_containers/food/snacks/poo/Initialize()
	. = ..()
	if (random_icon_states && (icon_state == initial(icon_state)) && length(random_icon_states) > 0)
		icon_state = pick(random_icon_states)

/obj/item/reagent_containers/food/snacks/poo/cooked
	name = "cooked poo"
	icon_state = "ppoo1"
	random_icon_states = list("ppoo1", "ppoo2", "ppoo3", "ppoo4", "ppoo5", "ppoo6")
	filling_color = "#4B3320"

/datum/reagent/toxin/poo
	name = "Poo"
	id = "poo"
	description = "Govno?"
	color = "#4B3320"
	toxpwr = 2.5
	taste_description = "poo"

/datum/reagent/toxin/poo/on_mob_life(mob/living/carbon/C)
	C.adjustPlasma(5)
	return ..()

/datum/reagent/toxin/poo/reaction_turf(turf/open/T, reac_volume)//splash the poo all over the place
	if(!istype(T))
		return
	if(reac_volume >= 1)
		T.MakeSlippery(TURF_WET_LUBE, 15 SECONDS, min(reac_volume * 2 SECONDS, 120))

	var/obj/effect/decal/cleanable/poo/B = locate() in T //find some poo here
	if(!B)
		B = new(T)

/datum/component/decal/poo
	dupe_mode = COMPONENT_DUPE_UNIQUE

/datum/component/decal/poo/Initialize(_icon, _icon_state, _dir, _cleanable=CLEAN_STRENGTH_BLOOD, _color, _layer=ABOVE_OBJ_LAYER)
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	. = ..()
	RegisterSignal(parent, COMSIG_ATOM_GET_EXAMINE_NAME, .proc/get_examine_name)

/datum/component/decal/poo/generate_appearance(_icon, _icon_state, _dir, _layer, _color)
	var/obj/item/I = parent
	if(!_icon)
		_icon = 'code/shitcode/valtos/icons/poo.dmi'
	if(!_icon_state)
		_icon_state = "itempoo"
	var/icon = initial(I.icon)
	var/icon_state = initial(I.icon_state)
	if(!icon || !icon_state)
		icon = I.icon
		icon_state = I.icon_state
	var/static/list/poo_splatter_appearances = list()
	var/index = "[REF(icon)]-[icon_state]"
	pic = poo_splatter_appearances[index]

	if(!pic)
		var/icon/poo_splatter_icon = icon(initial(I.icon), initial(I.icon_state), , 1)
		poo_splatter_icon.Blend("#fff", ICON_ADD)
		poo_splatter_icon.Blend(icon(_icon, _icon_state), ICON_MULTIPLY)
		pic = mutable_appearance(poo_splatter_icon, initial(I.icon_state))
		poo_splatter_appearances[index] = pic
	return TRUE

/datum/component/decal/poo/proc/get_examine_name(datum/source, mob/user, list/override)
	var/atom/A = parent
	override[EXAMINE_POSITION_ARTICLE] = A.gender == PLURAL? "some" : "a"
	override[EXAMINE_POSITION_BEFORE] = " poo-stained "
	return COMPONENT_EXNAME_CHANGED

/obj/effect/decal/cleanable/poo
	name = "poo"
	desc = "Кто размазал это по полу блядь?"
	icon = 'code/shitcode/valtos/icons/poo.dmi'
	icon_state = "splat1"
	random_icon_states = list("splat1", "splat2", "splat3", "splat4", "splat5", "splat6", "splat7", "splat8")

/obj/item/reagent_containers/food/snacks/poo/throw_impact(atom/hit_atom)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/reagent_containers/food/snacks/poo/proc/splat(atom/movable/hit_atom)
	if(isliving(loc)) //someone caught us!
		return
	var/turf/T = get_turf(hit_atom)
	new/obj/effect/decal/cleanable/poo(T)
	if(reagents && reagents.total_volume)
		reagents.reaction(hit_atom, TOUCH)
	if(ishuman(hit_atom))
		var/mob/living/carbon/human/H = hit_atom
		var/mutable_appearance/pooverlay = mutable_appearance('code/shitcode/valtos/icons/poo.dmi')
		H.Paralyze(20) //splat!
		H.adjust_blurriness(1)
		H.visible_message("<span class='warning'>[H] is pooed by [src]!</span>", "<span class='userdanger'>You've been pooed by [src]!</span>")
		playsound(H, "desceration", 50, TRUE)
		if(!H.creamed) // one layer at a time
			pooverlay.icon_state = "facepoo"
			H.add_overlay(pooverlay)
			pooverlay.icon_state = "uniformpoo"
			H.add_overlay(pooverlay)
			pooverlay.icon_state = "suitpoo"
			H.add_overlay(pooverlay)
			H.creamed = TRUE
			SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "creampie", /datum/mood_event/creampie)
	qdel(src)

/datum/emote/living/poo
	key = "poo"
	key_third_person = "shits on the floor"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/poo/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna.species.id == "human")
			if (H.nutrition >= 300)
				message = "<font color='red'><b>срётся прямо на пол!</b></font>"
				playsound(H, 'code/shitcode/fogmann/fart.ogg', 50, 1)
				new /obj/item/reagent_containers/food/snacks/poo(H.loc)
				H.nutrition -= 100
				return
			else if (H.nutrition <= 300)
				message = "<font color='red'><b>люто тужится в попытках выдавить личинку!</b></font>"
				H.Paralyze(80)
				H.adjust_blurriness(1)
				H.adjustBruteLoss(10)
				return
			else
				retun