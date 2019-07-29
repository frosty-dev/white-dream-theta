GLOBAL_LIST_EMPTY(de_admined)

/client/proc/de_admin()
	set name = "De_admin"
	set category = "Admin"
	set desc = "Deadmin an administrator for a round."

	var/list/choices = list()
	for(var/client/A in GLOB.admins)
		if(check_rights_for(A, R_PERMISSIONS))
			return
		else
			choices.Add(A)
	var/selected = input("Please, select an admin!", "Deadmin", null , null) as null|anything in choices
	if(!selected || !(selected in choices))
		return
	selected = choices[selected]
	if(selected == src)
		to_chat(src, "You can't deadmin yourself.")
		return
	var/client/C = selected
	if(C.ckey in GLOB.de_admined)
		to_chat(src, "[selected] is already deadmined!")
		return

	else
		C.holder.deactivate()
		GLOB.de_admined.Add(C.ckey)
		to_chat(C, "<span class='interface'>You were deadmined for this round by [src].</span>")
		log_admin("[src] deadmined [C] for this round.")
		message_admins("[src] deadmined [C] for this round..")
		//SSblackbox.record_feedback("tally", "admin_verb", 1, "Deadmin")