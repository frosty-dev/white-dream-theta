GLOBAL_VAR_INIT(diy_shuttle_count, 0)

/datum/map_template/shelter/diyshuttle
	name = "Autism Shuttle"
	shelter_id = "autism"
	description = "Priv"
	mappath = "code/shitcode/hule/shuttles/diy/diy_autism.dmm"

/datum/map_template/shelter/alpha/New()
	. = ..()
	whitelisted_turfs = typecacheof(/turf/open/space/basic)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/obj/docking_port/mobile/diy
	name = "DIY"
	id = "diy_autism"
	dir = 2
	port_direction = 2
	width = 13
	height = 24
	dwidth = 6
	dheight = 23

/obj/docking_port/mobile/diy/Initialize()
	id += "[GLOB.diy_shuttle_count]"
	. = ..()

/obj/machinery/computer/camera_advanced/shuttle_docker/adv/diy
	name = "Do-It-Yourself shuttle navigation console"
	desc = "Used to designate a precise transit location."
	shuttleId = "diy_autism"
	shuttlePortId = "diy_autism_custom"
	jumpto_ports = list()
	dir = 1
	x_offset = 15
	y_offset = 0
	z_lock = list(2,3,4,7,8,9,10,12)

/obj/machinery/computer/camera_advanced/shuttle_docker/adv/diy/Initialize()
	shuttleId += "[GLOB.diy_shuttle_count]"
	shuttlePortId += "[GLOB.diy_shuttle_count]"
	. = ..()
	GLOB.jam_on_wardec += src

/obj/machinery/computer/camera_advanced/shuttle_docker/adv/diy/Destroy()
	GLOB.jam_on_wardec -= src
	return ..()

/obj/machinery/computer/shuttle/diy
	name = "Do-It-Yourself shuttle movement console"
	shuttleId = "diy_autism"
	possible_destinations = "diy_autism_home;diy_autism_custom"
	dir = 1

/obj/machinery/computer/shuttle/diy/Initialize()
	shuttleId += "[GLOB.diy_shuttle_count]"
	possible_destinations += "[GLOB.diy_shuttle_count]"
	. = ..()

/obj/docking_port/stationary/diy
	name = "DIY stationary"
	id = "diy_autism_home"
	dir = 2
	width = 13
	height = 24
	dwidth = 6
	dheight = 23

/area/shuttle/diy
	name = "Do-It-Yourself shuttle"
	requires_power = TRUE
	dynamic_lighting = DYNAMIC_LIGHTING_ENABLED
	has_gravity = STANDARD_GRAVITY
	always_unpowered = FALSE
	valid_territory = FALSE
	icon_state = "shuttle"
	unique = FALSE

/obj/item/survivalcapsule/diyshuttle
	name = "bluespace shuttle capsule"
	desc = "Priva."
	template_id = "autism"

/obj/item/survivalcapsule/diyshuttle/attack_self()
	. = ..()
	if(used)
		GLOB.diy_shuttle_count++