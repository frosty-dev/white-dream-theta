/********************** New mining areas **************************/

/area/thetaMining
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE

/area/thetaMining/surface
	name = "Mining Theta"
	icon_state = "purple"
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = TRUE
	requires_power = TRUE
	ambientsounds = MINING
	dynamic_lighting = DYNAMIC_LIGHTING_IFSTARLIGHT
	outdoors = TRUE

/area/thetaMining/underground
	name = "Caves"
	icon_state = "red"
	always_unpowered = TRUE
	requires_power = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	ambientsounds = MINING
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
