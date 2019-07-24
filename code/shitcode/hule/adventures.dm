#define ADVENTURES_VER 1

/datum/adventurer_info
	var/points = 0

/datum/adventurer_info/proc/path(ckey)
	return "data/player_saves/[copytext(user.ckey, 1, 2)]/[user.ckey]/adventures.sav"

/datum/adventurer_info/proc/save(ckey)
	if(IsGuestKey(user.key))
		return 0

	var/savefile/F = new /savefile(path(ckey))

	WRITE_FILE(F["points"], points)

	WRITE_FILE(F["version"], ADVENTURES_VER)

	return 1

/datum/adventurer_info/proc/load(ckey)
	if (IsGuestKey(user.key))
		return 0

	var/path = path(ckey)

	if (!fexists(path))
		return 0

	var/savefile/F = new /savefile(path)

	if(!F)
		return

	var/version = null
	F["version"] >> version

	if (isnull(version) || version != ADVENTURES_VER)
		fdel(path)
		alert(user, "Your savefile was incompatible with this version and was deleted.")
		return 0

	F["points"] >> src.points



	return 1

/obj/item/card/adventurer
	name = "adventurer's card"
	var/client/owner
	var/datum/adventurer_info/info

/obj/item/card/adventurer/attack_self(mob/user)
	if(!owner)
		owner = user.client
		name += " ([user.name])"
		load(user.ckey)



/*
possible quest items
/obj/item/organ/tongue/zombie - box whiteship
/obj/item/kitchen/knife/envy
/obj/item/clockwork/weapon/ratvarian_spear
/obj/item/storage/fancy/cigarettes/cigpack_syndicate
/obj/item/gun/energy/laser/retro
/obj/item/toy/plush/awakenedplushie
/obj/item/stack/ore/bananium
/obj/item/hilbertshotel
/obj/item/paper/guides/antag/abductor
/obj/item/circuitboard/machine/clonepod/experimental
/obj/item/clothing/under/rank/centcom_officer
/obj/item/coin/bananium
/obj/item/gun/ballistic/automatic/pistol/m1911
/obj/item/paper/secretrecipe



*/
