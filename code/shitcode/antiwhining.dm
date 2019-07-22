
/client
	var/shadowbanned_ooc = 0

/*
GLOBAL_LIST_INIT(shadowbanned_ooc, list())

/proc/is_shadowbanned(ckey)
	if(!ckey)
		return

	var/client/C = GLOB.directory[ckey]
	var/CS = sanitizeSQL(C)

	if((C && C in GLOB.shadowbanned_ooc)||(CS && CS in GLOB.shadowbanned_ooc))
		return 1
	else
		return 0*/

/proc/whiningcheck(client/C, msg)

