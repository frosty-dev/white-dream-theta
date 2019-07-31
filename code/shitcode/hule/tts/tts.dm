 //needs gtts module and ffmpeg

GLOBAL_VAR_INIT(tts, FALSE)
GLOBAL_VAR_INIT(tts_lang, "ru")
GLOBAL_VAR_INIT(tts_os_unix, TRUE)

/atom/movable/proc/tts(var/msg, var/lang=GLOB.tts_lang)
	if(!isliving(src)) // potom mb zavezu dlya drugih
		return

	var/mob/M = src

	msg = ph2up(msg)

	if(GLOB.tts_os_unix)
		world.shelleo("python3 code/shitcode/hule/tts/tts.py \"[M.ckey]\" \"[msg]\" \"[lang]\" ")
	else
		var/list/output = world.shelleo("python code/shitcode/hule/tts/tts.py \"[M.ckey]\" \"[msg]\" \"[lang]\" ")
		to_chat(M, output)

	var/path = "code/shitcode/hule/tts/lines/[M.ckey].ogg"
	if(fexists(path))
		for(var/mob/MB in range(11))
			MB.playsound_local(loc, path, 100)
			fdel(path)
			fdel("code/shitcode/hule/tts/conv/[M.ckey].mp3")

/mob/living
	var/datum/tts/TTS = new

/datum/tts
	var/mob/living/owner
	var/cooldown = 0
	var/createtts = 0 //create tts on hear

	var/charcd = 0.25 //ticks for one char
	var/maxchars = 64 //sasai kudosai

/datum/tts/New()
	. = ..()
	START_PROCESSING(SSobj, src)

/datum/tts/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/datum/tts/process()
	if(cooldown > 0)
		cooldown--

/datum/tts/proc/generate_tts(msg)
	if(cooldown <= 0)
		msg = trim(msg, maxchars)
		cooldown = length(msg)*charcd
		if(!GLOB.tts_os_unix)
			to_chat(owner, "Trimmed to: [msg], CD: [cooldown]")
		owner.tts(msg)


/client/proc/anime_voiceover()
	set category = "Fun"
	set name = "ANIME VO"

	if(!(ckey in GLOB.anonists))
		return

	var/list/menu = list("Cancel", "Toggle TTS", "Change Lang", "OS Settings")

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
			GLOB.tts_lang = selectedlang

		if("OS Settings")
			GLOB.tts_os_unix = !GLOB.tts_os_unix

			if(GLOB.tts_os_unix)
				message_admins("[key] sets anime voiceover OS to Unix")
			else
				message_admins("[key] sets anime voiceover OS to Windows (Debug)")

