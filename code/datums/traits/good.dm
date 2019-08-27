//predominantly positive traits
//this file is named weirdly so that positive traits are listed above negative ones

/datum/quirk/alcohol_tolerance
	name = "������������ � ��������"
	desc = "�� �������� �������� � ������ ��������� �� ����������� ��������."
	value = 1
	mob_trait = TRAIT_ALCOHOL_TOLERANCE
	gain_text = "<span class='notice'>�� ����������, ��� � �������� ������ ������ ����� �������!</span>"
	lose_text = "<span class='danger'>�� ������ �� ���������� ���� ��������� � ��������. ���-��.</span>"
	medical_record_text = "������� ������������� ������� ������������ � ��������."

/datum/quirk/apathetic
	name = "���������"
	desc = "��� ������ ������� �� ��, ��� ��������, � ������� �� ������ �����. ��������, ��� ����� ���� ������ �������� ����� � ����� �����."
	value = 1
	mood_quirk = TRUE
	medical_record_text = "�������� ���� ��������� ��������� ���� ����� ������ ������, �� �� ���� �� ����� �..."

/datum/quirk/apathetic/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier -= 0.2

/datum/quirk/apathetic/remove()
	if(quirk_holder)
		var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
		if(mood)
			mood.mood_modifier += 0.2

/datum/quirk/drunkhealing
	name = "������� �� ��������"
	desc = "������, ����� ��������� ������� ������� �� ������ ��� �������, ��� �� ���������� �� ������� ����. ����� �� �����, �� �������� ����������� �� ���."
	value = 2
	mob_trait = TRAIT_DRUNK_HEALING
	gain_text = "<span class='notice'>�� ����������, ��� �������� ����� �������� ��� ������.</span>"
	lose_text = "<span class='danger'>�� ������ �� ������ �����������, ��� �������� �������� ���� ����.</span>"
	medical_record_text = "������� ����� ��������� ������������� ����������� ������ ������ ��� �� ���, ���������� ����������� �������."

/datum/quirk/empath
	name = "�������"
	desc = "���� �� ������ ��������, ��� ������ ���������� �������� ����� ����, �� ��� ���������� ������� �� ����-������, ����� ������, ��� �� ���������." 
	value = 2
	mob_trait = TRAIT_EMPATH
	gain_text = "<span class='notice'>�� ���������� ���� � �������� � ����, ��� �������� ���.</span>"
	lose_text = "<span class='danger'>�� ���������� ���� �������������� ��� ����.</span>"
	medical_record_text = "������� ����� ����������� � ������������ � ���������� ��������, ��� �������� ����� ��������������� �����������. ���������� ���������� ��������."

/datum/quirk/freerunning
	name = "���������" 
	desc = "�� ������ ������������� �����������! �� ������� ��������� �� �����."
	value = 2
	mob_trait = TRAIT_FREERUNNING
	gain_text = "<span class='notice'>�� ���������� �������� ����� ���!</span>"
	lose_text = "<span class='danger'>�� ���������� ���� ���������.</span>"
	medical_record_text = "������� ������ ������� ���������� ����� � ������-������."

/datum/quirk/friendly
	name = "�����������"
	desc = "�� ������ �����������, �������� ����� � ��� ������� ����������."
	value = 1
	mob_trait = TRAIT_FRIENDLY
	gain_text = "<span class='notice'>�� ������ ����-������ ������.</span>"
	lose_text = "<span class='danger'>�� ������ �� ���������� ������������� �������� ����-��.</span>"
	mood_quirk = TRUE
	medical_record_text = "������� ������������� �������� ������ ����������� ����������� �������� � ������ �������� ����."

/datum/quirk/jolly
	name = "��������"
	desc = "������ �� ���������� ���� ����������, ��� ������� �� �� �������." 
	value = 1
	mob_trait = TRAIT_JOLLY
	mood_quirk = TRUE
	medical_record_text = "������� ������������� ���������� �������, ������������ ��� ���������� �����. ��� ���� ������� �������, ���� ���� �������."

/datum/quirk/jolly/on_process()
	if(prob(0.05))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "jolly", /datum/mood_event/jolly)

/datum/quirk/light_step
	name = "������ ���"
	desc = "�� ������ ���������; ������ ���� ��������� �� ������ ��������, � ��������� ��� ���� �� ����� ����� ������. ����� �� �� ���������� ����� ���� ������."
	value = 1
	mob_trait = TRAIT_LIGHT_STEP
	gain_text = "<span class='notice'>�� ������ � ������� ������� ���������.</span>"
	lose_text = "<span class='danger'>�� ��������� ������ ����� ����, ������ ������.</span>"
	medical_record_text = "�������� �������� ������������ ������� ����������� � ����������."

/datum/quirk/musician
	name = "��������"
	desc = "�� ������ ����������� ����������� ����������� ���, ��� ������� ����� ������� ������������ ���������� ������� � ���������� � ����������� ����."
	value = 1
	mob_trait = TRAIT_MUSICIAN
	gain_text = "<span class='notice'>�� ������ �� � ����������� ������������.</span>"
	lose_text = "<span class='danger'>�� ������, ��� �������� ����������� �����������.</span>"
	medical_record_text = "������������ ����� �������� ���������� �������������� �������� ����."

