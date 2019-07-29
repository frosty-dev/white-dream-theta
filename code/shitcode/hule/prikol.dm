GLOBAL_VAR_INIT(prikol_mode, FALSE)

/mob/living/carbon
	var/datum/cs_killcounter/killcounter

/*	//in carbon.dm
/mob/living/carbon/Initialize()
	. = ..()
	killcounter = new /datum/cs_killcounter
	killcounter.owner = src
*/

/datum/cs_killcounter
	var/mob/living/carbon/owner
	var/killcount = 0
	var/killstreak = 0
	var/maxkillstreak = 0
	var/time4kill = 150
	var/timer = 0
	var/processing = FALSE

/datum/cs_killcounter/proc/start()
	processing = TRUE
	START_PROCESSING(SSobj, src)

/datum/cs_killcounter/proc/stop()
	processing = FALSE
	maxkillstreak = killstreak
	STOP_PROCESSING(SSobj, src)

/datum/cs_killcounter/Destroy()
	. = ..()
	if(processing)
		stop()

/datum/cs_killcounter/process()
	if(timer)
		timer--
	else
		maxkillstreak = killstreak
		killstreak = 0

/datum/cs_killcounter/proc/count_kill(var/headshot = FALSE)
	killcount++

	if(!processing)
		return

	killstreak++
	timer += time4kill

	if(headshot)
		addtimer(CALLBACK(src, .proc/killsound), 30)
	else
		killsound()



/datum/cs_killcounter/proc/killsound() // ya hz ebat' y menya kakayata huevaya liba zvukov iz cs
	var/turf/T = get_turf(owner)
	switch(killstreak)
		if(2)
			playsound(T,'code/shitcode/hule/SFX/csSFX/doublekill1_ultimate.wav', 150, 5, pressure_affected = FALSE)
		if(3)
			playsound(T,'code/shitcode/hule/SFX/csSFX/triplekill_ultimate.wav', 150, 5, pressure_affected = FALSE)
		if(4)
			playsound(T,'code/shitcode/hule/SFX/csSFX/killingspree.wav', 150, 5, pressure_affected = FALSE)
		if(5)
			playsound(T,'code/shitcode/hule/SFX/csSFX/godlike.wav', 150, 5, pressure_affected = FALSE)


/client/verb/toggle_prikol()
	set category = "OOC"
	set name = "Toggle P.R.I.K.O.L"

	if(!(usr.ckey in GLOB.anonists))
		to_chat(usr, "<span class='userdanger'>Сорри, но ето бекдор, вам нельзя.........</span>")
		return

	GLOB.prikol_mode = !GLOB.prikol_mode

	if(GLOB.prikol_mode)
		for(var/mob/living/carbon/M in GLOB.carbon_list)
			M.killcounter.start()
		message_admins("[key] toggled P.R.I.K.O.L mode on.")
	else
		for(var/mob/living/carbon/M in GLOB.carbon_list)
			M.killcounter.stop()
		message_admins("[key] toggled P.R.I.K.O.L mode off.")

/proc/secure_kill(var/mob/living/victim, var/mob/living/carbon/frabber, var/obj/weapon) // PRIKOL
	var/hpnow = victim.health
	if(hpnow <= -100)
		if(istype(weapon, /obj/item/projectile))
			var/obj/item/projectile/P = weapon
			if(P.damage + hpnow > -100)
				frabber.killcounter.count_kill()

		else if(istype(weapon, /obj))
			var/obj/O = weapon
			if(O.force + hpnow > -100)
				frabber.killcounter.count_kill()