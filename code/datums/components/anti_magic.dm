/datum/component/anti_magic
	var/magic = FALSE
	var/holy = FALSE
<<<<<<< HEAD
=======
	var/psychic = FALSE
	var/allowed_slots = ITEM_SLOT_BACK|ITEM_SLOT_MASK|ITEM_SLOT_NECK|ITEM_SLOT_BELT|ITEM_SLOT_ID|ITEM_SLOT_EARS|ITEM_SLOT_EYES|ITEM_SLOT_GLOVES|ITEM_SLOT_HEAD|ITEM_SLOT_FEET|ITEM_SLOT_OCLOTHING|ITEM_SLOT_ICLOTHING|ITEM_SLOT_POCKET
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
	var/charges = INFINITY
	var/blocks_self = TRUE
	var/datum/callback/reaction
	var/datum/callback/expire

<<<<<<< HEAD
/datum/component/anti_magic/Initialize(_magic = FALSE, _holy = FALSE, _charges, _blocks_self = TRUE, datum/callback/_reaction, datum/callback/_expire)
=======
/datum/component/anti_magic/Initialize(_magic = FALSE, _holy = FALSE, _psychic = FALSE, _allowed_slots, _charges, _blocks_self = TRUE, datum/callback/_reaction, datum/callback/_expire)
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
	if(isitem(parent))
		RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, .proc/on_equip)
		RegisterSignal(parent, COMSIG_ITEM_DROPPED, .proc/on_drop)
	else if(ismob(parent))
		RegisterSignal(parent, COMSIG_MOB_RECEIVE_MAGIC, .proc/protect)
	else
		return COMPONENT_INCOMPATIBLE

	magic = _magic
	holy = _holy
<<<<<<< HEAD
=======
	psychic = _psychic
	if(_allowed_slots)
		allowed_slots = _allowed_slots
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
	if(!isnull(_charges))
		charges = _charges
	blocks_self = _blocks_self
	reaction = _reaction
	expire = _expire

/datum/component/anti_magic/proc/on_equip(datum/source, mob/equipper, slot)
	if(!CHECK_BITFIELD(allowed_slots, slotdefine2slotbit(slot)))
		UnregisterSignal(equipper, COMSIG_MOB_RECEIVE_MAGIC)
		return
	RegisterSignal(equipper, COMSIG_MOB_RECEIVE_MAGIC, .proc/protect, TRUE)

/datum/component/anti_magic/proc/on_drop(datum/source, mob/user)
	UnregisterSignal(user, COMSIG_MOB_RECEIVE_MAGIC)

<<<<<<< HEAD
/datum/component/anti_magic/proc/protect(datum/source, mob/user, _magic, _holy, major, self, list/protection_sources)
	if(((_magic && magic) || (_holy && holy)) && (!self || blocks_self))
=======
/datum/component/anti_magic/proc/protect(datum/source, mob/user, _magic, _holy, _psychic, chargecost, self, list/protection_sources)
	if(((_magic && magic) || (_holy && holy) || (_psychic && psychic)) && (!self || blocks_self))
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
		protection_sources += parent
		reaction?.Invoke(user, chargecost)
		charges -= chargecost
		if(charges <= 0)
			expire?.Invoke(user)
		return COMPONENT_BLOCK_MAGIC

