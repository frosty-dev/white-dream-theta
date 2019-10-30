/datum/job/assistant
	var/department

/datum/job/assistant/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	// Assign department security
	var/list/dep_list = list("Cargo", "Engineering", "Medical", "Research", "Security")
	if(!department || !(department in dep_list))
		department = pick(dep_list)
	var/ears = null
	var/accessory = null
	var/list/dep_access = null
	var/destination = null
	var/spawn_point = null
	switch(department)
		if("Cargo")
			ears = /obj/item/radio/headset/headset_cargo
			dep_access = list(ACCESS_MAILSORTING, ACCESS_CARGO)
			destination = /area/quartermaster/office
			//spawn_point = locate(/obj/effect/landmark/start/depsec/supply) in GLOB.department_security_spawns
			accessory = /obj/item/clothing/accessory/armband/cargo
		if("Engineering")
			ears = /obj/item/radio/headset/headset_eng
			dep_access = list(ACCESS_CONSTRUCTION, ACCESS_ENGINE)
			destination = /area/engine/engineering
			//spawn_point = locate(/obj/effect/landmark/start/depsec/engineering) in GLOB.department_security_spawns
			accessory = /obj/item/clothing/accessory/armband/engine
		if("Medical")
			ears = /obj/item/radio/headset/headset_med
			dep_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_CLONING)
			destination = /area/medical/medbay/central
			//spawn_point = locate(/obj/effect/landmark/start/depsec/medical) in GLOB.department_security_spawns
			accessory =  /obj/item/clothing/accessory/armband/medblue
		if("Research")
			ears = /obj/item/radio/headset/headset_sci
			dep_access = list(ACCESS_RESEARCH)
			destination = /area/science/lab
			//spawn_point = locate(/obj/effect/landmark/start/depsec/science) in GLOB.department_security_spawns
			accessory = /obj/item/clothing/accessory/armband/science
		if("Security")
			ears = /obj/item/radio/headset/headset_sec
			dep_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS)
			destination = /area/security/brig
			accessory = /obj/item/clothing/accessory/armband/deputy

	if(accessory)
		var/obj/item/clothing/under/U = H.w_uniform
		U.attach_accessory(new accessory)
	if(ears)
		if(H.ears)
			qdel(H.ears)
		H.equip_to_slot_or_del(new ears(H),SLOT_EARS)

	var/obj/item/card/id/W = H.wear_id
	W.access |= dep_access
	W.assignment = "[department] Assistant"
	W.name = replacetext(W.name, "Assistant", W.assignment)

	var/teleport = 0
	if(!CONFIG_GET(flag/sec_start_brig))
		if(destination || spawn_point)
			teleport = 1
	if(teleport)
		var/turf/T
		if(spawn_point)
			T = get_turf(spawn_point)
			H.Move(T)
		else
			var/safety = 0
			while(safety < 25)
				T = safepick(get_area_turfs(destination))
				if(T && !H.Move(T))
					safety += 1
					continue
				else
					break
	if(department)
		to_chat(M, "<b>You have been assigned to [department] department!</b>")
	else
		to_chat(M, "<b>You have not been assigned to any department. Ask who need your help.</b>")

/datum/job/assistant/cargo
	title = "Carrier"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Cargo crew"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/assistant/cargo
	antag_rep = 7
	paycheck = PAYCHECK_ASSISTANT // Get a job. Job reassignment changes your paycheck now. Get over it.
	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_SHAFT_MINER + 0.5
	department = "Cargo"

/datum/outfit/job/assistant/cargo
	name = "Assistant (Carrier)"
	jobtype = /datum/job/assistant/cargo

	ears = /obj/item/radio/headset/headset_cargo
	//uniform = /obj/item/clothing/under/color/lightbrown

/datum/outfit/job/assistant/cargo/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.jumpsuit_style == PREF_SUIT)
		uniform = /obj/item/clothing/under/color/lightbrown
	else
		uniform = /obj/item/clothing/under/color/jumpskirt/lightbrown

/datum/job/assistant/cargo/after_spawn(mob/living/carbon/human/H, mob/M)
	var/obj/item/clothing/under/U = H.w_uniform
	U.attach_accessory(new /obj/item/clothing/accessory/armband/cargo)

