/mob/living/carbon/human/examine(mob/user)
//this is very slightly better than it was because you can use it more places. still can't do \his[src] though.
	var/t_on 	= ru_who(TRUE)
	var/t_ego 	= ru_ego()
	var/t_na 	= ru_na()
	var/t_a 	= ru_a()

	var/obscure_name

	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_PROSOPAGNOSIA))
			obscure_name = TRUE

	var/msg = "<span class='info'>*---------*\nЭто же <EM>[!obscure_name ? name : "неизвестный"]</EM>!\n"

	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))

	//uniform
	if(w_uniform && !(SLOT_W_UNIFORM in obscured))
		//accessory
		var/accessory_msg
		if(istype(w_uniform, /obj/item/clothing/under))
			var/obj/item/clothing/under/U = w_uniform
			if(U.attached_accessory)
				accessory_msg += " с [icon2html(U.attached_accessory, user)] \a [U.attached_accessory]"

		msg += "На н[t_na] [w_uniform.get_examine_string(user)][accessory_msg].\n"
	//head
	if(head)
		msg += "У н[t_ego] на голове [head.get_examine_string(user)].\n"
	//suit/armor
	if(wear_suit)
		msg += "На н[t_na] [wear_suit.get_examine_string(user)].\n"
		//suit/armor storage
		if(s_store && !(SLOT_S_STORE in obscured))
<<<<<<< HEAD
			msg += "Имеет [s_store.get_examine_string(user)] прикреплённый к [t_ego] [wear_suit.name].\n"
=======
			msg += "[t_He] [t_is] carrying [s_store.get_examine_string(user)] on [t_his] [wear_suit.name].\n"
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
	//back
	if(back)
		msg += "На спине у н[t_ego] [back.get_examine_string(user)].\n"

	//Hands
	for(var/obj/item/I in held_items)
		if(!(I.item_flags & ABSTRACT))
			msg += "[ru_ego(TRUE)] [get_held_index_name(get_held_index_of_item(I))] держит [I.get_examine_string(user)].\n"

	var/datum/component/forensics/FR = GetComponent(/datum/component/forensics)
	//gloves
	if(gloves && !(SLOT_GLOVES in obscured))
		msg += "На руках у н[t_ego] [gloves.get_examine_string(user)].\n"
	else if(FR && length(FR.blood_DNA))
		var/hand_number = get_num_arms(FALSE)
		if(hand_number)
			msg += "<span class='warning'>[ru_ego(TRUE)] рук[hand_number > 1 ? "и" : "а"] в крови!</span>\n"

	//handcuffed?

	//handcuffed?
	if(handcuffed)
		if(istype(handcuffed, /obj/item/restraints/handcuffs/cable))
			msg += "<span class='warning'>[t_on] [icon2html(handcuffed, user)] связан!</span>\n"
		else
			msg += "<span class='warning'>[t_on] [icon2html(handcuffed, user)] в наручниках!</span>\n"

	//belt
	if(belt)
		msg += "На поясе у н[t_ego] [belt.get_examine_string(user)].\n"

	//shoes
	if(shoes && !(SLOT_SHOES in obscured))
		msg += "На [t_ego] ногах надеты [shoes.get_examine_string(user)].\n"

	//mask
	if(wear_mask && !(SLOT_WEAR_MASK in obscured))
		msg += "[t_on] имеет [wear_mask.get_examine_string(user)] на [t_ego] лице.\n"

	if(wear_neck && !(SLOT_NECK in obscured))
<<<<<<< HEAD
		msg += "На шее у н[t_ego] [wear_neck.get_examine_string(user)].\n"
=======
		msg += "[t_He] [t_is] wearing [wear_neck.get_examine_string(user)] around [t_his] neck.\n"
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c

	//eyes
	if(!(SLOT_GLASSES in obscured))
		if(glasses)
<<<<<<< HEAD
			msg += "На н[t_na] [glasses.get_examine_string(user)].\n"
		else if(eye_color == BLOODCULT_EYE && iscultist(src) && has_trait(CULT_EYES))
			msg += "<span class='warning'><B>[ru_ego(TRUE)] глаза ярко-красные и они горят!</B></span>\n"
