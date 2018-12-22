/turf/open/floor/partyhard
	name = "floor"
	icon = 'code/shitcode/valtos/icons/turfs.dmi'
	baseturfs = /turf/open/openspace
	icon_state = "b-1"
	floor_tile = null

/turf/open/floor/partyhard/steel
	icon_state = "g-4"
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/partyhard/wood
	icon_state = "w-1"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/partyhard/break_tile()
	return //unbreakable

/turf/open/floor/partyhard/burn_tile()
	return //unburnable

/turf/open/floor/partyhard/make_plating(force = 0)
	if(force)
		..()
	return //unplateable

/turf/open/floor/partyhard/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/partyhard/crowbar_act(mob/living/user, obj/item/I)
	return

/turf/closed/wall/partyhard
	name = "rusted wall"
	desc = "A rusted metal wall."
	icon = 'icons/turf/walls/v_walls.dmi'
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/wall/partyhard, /turf/closed/wall/r_wall/partyhard, /obj/machinery/door/airlock/, /obj/structure/window/fulltile, /obj/structure/window/reinforced/fulltile)

/turf/closed/wall/r_wall/partyhard
	name = "rusted reinforced wall"
	desc = "A huge chunk of rusted reinforced metal."
	icon = 'icons/turf/walls/v_walls.dmi'
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/wall/r_wall/partyhard, /turf/closed/wall/partyhard, /obj/machinery/door/airlock/, /obj/structure/window/fulltile, /obj/structure/window/reinforced/fulltile)

/turf/closed/mineral/partyhard
	name = "rock"
	icon = 'icons/turf/mining.dmi'
	smooth_icon = 'icons/turf/walls/rock_wall.dmi'
	icon_state = "rock2"
	smooth = SMOOTH_MORE|SMOOTH_BORDER
	canSmoothWith = list (/turf/closed)
	baseturfs = /turf/open/floor/plating/ashplanet/rocky
	environment_type = "waste"
	turf_type = /turf/open/floor/plating/ashplanet/rocky
	defer_change = 1

/turf/closed/indestructible/black
	name = "nothing"
	icon = 'code/shitcode/valtos/icons/area.dmi'
	icon_state = "black"
	layer = FLY_LAYER
	bullet_bounce_sound = null

/area/partyhard
	icon = 'code/shitcode/valtos/icons/area.dmi'
	icon_state = "1f"
	name = "partyhard"
	has_gravity = STANDARD_GRAVITY

/area/partyhard/outdoors
	icon_state = "1f"
	name = "outdoors"
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambientsounds = MINING
	outdoors = TRUE

/area/partyhard/odin
	icon_state = "1f"
	name = "1st floor"

/area/partyhard/dva
	icon_state = "2f"
	name = "2nd floor"

/area/partyhard/tri
	icon_state = "3f"
	name = "3rd floor"

/area/partyhard/chetyre
	icon_state = "4f"
	name = "4th floor"

/area/partyhard/pyat
	icon_state = "5f"
	name = "5th floor"

/area/partyhard/surface
	icon_state = "4f"
	name = "surface"

/area/shuttle/partyhard
	name = "Station Elevator"

/obj/machinery/computer/shuttle/partyhard
	name = "elevator console"
	desc = "A elevator control computer."
	icon_screen = "shuttle"
	icon_keyboard = "tech_key"
	light_color = LIGHT_COLOR_CYAN
	shuttleId = "partyhard_elevator"
	possible_destinations = "ph_station_bottom;ph_station_top"
