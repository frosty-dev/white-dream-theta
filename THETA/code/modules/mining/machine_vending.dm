//If you need to add some shit into mining vendor, do it here, PEEEEEDOR!!! (Gargulecode)

/obj/machinery/mineral/equipment_vendor/Initialize()
	. = ..()
	prize_list += list(
		new /datum/data/mining_equipment("Super Kinetic Accelerator",	/obj/item/gun/energy/kinetic_accelerator/super_kinetic_accelerator,	4000),
		)
