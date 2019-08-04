/atom/proc/ru_get_examine_name(mob/user)
	switch (prob(100))
		if (0 to 3)
			. = "непримечательный [src]"
		if (4 to 12)
			. = "обычный [src]"
		else
			. = "[src]"
	var/list/override = list(gender == PLURAL ? " " : " ", " ", "[name]")
	if(article)
		. = "[article] [src]"
		override[EXAMINE_POSITION_ARTICLE] = article
	if(SEND_SIGNAL(src, COMSIG_ATOM_GET_EXAMINE_NAME, user, override) & COMPONENT_EXNAME_CHANGED)
		. = override.Join("")

///Generate the full examine string of this atom (including icon for goonchat)
/atom/proc/ru_get_examine_string(mob/user)
	return "[icon2html(src, user)] [ru_get_examine_name(user)]"