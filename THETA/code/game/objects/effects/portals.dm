/obj/effect/portal/anom/ladder
	invisibility = INVISIBILITY_ABSTRACT

/obj/effect/portal/anom/ladder/teleport(atom/movable/M, force = FALSE)
	if(!force && (!istype(M) || iseffect(M) || (ismecha(M) && !mech_sized) || (!isobj(M) && !ismob(M)))) //Things that shouldn't teleport.
		return
	var/turf/real_target = get_link_target_turf()
	if(!istype(real_target))
		return FALSE
	if(!force && (!ismecha(M) && !istype(M, /obj/projectile) && M.anchored && !allow_anchored))
		return
	if(ismegafauna(M))
		message_admins("[M] has used a ladder at [ADMIN_VERBOSEJMP(src)] made by [usr].")
	if(do_teleport(M, real_target, innate_accuracy_penalty, no_effects = FALSE, channel = teleport_channel))
		if(istype(M, /obj/projectile))
			var/obj/projectile/P = M
			P.ignore_source_check = TRUE
		if(M.pulling)
			do_teleport(M.pulling, real_target, innate_accuracy_penalty, no_effects = FALSE, channel = teleport_channel)
		return TRUE
	return FALSE