=======
			msg += "[t_He] [t_has] [glasses.get_examine_string(user)] covering [t_his] eyes.\n"
		else if(eye_color == BLOODCULT_EYE && iscultist(src) && HAS_TRAIT(src, CULT_EYES))
			msg += "<span class='warning'><B>[t_His] eyes are glowing an unnatural red!</B></span>\n"
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c

	//ears
	if(ears && !(SLOT_EARS in obscured))
		msg += "В ушах у н[t_ego] [ears.get_examine_string(user)].\n"

	//ID
	if(wear_id)
		msg += "Также у н[t_ego] есть [wear_id.get_examine_string(user)].\n"

	//Status effects
	msg += status_effect_examines()

	//Jitters
	switch(jitteriness)
		if(300 to INFINITY)
			msg += "<span class='warning'><B>[t_on] бьётся в судорогах!</B></span>\n"
		if(200 to 300)
			msg += "<span class='warning'>[t_on] нервно дёргается.</span>\n"
		if(100 to 200)
			msg += "<span class='warning'>[t_on] дрожит.</span>\n"

	var/appears_dead = 0
	if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		appears_dead = 1
		if(suiciding)
			msg += "<span class='warning'>[t_on] выглядит как суицидник... это уже невозможно спасти.</span>\n"
		if(hellbound)
			msg += "<span class='warning'>[ru_ego(TRUE)] душа выглядит оторванной от [t_ego] тела. Реанимация бесполезна.</span>\n"
		msg += "<span class='deadsay'>[t_on] не реагирует на происходящее вокруг; нет признаков жизни"
		if(getorgan(/obj/item/organ/brain))
			if(!key && !get_ghost(FALSE, TRUE))
<<<<<<< HEAD
				msg += " и [t_ego] душа ушла"
=======
				msg += " and [t_his] soul has departed"
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
		msg += "...</span>\n"

	if(get_bodypart(BODY_ZONE_HEAD) && !getorgan(/obj/item/organ/brain))
		msg += "<span class='deadsay'>Похоже, что у н[t_ego] нет мозга...</span>\n"

	var/temp = getBruteLoss() //no need to calculate each of these twice

	msg += "<span class='warning'>"

	var/list/missing = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	var/list/disabled = list()
	for(var/X in bodyparts)
		var/obj/item/bodypart/BP = X
		if(BP.disabled)
			disabled += BP
		missing -= BP.body_zone
		for(var/obj/item/I in BP.embedded_objects)
			msg += "<B>У н[t_ego] застрял \a [icon2html(I, user)] [I] в [BP.name]!</B>\n"

	for(var/X in disabled)
		var/obj/item/bodypart/BP = X
		var/damage_text
		if(!(BP.get_damage(include_stamina = FALSE) >= BP.max_damage)) //Stamina is disabling the limb
			damage_text = "вялый и безжизненный"
		else
			damage_text = (BP.brute_dam >= BP.burn_dam) ? BP.heavy_brute_msg : BP.heavy_burn_msg
<<<<<<< HEAD
		msg += "<B>[t_ego] [BP.name] [damage_text]!</B>\n"