/datum/job/assistant/engineer
	title = "Engineer Trainee"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Engineersw"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/assistant/engineer
	antag_rep = 7
	paycheck = PAYCHECK_ASSISTANT // Get a job. Job reassignment changes your paycheck now. Get over it.
	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN + 0.5
	department = "Engineering"

/datum/outfit/job/assistant/engineer
	name = "Assistant (Engineer Trainee)"
	jobtype = /datum/job/assistant/engineer

	ears = /obj/item/radio/headset/headset_eng
	//uniform = /obj/item/clothing/under/color/yellow

/datum/outfit/job/assistant/engineer/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.jumpsuit_style == PREF_SUIT)
		uniform = /obj/item/clothing/under/color/yellow
	else
		uniform = /obj/item/clothing/under/color/jumpskirt/yellow

/datum/job/assistant/engineer/after_spawn(mob/living/carbon/human/H, mob/M)
	var/obj/item/clothing/under/U = H.w_uniform
	U.attach_accessory(new /obj/item/clothing/accessory/armband/engine)

/datum/job/assistant/medic
	title = "Nurse"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Medical crew"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/assistant/medic
	antag_rep = 7
	paycheck = PAYCHECK_ASSISTANT // Get a job. Job reassignment changes your paycheck now. Get over it.
	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_VIROLOGIST + 0.5
	department = "Medical"

/datum/outfit/job/assistant/medic
	name = "Assistant (Nurse)"
	jobtype = /datum/job/assistant/medic

	ears = /obj/item/radio/headset/headset_med
	//uniform = /obj/item/clothing/under/color/white

/datum/outfit/job/assistant/medic/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.jumpsuit_style == PREF_SUIT)
		uniform = /obj/item/clothing/under/color/white
	else
		uniform = /obj/item/clothing/under/color/jumpskirt/white

/datum/job/assistant/medic/after_spawn(mob/living/carbon/human/H, mob/M)
	var/obj/item/clothing/under/U = H.w_uniform
	U.attach_accessory(new /obj/item/clothing/accessory/armband/medblue)

/datum/job/assistant/science
	title = "Junior Researcher"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Research crew"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/assistant/science
	antag_rep = 7
	paycheck = PAYCHECK_ASSISTANT // Get a job. Job reassignment changes your paycheck now. Get over it.
	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_ROBOTICIST + 0.5
	department = "Research"

/datum/outfit/job/assistant/science
	name = "Assistant (Junior Researcher)"
	jobtype = /datum/job/assistant/science

	ears = /obj/item/radio/headset/headset_sci
	//uniform = /obj/item/clothing/under/color/purple

/datum/outfit/job/assistant/science/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.jumpsuit_style == PREF_SUIT)
		uniform = /obj/item/clothing/under/color/lightpurple
	else
		uniform = /obj/item/clothing/under/color/jumpskirt/lightpurple

/datum/job/assistant/science/after_spawn(mob/living/carbon/human/H, mob/M)
	var/obj/item/clothing/under/U = H.w_uniform
	U.attach_accessory(new /obj/item/clothing/accessory/armband/science)

/datum/job/assistant/security
	title = "Cadet"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Security"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/assistant/security
	antag_rep = 7
	paycheck = PAYCHECK_ASSISTANT // Get a job. Job reassignment changes your paycheck now. Get over it.
	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_SECURITY_OFFICER + 0.5
	department = "Security"

/datum/outfit/job/assistant/security
	name = "Assistant (Cadet)"
	jobtype = /datum/job/assistant/security

	ears = /obj/item/radio/headset/headset_sec
	//uniform = /obj/item/clothing/under/color/red

/datum/outfit/job/assistant/science/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.jumpsuit_style == PREF_SUIT)
		uniform = /obj/item/clothing/under/color/red
	else
		uniform = /obj/item/clothing/under/color/jumpskirt/red

/datum/job/assistant/security/after_spawn(mob/living/carbon/human/H, mob/M)
	var/obj/item/clothing/under/U = H.w_uniform
	U.attach_accessory(new /obj/item/clothing/accessory/armband/deputy)
