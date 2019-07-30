 //needs gtts module and ffmpeg

GLOBAL_VAR_INIT(tts, FALSE)
GLOBAL_VAR_INIT(tts_lang, "ru")

/mob/proc/tts(var/msg)
	if(!isliving(src))
		return

	msg = trim(ph2up(msg), 16) //sasai kudosai
	//msg = trim(rhtml_encode(msg), 16)

	world.shelleo("python3 code/shitcode/hule/tts/tts.py \"[ckey]\" \"[msg]\" \"[GLOB.tts_lang]\" ")
	//var/list/output = world.shelleo("python code/shitcode/hule/tts/tts.py \"[ckey]\" \"[msg]\" \"[GLOB.tts_lang]\" ")

	//to_chat(src, output)

	//spawn(10)
	var/path = "code/shitcode/hule/tts/lines/[ckey].ogg"
	if(fexists(path))
		for(var/mob/M in range(13))
			M.playsound_local(src.loc, path, 100)
			fdel(path)

/client/proc/anime_voiceover()
	set category = "Fun"
	set name = "ANIME VO"

	if(!(ckey in GLOB.anonists))
		return

	var/list/menu = list("Cancel", "Toggle TTS", "Change Lang")

	var/selected = input("Main Menu", "ANIME VOICEOVER", null) as text|anything in menu

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

			var/selectedlang = input("Main Menu", "ANIME VOICEOVER", null) as text|anything in langlist
			if(selectedlang == "Cancel")
				return

			GLOB.tts_lang = selectedlang