=======
		msg += "<B>[capitalize(t_his)] [BP.name] is [damage_text]!</B>\n"
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c

	//stores missing limbs
	var/l_limbs_missing = 0
	var/r_limbs_missing = 0
	for(var/t in missing)
		if(t==BODY_ZONE_HEAD)
			msg += "<span class='deadsay'><B>[ru_ego(TRUE)] [parse_zone(t)] отсутствует!</B><span class='warning'>\n"
			continue
		if(t == BODY_ZONE_L_ARM || t == BODY_ZONE_L_LEG)
			l_limbs_missing++
		else if(t == BODY_ZONE_R_ARM || t == BODY_ZONE_R_LEG)
			r_limbs_missing++

		msg += "<B>[ru_ego(TRUE)] [parse_zone(t)] отсутствует!</B>\n"

	if(l_limbs_missing >= 2 && r_limbs_missing == 0)
		msg += "[t_on] стоит на правой части.\n"
	else if(l_limbs_missing == 0 && r_limbs_missing >= 2)
		msg += "[t_on] стоит на левой части.\n"
	else if(l_limbs_missing >= 2 && r_limbs_missing >= 2)
		msg += "[t_on] выглядит как котлетка.\n"

	if(!(user == src && src.hal_screwyhud == SCREWYHUD_HEALTHY)) //fake healthy
		if(temp)
			if(temp < 25)
				msg += "[t_on] имеет незначительные ушибы.\n"
			else if(temp < 50)
				msg += "[t_on] <b>тяжело</b> ранен[t_a]!\n"
			else
				msg += "<B>[t_on] смертельно ранен[t_a]!</B>\n"

		temp = getFireLoss()
		if(temp)
			if(temp < 25)
				msg += "[t_on] немного подгорел[t_a].\n"
			else if (temp < 50)
				msg += "[t_on] имеет <b>серьёзные</b> ожоги!\n"
			else
				msg += "<B>[t_on] имеет смертельные ожоги!</B>\n"

		temp = getCloneLoss()
		if(temp)
			if(temp < 25)
				msg += "[t_on] незначительные генетические повреждения.\n"
			else if(temp < 50)
				msg += "[t_on] <b>сильные</b> генетические повреждения!\n"
			else
				msg += "<b>[t_on] смертельные генетические повреждения!</b>\n"


	if(fire_stacks > 0)
		msg += "[t_on] в чем-то горючем.\n"
	if(fire_stacks < 0)
		msg += "[t_on] выглядит мокро.\n"


	if(pulledby && pulledby.grab_state)
		msg += "[t_on] удерживается захватом [pulledby].\n"

	if(nutrition < NUTRITION_LEVEL_STARVING - 50)
		msg += "[t_on] выглядит смертельно истощённо.\n"
	else if(nutrition >= NUTRITION_LEVEL_FAT)
		if(user.nutrition < NUTRITION_LEVEL_STARVING - 50)
			msg += "[t_on] выглядит как толстенький, словно поросёнок. Очень вкусный поросёнок.\n"
		else
			msg += "[t_on] выглядит довольно плотно.\n"
	switch(disgust)
		if(DISGUST_LEVEL_GROSS to DISGUST_LEVEL_VERYGROSS)
			msg += "[t_on] выглядит немного грязновато.\n"
		if(DISGUST_LEVEL_VERYGROSS to DISGUST_LEVEL_DISGUSTED)
			msg += "[t_on] выглядит очень грязно.\n"
		if(DISGUST_LEVEL_DISGUSTED to INFINITY)
			msg += "[t_on] выглядит отвратительно грязно.\n"

	if(blood_volume < BLOOD_VOLUME_SAFE)
		msg += "[ru_ego(TRUE)] кожа бледная.\n"

	if(bleedsuppress)
		msg += "[t_on] перевязан[t_a].\n"
	else if(bleed_rate)
<<<<<<< HEAD
		if(reagents.has_reagent("heparin"))
			msg += "<b>[t_on] обильно истекает кровью!</b>\n"
=======
		if(reagents.has_reagent(/datum/reagent/toxin/heparin))
			msg += "<b>[t_He] [t_is] bleeding uncontrollably!</b>\n"
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
		else
			msg += "<B>[t_on] истекает кровью!</B>\n"

<<<<<<< HEAD
	if(reagents.has_reagent("teslium"))
		msg += "[t_on] испускает нежное голубое свечение!\n"
=======
	if(reagents.has_reagent(/datum/reagent/teslium))
		msg += "[t_He] [t_is] emitting a gentle blue glow!\n"
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c

	if(islist(stun_absorption))
		for(var/i in stun_absorption)
			if(stun_absorption[i]["end_time"] > world.time && stun_absorption[i]["examine_message"])
				msg += "[t_on] [stun_absorption[i]["examine_message"]]\n"