/datum/quirk/musician/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/choice_beacon/music/B = new(get_turf(H))
	var/list/slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS,
	)
	H.equip_in_one_of_slots(B, slots , qdel_on_fail = TRUE)

/datum/quirk/night_vision
	name = "������ �������"
	desc = "�� ������ ������ ����� ����� � ������ �������, � ������� �� ������."
	value = 1
	mob_trait = TRAIT_NIGHT_VISION
	gain_text = "<span class='notice'>���� ������� ��� ������� ����� �������.</span>"
	lose_text = "<span class='danger'>�� ������� ������� ������.</span>"
	medical_record_text = "����� �������� ���������� ����-������� �������������� � �������."

/datum/quirk/night_vision/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorgan(/obj/item/organ/eyes)
	if(!eyes || eyes.lighting_alpha)
		return
	eyes.Insert(H)

/datum/quirk/photographer
	name = "��������"
	desc = "�� ������, ��� ���������� � �������, � ���������� �������� ����� ������ �������."
	value = 1
	mob_trait = TRAIT_PHOTOGRAPHER
	gain_text = "<span class='notice'>�� ������ �� � ����������������.</span>"
	lose_text = "<span class='danger'>�� ������, ��� �������� ������������.</span>"
	medical_record_text = "������� �������� ���������������� ��� �����, ��������� ������."

/datum/quirk/photographer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/storage/photo_album/photo_album = new(get_turf(H))
	var/list/album_slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS
	)
	H.equip_in_one_of_slots(photo_album, album_slots , qdel_on_fail = TRUE)
	photo_album.persistence_id = "personal_[H.mind.key]" // this is a persistent album, the ID is tied to the account's key to avoid tampering
	photo_album.persistence_load()
	photo_album.name = "\improper [H.real_name]'s photo album"
	var/obj/item/camera/camera = new(get_turf(H))
	var/list/camera_slots = list (
		"neck" = SLOT_NECK,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE,
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS
	)
	H.equip_in_one_of_slots(camera, camera_slots , qdel_on_fail = TRUE)
	H.regenerate_icons()

/datum/quirk/selfaware
	name = "������������"
	desc = "�� ������ ������ ��� ����, � ������ ����� ������� ������� ���������� ��� �����������."
	value = 2
	mob_trait = TRAIT_SELF_AWARE
	medical_record_text = "������� ������������� ����������� ������ ���������������."

/datum/quirk/skittish
	name = "��������"
	desc = "�� ������ �������� ���� �� ���������. �RTL+SHIFT+��� �� ��������� ��������, ���� � ��� ���� � ���� ������."
	value = 2
	mob_trait = TRAIT_SKITTISH
	medical_record_text = "������� ������������� ��������� � ���������, � ��������� ���� ���������� � ������� � ��������� ��-�� ������ ������."

/datum/quirk/spiritual
	name = "�����������"
	desc = "�� ��������������� ����, ����� ����, � ����, � ������� ��� � ������ ������� ���������, �� �� ���������� ���� ���������� �� ����������� ����-�� �������, � ������ � ��, ��� ���� ������� ��������."
	value = 1 	
	mob_trait = TRAIT_SPIRITUAL
	gain_text = "<span class='notice'>������ �� ������ � ������ ����.</span>"
	lose_text = "<span class='danger'>�� ������ �� �������!</span>"
	medical_record_text = "������� �������� � ����� ���� � ����� ����."

/datum/quirk/spiritual/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.equip_to_slot_or_del(new /obj/item/storage/fancy/candle_box(H), SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/matches(H), SLOT_IN_BACKPACK)

/datum/quirk/tagger
	name = "�������"
	desc = "�� ��������� ������� ����������. � ������ ���������� � ������� ���������� ������������� ������������� � ��� ����."
	value = 1
	mob_trait = TRAIT_TAGGER
	gain_text = "<span class='notice'>�� ������, ��� ���������� ����������� ���������.</span>"
	lose_text = "<span class='danger'>�� ������, ��� ��������� ����������� ���������.</span>"
	medical_record_text = "������� ��� ������� ������� �� ���������� �������� �� �����."

/datum/quirk/tagger/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/toy/crayon/spraycan/spraycan = new(get_turf(H))
	H.put_in_hands(spraycan)
	H.equip_to_slot(spraycan, SLOT_IN_BACKPACK)
	H.regenerate_icons()

/datum/quirk/voracious
	name = "�����������"
	desc = "������ �� ������ �� ���� ����� ���� � ����� ����. �� ����� � ��� ���� ������� � ������ ������ ���������� ���������� �����! ���� ������� ��� ����� ��������."
	value = 1
	mob_trait = TRAIT_VORACIOUS
	gain_text = "<span class='notice'>�� ���������� �������� � �������.</span>"
	lose_text = "<span class='danger'>��� �������, ��� ��� ������� ������� ��������.</span>"
