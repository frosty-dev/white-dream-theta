//частично спижжено со сталкербилда

#define BATTLE_MUSIC_PATH 	"code/shitcode/hule/battletension/bm/"
#define BATTLE_MUSIC_LIST 	list("80sspark")

#define CHANNEL_BATTLE 		1015

PROCESSING_SUBSYSTEM_DEF(btension)
	name = "Battle Tension"
	priority = 15
	flags = SS_NO_INIT
	wait = 20

/mob/living
	var/datum/btension/battletension

/mob/living/proc/create_tension()
	if(!battletension)
		battletension = new /datum/btension
		battletension.owner = src

/*
/mob/living/proc/remove_btension()
	qdel(battletension)
*/

/datum/btension
	var/mob/living/owner
	var/tension = 0
	var/sound/bm

/datum/btension/New()
	. = ..()
	START_PROCESSING(SSbtension, src)

/datum/btension/Destroy()
	STOP_PROCESSING(SSbtension, src)
	. = ..()

/datum/btension/proc/get_sound_list()
	var/list/bmlist = BATTLE_MUSIC_LIST

	for(var/I in bmlist)
		I = BATTLE_MUSIC_PATH + I + ".ogg"

	return bmlist

/datum/btension/process()
	if(!bm)
		var/sound/S = sound(pick(get_sound_list()))
		S.repeat = 1
		S.channel = CHANNEL_BATTLE
		S.falloff = 1
		S.wait = 0
		S.volume = 0
		S.status = SOUND_STREAM | SOUND_UPDATE
		S.environment = 0
		bm = S
		SEND_SOUND(owner, bm)
		bm.status = SOUND_STREAM

	switch(tension)
		if(-INFINITY to -1)
			bm.volume = 0
			owner << bm
			bm.status = 16
		if(0 to 30)
			bm.volume = tension
			owner << bm
			bm.status = 16
			tension -= 1
		if(31 to 79)
			bm.volume = tension
			owner << src.bm
			bm.status = 16
		/*	var/i
			for (i = 0, i < 10, i++)
				battle_screen_on()
				sleep(1)
				set_blurriness(0)
				sleep(1)*/
		if(80 to INFINITY)
			tension = 80
			bm.volume = 80
			src << bm
			bm.status = 16

	if (tension > 0)
		tension -= 2
	else
		bm = null