<<<<<<< HEAD
	if(drunkenness && !skipface && !appears_dead) //Drunkenness
		switch(drunkenness)
			if(11 to 21)
				msg += "[t_on] немного пьян[t_a].\n"
			if(21.01 to 41) //.01s are used in case drunkenness ends up to be a small decimal
				msg += "[t_on] пьян[t_a].\n"
			if(41.01 to 51)
				msg += "[t_on] довольно пьян[t_a] и от н[t_ego] чувствуется запах алкоголя.\n"
			if(51.01 to 61)
				msg += "Очень пьян[t_a] и от н[t_ego] несёт перегаром.\n"
			if(61.01 to 91)
				msg += "[t_on] в стельку.\n"
			if(91.01 to INFINITY)
				msg += "[t_on] в говно!\n"

	msg += "</span>"

=======
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
	if(!appears_dead)
		if(drunkenness && !skipface) //Drunkenness
			switch(drunkenness)
				if(11 to 21)
					msg += "[t_He] [t_is] slightly flushed.\n"
				if(21.01 to 41) //.01s are used in case drunkenness ends up to be a small decimal
					msg += "[t_He] [t_is] flushed.\n"
				if(41.01 to 51)
					msg += "[t_He] [t_is] quite flushed and [t_his] breath smells of alcohol.\n"
				if(51.01 to 61)
					msg += "[t_He] [t_is] very flushed and [t_his] movements jerky, with breath reeking of alcohol.\n"
				if(61.01 to 91)
					msg += "[t_He] look[p_s()] like a drunken mess.\n"
				if(91.01 to INFINITY)
					msg += "[t_He] [t_is] a shitfaced, slobbering wreck.\n"

		if(src != user)
			if(HAS_TRAIT(user, TRAIT_EMPATH))
				if (a_intent != INTENT_HELP)
					msg += "[t_He] seem[p_s()] to be on guard.\n"
				if (getOxyLoss() >= 10)
					msg += "[t_He] seem[p_s()] winded.\n"
				if (getToxLoss() >= 10)
					msg += "[t_He] seem[p_s()] sickly.\n"
				var/datum/component/mood/mood = src.GetComponent(/datum/component/mood)
				if(mood.sanity <= SANITY_DISTURBED)
					msg += "[t_He] seem[p_s()] distressed.\n"
					SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "empath", /datum/mood_event/sad_empath, src)
				if (HAS_TRAIT(src, TRAIT_BLIND))
					msg += "[t_He] appear[p_s()] to be staring off into space.\n"
				if (HAS_TRAIT(src, TRAIT_DEAF))
					msg += "[t_He] appear[p_s()] to not be responding to noises.\n"

			msg += "</span>"

			if(HAS_TRAIT(user, TRAIT_SPIRITUAL) && mind?.isholy)
				msg += "[t_He] [t_has] a holy aura about [t_him].\n"
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "religious_comfort", /datum/mood_event/religiously_comforted)

		if(stat == UNCONSCIOUS)
			msg += "[t_on] не реагирует на происходящее вокруг.\n"
		else
<<<<<<< HEAD
			if(has_trait(TRAIT_DUMB))
				msg += "[t_on] имеет глупое выражение лица.\n"
=======
			if(HAS_TRAIT(src, TRAIT_DUMB))
				msg += "[t_He] [t_has] a stupid expression on [t_his] face.\n"
