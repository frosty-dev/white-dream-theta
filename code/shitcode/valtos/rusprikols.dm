/obj/item/clothing/under/rank/omon
	name = "omon jumpsuit"
	desc = "A tactical security jumpsuit for Russian officers."
	icon_state = "omon"
	item_state = "b_suit"
	item_color = "omon"
	armor = list("melee" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)
	strip_delay = 50
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/obj/item/clothing/under/rank/omon/green
	icon_state = "omon-2"
	item_state = "g_suit"
	item_color = "omon-2"


/obj/item/clothing/suit/armor/riot/omon
	name = "omon riot suit"
	desc = "Designed for effective extermination."
	icon_state = "omon_riot"

/obj/item/clothing/suit/armor/bulletproof/omon
	name = "bulletproof omon armor"
	desc = "If you wear it, then obviously you are going to kill people."
	icon_state = "omon-armor"


/datum/job/officer/omon
	title = "Russian Officer"
	outfit = /datum/outfit/job/security/omon

/datum/outfit/job/security/omon
	name = "Russian Officer uniform"
	jobtype = /datum/job/officer/omon

	belt = /obj/item/pda/security
	ears = /obj/item/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/rank/omon
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/sec
	suit = /obj/item/clothing/suit/armor/vest/alt
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld
	suit_store = /obj/item/gun/energy/disabler
	backpack_contents = list(/obj/item/melee/baton/loaded=1)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/security

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/energy/disabler, /obj/item/clothing/glasses/hud/security/sunglasses, /obj/item/clothing/head/helmet)
	//The helmet is necessary because /obj/item/clothing/head/helmet/sec is overwritten in the chameleon list by the standard helmet, which has the same name and icon state
