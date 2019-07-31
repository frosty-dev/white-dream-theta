 //needs gtts module and ffmpeg

GLOBAL_VAR_INIT(tts, FALSE)
GLOBAL_LIST_INIT(tts_settings, list("ru", 1, 1))//1-lang, 2-os, 3-livingonly
GLOBAL_LIST_EMPTY(tts_datums)

/atom/movable/proc/tts(var/msg, var/lang=GLOB.tts_settings[1])
	var/namae
	if(!ismob(src))
		namae = name
	else
		var/mob/etot = src
		namae = etot.ckey

	msg = ph2up(msg)

	if(GLOB.tts_settings[2])
		world.shelleo("python3 code/shitcode/hule/tts/tts.py \"[namae]\" \"[msg]\" \"[lang]\" ")
	else
		var/list/output = world.shelleo("python code/shitcode/hule/tts/tts.py \"[namae]\" \"[msg]\" \"[lang]\" ")
		to_chat(src, output)

	var/path = "code/shitcode/hule/tts/lines/[namae].ogg"
	if(fexists(path))
		for(var/mob/M in range(13))
			var/turf/T = get_turf(src)
			M.playsound_local(T, path, 100)
			fdel(path)
			fdel("code/shitcode/hule/tts/conv/[namae].mp3")

/atom/movable
	var/datum/tts/TTS

/atom/movable/proc/grant_tts()
	TTS = new /datum/tts
	TTS.owner = src

/atom/movable/proc/remove_tts()
	qdel(TTS)

/datum/tts
	var/atom/movable/owner
	var/cooldown = 0
	var/createtts = 0 //create tts on hear

	var/charcd = 0.5 //ticks for one char
	var/maxchars = 64 //sasai kudosai

/datum/tts/New()
	. = ..()
	GLOB.tts_datums += src
	START_PROCESSING(SSobj, src)

/datum/tts/Destroy()
	GLOB.tts_datums -= src
	STOP_PROCESSING(SSobj, src)
	. = ..()

/datum/tts/process()
	if(cooldown > 0)
		cooldown--

/datum/tts/proc/generate_tts(msg)
	if(!isliving(owner) && GLOB.tts_settings[3])
		return
	if(cooldown + 3 <= 0)
		msg = trim(msg, maxchars)
		cooldown = length(msg)*charcd
		if(!GLOB.tts_settings[2])
			to_chat(owner, "Trimmed to: [msg], CD: [cooldown]")
		owner.tts(msg)

/client/proc/anime_voiceover()
	set category = "Fun"
	set name = "ANIME VO"

	if(!(ckey in GLOB.anonists))
		return

	var/list/menu = list("Cancel", "Toggle TTS", "Change Lang", "OS Settings", "Toggle Living Only")

	var/selected = input("Main Menu", "ANIME VOICEOVER", "Cancel") as null|anything in menu

	switch(selected)
		if("Cancel")
			return

		if("Toggle TTS")
			GLOB.tts = !GLOB.tts

			if(GLOB.tts)
				message_admins("[key] toggled anime voiceover on.")
			else
				message_admins("[key] toggled anime voiceover off.")

		if("Change Lang")
			var/list/langlist = list("Cancel", "ru", "en", "en-gb", "ja", "fr")

			var/selectedlang = input("Main Menu", "ANIME VOICEOVER", null) as null|anything in langlist
			if(selectedlang == "Cancel")
				return

			message_admins("[key] sets anime voiceover lang to \"[selectedlang]\"")
			GLOB.tts_settings[1] = selectedlang

		if("OS Settings")
			GLOB.tts_settings[2] = !GLOB.tts_settings[2]

			if(GLOB.tts_settings[2])
				message_admins("[key] sets anime voiceover OS to Unix")
			else
				message_admins("[key] sets anime voiceover OS to Windows (Debug)")

		if("Toggle Living Only")
			GLOB.tts_settings[3] = !GLOB.tts_settings[3]

			if(GLOB.tts_settings[3])
				message_admins("[key] toggled living only tts on.")
			else
				message_admins("[key] toggled living only tts off.")