>>>>>>> cab74f9fac62079727d832be21546cf15fca2d8c
			if(InCritical())
				msg += "[t_on] едва в сознании.\n"
		if(getorgan(/obj/item/organ/brain))
			if(!key)
				msg += "<span class='deadsay'>[t_on] тотальный кататоник. Стресс от жизни в глубоком космосе сильно повлиял на н[t_ego]. Восстановление маловероятно.</span>\n"
			else if(!client)
				msg += "[t_on] имеет пустой, рассеянный взгляд и кажется совершенно не реагирующим ни на что. [t_on] может выйти из этого в ближайшее время.\n"

		if(digitalcamo)
			msg += "[t_on] двигает своим тело в неестественной и явно нечеловеческой манере.\n"

	msg += common_trait_examine()

	var/traitstring = get_trait_string()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/cyberimp/eyes/hud/CIH = H.getorgan(/obj/item/organ/cyberimp/eyes/hud)
		if(istype(H.glasses, /obj/item/clothing/glasses/hud) || CIH)
			var/perpname = get_face_name(get_id_name(""))
			if(perpname)
				var/datum/data/record/R = find_record("name", perpname, GLOB.data_core.general)
				if(R)
					msg += "<span class='deptradio'>Звание:</span> [R.fields["rank"]]<br>"
					msg += "<a href='?src=[REF(src)];hud=1;photo_front=1'>\[Front photo\]</a> "
					msg += "<a href='?src=[REF(src)];hud=1;photo_side=1'>\[Side photo\]</a><br>"
				if(istype(H.glasses, /obj/item/clothing/glasses/hud/health) || istype(CIH, /obj/item/organ/cyberimp/eyes/hud/medical))
					var/cyberimp_detect
					for(var/obj/item/organ/cyberimp/CI in internal_organs)
						if(CI.status == ORGAN_ROBOTIC && !CI.syndicate_implant)
							cyberimp_detect += "[name] модифицировано [CI.name].<br>"
					if(cyberimp_detect)
						msg += "Обнаружены кибернетические модификации:<br>"
						msg += cyberimp_detect
					if(R)
						var/health_r = R.fields["p_stat"]
						msg += "<a href='?src=[REF(src)];hud=m;p_stat=1'>\[[health_r]\]</a>"
						health_r = R.fields["m_stat"]
						msg += "<a href='?src=[REF(src)];hud=m;m_stat=1'>\[[health_r]\]</a><br>"
					R = find_record("name", perpname, GLOB.data_core.medical)
					if(R)
						msg += "<a href='?src=[REF(src)];hud=m;evaluation=1'>\[Medical evaluation\]</a><br>"
					if(traitstring)
						msg += "<span class='info'>Выявленные физиологические признаки:<br></span>"
						msg += "<span class='info'>[traitstring]</span><br>"



				if(istype(H.glasses, /obj/item/clothing/glasses/hud/security) || istype(CIH, /obj/item/organ/cyberimp/eyes/hud/security))
					if(!user.stat && user != src)
					//|| !user.canmove || user.restrained()) Fluff: Sechuds have eye-tracking technology and sets 'arrest' to people that the wearer looks and blinks at.
						var/criminal = "None"

						R = find_record("name", perpname, GLOB.data_core.security)
						if(R)
							criminal = R.fields["criminal"]

						msg += "<span class='deptradio'>Статус:</span> <a href='?src=[REF(src)];hud=s;status=1'>\[[criminal]\]</a>\n"
						msg += "<span class='deptradio'>Заметки:</span> <a href='?src=[REF(src)];hud=s;view=1'>\[View\]</a> "
						msg += "<a href='?src=[REF(src)];hud=s;add_crime=1'>\[Add crime\]</a> "
						msg += "<a href='?src=[REF(src)];hud=s;view_comment=1'>\[View comment log\]</a> "
						msg += "<a href='?src=[REF(src)];hud=s;add_comment=1'>\[Add comment\]</a>\n"
	else if(isobserver(user) && traitstring)
		msg += "<span class='info'><b>Черты:</b> [traitstring]</span><br>"
	msg += "*---------*</span>"

	to_chat(user, msg)
	return msg

/mob/living/proc/status_effect_examines(pronoun_replacement) //You can include this in any mob's examine() to show the examine texts of status effects!
	var/list/dat = list()
	if(!pronoun_replacement)
		pronoun_replacement = p_they(TRUE)
	for(var/V in status_effects)
		var/datum/status_effect/E = V
		if(E.examine_text)
			var/new_text = replacetext(E.examine_text, "SUBJECTPRONOUN", pronoun_replacement)
			new_text = replacetext(new_text, "[pronoun_replacement] ", "[pronoun_replacement] [p_are()]") //To make sure something become "They are" or "She is", not "They are" and "She are"
			dat += "[new_text]\n" //dat.Join("\n") doesn't work here, for some reason
	if(dat.len)
		return dat.Join()
