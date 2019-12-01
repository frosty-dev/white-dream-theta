/datum/world_topic/players
	keyword = "players"
//	log = FALSE

/datum/world_topic/players/Run(list/input)
	return GLOB.player_list.len
/*
/datum/world_topic/adminwho
	keyword = "adminwho"
//	log = FALSE

/datum/world_topic/adminwho/Run(list/input)
	var/msg = "Current Admins:\n"
	for(var/adm in GLOB.admins)
		var/client/C = adm
		if(!C.holder.fakekey)
			msg += "\t[C] is a [C.holder.rank]"
			msg += "\n"
	return msg
*/
/datum/world_topic/who
	keyword = "who"
//	log = FALSE

/datum/world_topic/who/Run(list/input)
	var/msg = "Current Players:\n"
	var/n = 0
	for(var/client/C in GLOB.clients)
		n++
		if(C.holder && C.holder.fakekey)
			msg += "\t[C.holder.fakekey]\n"
		else
			msg += "\t[C.key]\n"
	msg += "Total Players: [n]"
	return msg

/datum/world_topic/asay
	keyword = "asay"
	require_comms_key = TRUE

/datum/world_topic/asay/Run(list/input)
	var/msg = "<span class='adminobserver'><span class='prefix'>DISCORD ADMIN:</span> <EM>[input["admin"]]</EM>: <span class='message'>[input["asay"]]</span></span>"
	to_chat(GLOB.admins, msg)

/datum/world_topic/ooc
	keyword = "ooc"

/datum/world_topic/ooc/Run(list/input)
	if(!GLOB.ooc_allowed&&!input["isadmin"])
		return "globally muted"
	else if(is_banned_from(input["ckey"], "OOC"))
		return "muted"
	for(var/client/C in GLOB.clients)
		if(C.prefs.chat_toggles & CHAT_OOC) // ooc ignore
			if(!(input["ckey"] in C.prefs.ignoring)) //ckey ignore
				to_chat(C, "<font color='[GLOB.normal_ooc_colour]'><span class='ooc'><span class='prefix'>DISCORD OOC:</span> <EM>[input["ckey"]]:</EM> <span class='message'>[input["ooc"]]</span></span></font>")

/datum/world_topic/ahelp
	keyword = "adminhelp"
	require_comms_key = TRUE

/datum/world_topic/ahelp/Run(list/input)
	var/r_ckey = ckey(input["ckey"])
	var/s_admin = input["admin"]
	var/msg = sanitize(input["response"])
	var/keywordparsedmsg = keywords_lookup(msg)
	var/client/recipient = GLOB.directory[r_ckey]
	if(!recipient)
		return "FAIL"
	if(!recipient.current_ticket)
		new /datum/admin_help(msg, recipient, TRUE)
	to_chat(recipient, "<font color='red' size='4'><b>-- Discord administrator private message --</b></font>")
	to_chat(recipient, "<font color='red'>Admin PM from-<b>[s_admin]</b>: [msg]</font>")
	to_chat(recipient, "<font color='red'><i>Write to ahelp to reply.</i></font>")
	to_chat(src, "<font color='blue'>Admin PM to-<b>[key_name(recipient, 1, 1)]</b>: [msg]</font>")

	recipient.giveadminhelpverb() //reset ahelp CD to allow fast reply

	admin_ticket_log(recipient, "<font color='blue'>PM From [s_admin]: [keywordparsedmsg]</font>")
	//BWOINK
	SEND_SOUND(recipient, sound('sound/effects/adminhelp.ogg'))
	log_admin_private("PM: IRC -> [r_ckey]: [sanitize(msg)]")
	for(var/client/X in GLOB.admins)
		to_chat(X, "<font color='blue'><B>PM: DISCORD([s_admin]) -&gt; [key_name(recipient, X, 0)]</B> [keywordparsedmsg]</font>")
	webhook_send_ahelp("[sanitize(input["admin"])] -> [ckey(input["ckey"])]", sanitize(input["response"]))

/datum/config_entry/string/webhook_address
	protection = CONFIG_ENTRY_HIDDEN
/datum/config_entry/string/webhook_key
	protection = CONFIG_ENTRY_HIDDEN

/client/verb/bot_token(token as text)
	set name = "Bot token"
	set category = "OOC"
	set desc = "Sends specific token to bot through webhook"

	webhook_send_token(key, token)

GLOBAL_VAR_INIT(webhook_can_fire, 0)

/proc/webhook_send_roundstatus(var/status, var/extraData)
	var/list/query = list("status" = status)

	if(extraData)
		query.Add(extraData)

	webhook_send("roundstatus", query)

/proc/webhook_send_runtime(var/message) //when server logging gets fucked up, discord bot saves the day
	var/list/query = list("message" = message)
	webhook_send("runtimemessage", query)

/proc/webhook_send_asay(var/ckey, var/message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("asaymessage", query)

/proc/webhook_send_ooc(var/ckey, var/message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("oocmessage", query)

/proc/webhook_send_me(var/ckey, var/message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("memessage", query)

/proc/webhook_send_ahelp(var/ckey, var/message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("ahelpmessage", query)

/proc/webhook_send_garbage(var/ckey, var/message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("garbage", query)

/proc/webhook_send_token(var/ckey, var/token)
	var/list/query = list("ckey" = ckey, "token" = token)
	webhook_send("token", query)

/proc/webhook_send_status_update(var/event, var/data)
	var/list/query = list("event" = event, "data" = data)
	webhook_send("status_update", query)

/proc/webhook_send(var/method, var/data)
	if (!GLOB.webhook_can_fire)
		return
	if (!CONFIG_GET(string/webhook_address) || !CONFIG_GET(string/webhook_key))
		return
	var/query = "[CONFIG_GET(string/webhook_address)]?key=[CONFIG_GET(string/webhook_key)]&method=[method]&data=[url_encode(json_encode(data))]"
	spawn(-1)
		world.Export(query)
