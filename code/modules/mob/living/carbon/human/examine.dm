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

	. = list("<span class='info'>*---------*\n��� �� <EM>[!obscure_name ? name : "Unknown"]</EM>!")

	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))

	//uniform
	if(w_uniform && !(SLOT_W_UNIFORM in obscured))
		//accessory
		var/accessory_msg
		if(istype(w_uniform, /obj/item/clothing/under))
			var/obj/item/clothing/under/U = w_uniform
			if(U.attached_accessory)
				accessory_msg += " � [icon2html(U.attached_accessory, user)] \a [U.attached_accessory]"

		. += "�� �[t_na] [w_uniform.ru_get_examine_string(user)][accessory_msg]."
	//head
	if(head)
		. += "�� ������ � �[t_ego] [head.ru_get_examine_string(user)]."
	//suit/armor
	if(wear_suit)
		. += "�� �[t_na] [wear_suit.ru_get_examine_string(user)]."
		//suit/armor storage
		if(s_store && !(SLOT_S_STORE in obscured))
			. += "� � ���� ��������� [s_store.ru_get_examine_string(user)]."
	//back
	if(back)
		. += "�� [t_ego] ����� [back.ru_get_examine_string(user)]."

	//Hands
	for(var/obj/item/I in held_items)
		if(!(I.item_flags & ABSTRACT))
			. += "� [t_ego] [get_held_index_name(get_held_index_of_item(I))] ��[t_a] ������ [I.ru_get_examine_string(user)]."

	var/datum/component/forensics/FR = GetComponent(/datum/component/forensics)
	//gloves
	if(gloves && !(SLOT_GLOVES in obscured))
		. += "�� ����� � �[t_ego] [gloves.ru_get_examine_string(user)]."
	else if(FR && length(FR.blood_DNA))
		var/hand_number = get_num_arms(FALSE)
		if(hand_number)
			. += "<span class='warning'>[ru_ego(TRUE)] ���[hand_number > 1 ? "�" : "�"] � �����!</span>"

	//handcuffed?

	//handcuffed?
	if(handcuffed)
		if(istype(handcuffed, /obj/item/restraints/handcuffs/cable))
			. += "<span class='warning'>[t_on] [icon2html(handcuffed, user)] ������[t_a]!</span>"
		else
			. += "<span class='warning'>[t_on] [icon2html(handcuffed, user)] � ����������!</span>"

	//belt
	if(belt)
		. += "�� ����� � �[t_ego] [belt.ru_get_examine_string(user)]."

	//shoes
	if(shoes && !(SLOT_SHOES in obscured))
		. += "�� [t_ego] ����� ������ [shoes.ru_get_examine_string(user)]."

	//mask
	if(wear_mask && !(SLOT_WEAR_MASK in obscured))
		. += "[t_on] ����� [wear_mask.ru_get_examine_string(user)] �� [t_ego] ����."

	if(wear_neck && !(SLOT_NECK in obscured))
		. += "�� ��� � �[t_ego] [wear_neck.ru_get_examine_string(user)]."

	//eyes
	if(!(SLOT_GLASSES in obscured))
		if(glasses)
			. += "�� �[t_na] [glasses.ru_get_examine_string(user)]."
		else if(eye_color == BLOODCULT_EYE && iscultist(src) && HAS_TRAIT(src, CULT_EYES))
			. += "<span class='warning'><B>[ru_ego(TRUE)] ����� ����-������� � ��� �����!</B></span>"

	//ears
	if(ears && !(SLOT_EARS in obscured))
		. += "� ���� � �[t_ego] [ears.ru_get_examine_string(user)]."

	//ID
	if(wear_id)
		. += "����� � �[t_ego] ���� [wear_id.ru_get_examine_string(user)]."

	//Status effects
	var/list/status_examines = status_effect_examines()
	if (length(status_examines))
		. += status_examines

	//Jitters
	switch(jitteriness)
		if(300 to INFINITY)
			. += "<span class='warning'><B>[t_on] ������ � ���������!</B></span>"
		if(200 to 300)
			. += "<span class='warning'>[t_on] ������ ��������.</span>"
		if(100 to 200)
			. += "<span class='warning'>[t_on] ������.</span>"

	var/appears_dead = 0
	if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		appears_dead = 1
		if(suiciding)
			. += "<span class='warning'>[t_on] �������� ��� ���������... [t_ego] ��� ���������� ������.</span>"
		if(hellbound)
			. += "<span class='warning'>[ru_ego(TRUE)] ���� �������� ���������� �� [t_ego] ����. ���������� ����������.</span>"
		. += ""
		if(getorgan(/obj/item/organ/brain) && !key && !get_ghost(FALSE, TRUE))
			. += "<span class='deadsay'>[t_on] �� ��������� �� ������������ ������; ��� ��������� ����� � ����...</span>"
		else
			. += "<span class='deadsay'>[t_on] �� ��������� �� ������������ ������; ��� ��������� �����...</span>"

	if(get_bodypart(BODY_ZONE_HEAD) && !getorgan(/obj/item/organ/brain))
		. += "<span class='deadsay'>������, ��� � �[t_ego] ��� �����...</span>"

	var/temp = getBruteLoss() //no need to calculate each of these twice

	var/list/msg = list()

	var/list/missing = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	var/list/disabled = list()
	for(var/X in bodyparts)
		var/obj/item/bodypart/BP = X
		if(BP.disabled)
			disabled += BP
		missing -= BP.body_zone
		for(var/obj/item/I in BP.embedded_objects)
			msg += "<B>� �[t_ego] ������� \a [icon2html(I, user)] [I] � [BP.name]!</B>\n"

	for(var/X in disabled)
		var/obj/item/bodypart/BP = X
		var/damage_text
		if(!(BP.get_damage(include_stamina = FALSE) >= BP.max_damage)) //Stamina is disabling the limb
			damage_text = "����� � ������������"
		else
			damage_text = (BP.brute_dam >= BP.burn_dam) ? BP.heavy_brute_msg : BP.heavy_burn_msg
		msg += "<B>[t_ego] [BP.name] [damage_text]!</B>\n"

	//stores missing limbs
	var/l_limbs_missing = 0
	var/r_limbs_missing = 0
	for(var/t in missing)
		if(t==BODY_ZONE_HEAD)
			msg += "<span class='deadsay'><B>[ru_ego(TRUE)] [parse_zone(t)] �����������!</B><span class='warning'>\n"
			continue
		if(t == BODY_ZONE_L_ARM || t == BODY_ZONE_L_LEG)
			l_limbs_missing++
		else if(t == BODY_ZONE_R_ARM || t == BODY_ZONE_R_LEG)
			r_limbs_missing++

		msg += "<B>[ru_ego(TRUE)] [parse_zone(t)] �����������!</B>\n"

	if(l_limbs_missing >= 2 && r_limbs_missing == 0)
		msg += "[t_on] ����� �� ������ �����.\n"
	else if(l_limbs_missing == 0 && r_limbs_missing >= 2)
		msg += "[t_on] ����� �� ����� �����.\n"
	else if(l_limbs_missing >= 2 && r_limbs_missing >= 2)
		msg += "[t_on] �������� ��� ��������.\n"

	if(!(user == src && src.hal_screwyhud == SCREWYHUD_HEALTHY)) //fake healthy
		if(temp)
			if(temp < 25)
				msg += "[t_on] ����� �������������� �����.\n"
			else if(temp < 50)
				msg += "[t_on] <b>������</b> �����[t_a]!\n"
			else
				msg += "<B>[t_on] ���������� �����[t_a]!</B>\n"

		temp = getFireLoss()
		if(temp)
			if(temp < 25)
				msg += "[t_on] ������� ��������[t_a].\n"
			else if (temp < 50)
				msg += "[t_on] ����� <b>���������</b> �����!\n"
			else
				msg += "<B>[t_on] ����� ����������� �����!</B>\n"

		temp = getCloneLoss()
		if(temp)
			if(temp < 25)
				msg += "[t_on] �������������� ������������ �����������.\n"
			else if(temp < 50)
				msg += "[t_on] <b>�������</b> ������������ �����������!\n"
			else
				msg += "<b>[t_on] ����������� ������������ �����������!</b>\n"


	if(fire_stacks > 0)
		msg += "[t_on] � ���-�� �������.\n"
	if(fire_stacks < 0)
		msg += "[t_on] �������� �����.\n"


	if(pulledby && pulledby.grab_state)
		msg += "[t_on] ������������ �������� [pulledby].\n"

	if(nutrition < NUTRITION_LEVEL_STARVING - 50)
		msg += "[t_on] �������� ���������� ���������.\n"
	else if(nutrition >= NUTRITION_LEVEL_FAT)
		if(user.nutrition < NUTRITION_LEVEL_STARVING - 50)
			msg += "[t_on] �������� ��� �����������, ������ ��������. ����� ������� ��������.\n"
		else
			msg += "[t_on] �������� �������� ������.\n"
	switch(disgust)
		if(DISGUST_LEVEL_GROSS to DISGUST_LEVEL_VERYGROSS)
			msg += "[t_on] �������� ������� ����������.\n"
		if(DISGUST_LEVEL_VERYGROSS to DISGUST_LEVEL_DISGUSTED)
			msg += "[t_on] �������� ����� ������.\n"
		if(DISGUST_LEVEL_DISGUSTED to INFINITY)
			msg += "[t_on] �������� ������������� ������.\n"

	if(blood_volume < BLOOD_VOLUME_SAFE)
		msg += "[ru_ego(TRUE)] ���� �������.\n"

	if(bleedsuppress)
		msg += "[t_on] ���������[t_a].\n"
	else if(bleed_rate)
		if(reagents.has_reagent(/datum/reagent/toxin/heparin))
			msg += "<b>[t_on] ������� �������� ������!</b>\n"
		else
			msg += "<B>[t_on] �������� ������!</B>\n"

	if(reagents.has_reagent(/datum/reagent/teslium))
		msg += "[t_on] ��������� ������ ������� ��������!\n"

	if(islist(stun_absorption))
		for(var/i in stun_absorption)
			if(stun_absorption[i]["end_time"] > world.time && stun_absorption[i]["examine_message"])
				msg += "[t_on] [stun_absorption[i]["examine_message"]]\n"

	if(!appears_dead)
		if(drunkenness && !skipface) //Drunkenness
			switch(drunkenness)
				if(11 to 21)
					msg += "[t_on] ������� ����[t_a].\n"
				if(21.01 to 41) //.01s are used in case drunkenness ends up to be a small decimal
					msg += "[t_on] ����[t_a].\n"
				if(41.01 to 51)
					msg += "[t_on] �������� ����[t_a] � �� �[t_ego] ����������� ����� ��������.\n"
				if(51.01 to 61)
					msg += "����� ����[t_a] � �� �[t_ego] ���� ���������.\n"
				if(61.01 to 91)
					msg += "[t_on] � �������.\n"
				if(91.01 to INFINITY)
					msg += "[t_on] � �����!\n"

		if(src != user)
			if(HAS_TRAIT(user, TRAIT_EMPATH))
				if (a_intent != INTENT_HELP)
					msg += "[t_on] �������� �� ������.\n"
				if (getOxyLoss() >= 10)
					msg += "[t_on] �������� ���������.\n"
				if (getToxLoss() >= 10)
					msg += "[t_on] �������� ����������.\n"
				var/datum/component/mood/mood = src.GetComponent(/datum/component/mood)
				if(mood.sanity <= SANITY_DISTURBED)
					msg += "[t_on] �������� ����������.\n"
					SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "empath", /datum/mood_event/sad_empath, src)
				if (HAS_TRAIT(src, TRAIT_BLIND))
					msg += "[t_on] ������� � �������.\n"
				if (HAS_TRAIT(src, TRAIT_DEAF))
					msg += "[t_on] �� ��������� �� ���.\n"

			msg += "</span>"

			if(HAS_TRAIT(user, TRAIT_SPIRITUAL) && mind?.isholy)
				msg += "�� �[t_ego] ���� ������ �����.\n"
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "religious_comfort", /datum/mood_event/religiously_comforted)

		if(stat == UNCONSCIOUS)
			msg += "[t_on] �� ��������� �� ������������ ������.\n"
		else
			if(HAS_TRAIT(src, TRAIT_DUMB))
				msg += "[t_on] ����� ������ ��������� ����.\n"
			if(InCritical())
				msg += "[t_on] ���� � ��������.\n"
		if(getorgan(/obj/item/organ/brain))
			if(!key)
				msg += "<span class='deadsay'>[t_on] ��������� ���������. ������ �� ����� � �������� ������� ������ ������� �� �[t_ego]. �������������� ������������.</span>\n"
			else if(!client)
				msg += "[t_on] ����� ������, ���������� ������ � ������� ���������� �� ����������� �� �� ���. [t_on] ����� ����� �� ����� � ��������� �����.\n"

		if(digitalcamo)
			msg += "[t_on] ������� ����� ���� � �������������� � ���� �������������� ������.\n"

	if (length(msg))
		. += "<span class='warning'>[msg.Join("")]</span>"

	var/trait_exam = common_trait_examine()
	if (!isnull(trait_exam))
		. += trait_exam

	var/traitstring = get_trait_string()

	var/perpname = get_face_name(get_id_name(""))
	if(perpname && (HAS_TRAIT(user, TRAIT_SECURITY_HUD) || HAS_TRAIT(user, TRAIT_MEDICAL_HUD)))
		var/datum/data/record/R = find_record("name", perpname, GLOB.data_core.general)
		if(R)
			. += "<span class='deptradio'>���������:</span> [R.fields["rank"]]\n<a href='?src=[REF(src)];hud=1;photo_front=1'>\[Front photo\]</a><a href='?src=[REF(src)];hud=1;photo_side=1'>\[Side photo\]</a>"
		if(HAS_TRAIT(user, TRAIT_MEDICAL_HUD))
			var/cyberimp_detect
			for(var/obj/item/organ/cyberimp/CI in internal_organs)
				if(CI.status == ORGAN_ROBOTIC && !CI.syndicate_implant)
					cyberimp_detect += "[name] �������������� [CI.name]."
			if(cyberimp_detect)
				. += "���������� ��������������� �����������:"
				. += cyberimp_detect
			if(R)
				var/health_r = R.fields["p_stat"]
				. += "<a href='?src=[REF(src)];hud=m;p_stat=1'>\[[health_r]\]</a>"
				health_r = R.fields["m_stat"]
				. += "<a href='?src=[REF(src)];hud=m;m_stat=1'>\[[health_r]\]</a>"
			R = find_record("name", perpname, GLOB.data_core.medical)
			if(R)
				. += "<a href='?src=[REF(src)];hud=m;evaluation=1'>\[Medical evaluation\]</a><br>"
			if(traitstring)
				. += "<span class='info'>���������� ��������������� ��������:\n[traitstring]"

		if(HAS_TRAIT(user, TRAIT_SECURITY_HUD))
			if(!user.stat && user != src)
			//|| !user.canmove || user.restrained()) Fluff: Sechuds have eye-tracking technology and sets 'arrest' to people that the wearer looks and blinks at.
				var/criminal = "None"

				R = find_record("name", perpname, GLOB.data_core.security)
				if(R)
					criminal = R.fields["criminal"]

				. += "<span class='deptradio'>������:</span> <a href='?src=[REF(src)];hud=s;status=1'>\[[criminal]\]</a>"
				. += jointext(list("<span class='deptradio'>�������:</span> <a href='?src=[REF(src)];hud=s;view=1'>\[View\]</a>",
					"<a href='?src=[REF(src)];hud=s;add_crime=1'>\[�������� ���������\]</a>",
					"<a href='?src=[REF(src)];hud=s;view_comment=1'>\[����������� �����������\]</a>",
					"<a href='?src=[REF(src)];hud=s;add_comment=1'>\[�������� �����������\]</a>"), "")
	else if(isobserver(user) && traitstring)
		. += "<span class='info'><b>�����:</b> [traitstring]</span><br>"
	. += "*---------*</span>"

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
