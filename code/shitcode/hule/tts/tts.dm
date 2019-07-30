//needs gtts module and ffmpeg

GLOBAL_VAR_INIT(tts, FALSE)

/mob/proc/tts(var/msg)
	msg = ph2up(msg)

	shell("python code/shitcode/hule/tts/tts.py \"[src.ckey]\" \"[msg]\"")
	//shell("python code/shitcode/hule/tts/tts.py \"debug\" \"проект каво\"")

	//spawn(10)
	if(fexists("code/shitcode/hule/tts/lines/[src.ckey].ogg"))
		for(var/mob/M in range(13))
			M.playsound_local(src.loc, "code/shitcode/hule/tts/lines/[src.ckey].ogg", 100)

/client/proc/anime_voiceover()
	set category = "Fun"
	set name = "ANIME VO"

	if(!check_rights())
		return

	GLOB.tts = !GLOB.tts

	if(GLOB.tts)
		message_admins("[key] toggled anime voiceover on.")
	else
		message_admins("[key] toggled anime voiceover off.")
