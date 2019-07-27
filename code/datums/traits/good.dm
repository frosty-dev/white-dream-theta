//predominantly positive traits
//this file is named weirdly so that positive traits are listed above negative ones

/datum/quirk/alcohol_tolerance
	name = "Толерантность к Алкоголю"
	desc = "Вы пьянеете медленнее и меньше страдаете от алкоголя."
	value = 1
	mob_trait = TRAIT_ALCOHOL_TOLERANCE
	gain_text = "<span class='notice'>Вы чувствуете, что можете выпить целую бочку!</span>"
	lose_text = "<span class='danger'>Вы больше не чувствуете себя устойчивым к алкоголю.</span>"
	medical_record_text = "Пациент демонстрирует высокую переносимость алкоголя."

/datum/quirk/apathetic
	name = "Апатичный"
	desc = "Вам плевать на всё. Любые события не сильно на вас влияют."
	value = 1
	mood_quirk = TRUE
	medical_record_text = "Пациенту вводили шкалу оценки апатии, но он не удосужился ее завершить."

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
	name = "Лечение Алкоголем"
	desc = "Всякий раз, когда вы пьяны, вы медленно оправляетесь от травм."
	value = 2
	mob_trait = TRAIT_DRUNK_HEALING
	gain_text = "<span class='notice'>Вы чувствуете, что спирт поможет вам излечить свои раны.</span>"
	lose_text = "<span class='danger'>Вы больше не чувствуете, что спирт поможет облегчить вашу боль.</span>"
	medical_record_text = "Пациент имеет необычайно эффективный метаболизм печени и может медленно регенерировать раны, употребляя алкогольные напитки."

/datum/quirk/empath
	name = "Эмпат"
	desc = "Является ли это шестым чувством или тщательным изучением языка тела, достаточно лишь взглянуть на кого-то, чтобы понять, как он себя чувствует."
	value = 2
	mob_trait = TRAIT_EMPATH
	gain_text = "<span class='notice'>Вы чувствуете себя в гармонии с окружающими.</span>"
	lose_text = "<span class='danger'>Вы чувствуете себя изолированным от других.</span>"
	medical_record_text = "Пациент очень восприимчив и чувствителен к социальным сигналам или может иметь ESP. Требуется дальнейшее тестирование."

/datum/quirk/freerunning
	name = "Свободный бег"
	desc = "Ты великолепен в быстрых шагах! Ты можете лазить по столам быстрее."
	value = 2
	mob_trait = TRAIT_FREERUNNING
	gain_text = "<span class='notice'>Вы чувствуете себя легче на ногах!</span>"
	lose_text = "<span class='danger'>Ты снова чувствуешь себя неуклюже.</span>"
	medical_record_text = "Пациент получил высокую оценку на кардио тестах."

/datum/quirk/friendly
	name = "Дружелюбный"
	desc = "Вы даете лучшие объятия, особенно когда вы в правильном настроении."
	value = 1
	mob_trait = TRAIT_FRIENDLY
	gain_text = "<span class='notice'>Вы хотите обнять кого-то.</span>"
	lose_text = "<span class='danger'>Вы больше не чувствуете необходимость обнимать других.</span>"
	mood_quirk = TRUE
	medical_record_text = "Пациент демонстрирует низкое ингибирование физического контакта и неплохо развитые руки. Запрос другого доктора взять на себя это дело."

/datum/quirk/jolly
	name = "Весёлый"
	desc = "Вы иногда просто чувствуете себя счастливым, без всякой причины."
	value = 1
	mob_trait = TRAIT_JOLLY
	mood_quirk = TRUE
	medical_record_text = "Пациент демонстрирует постоянную эутимию, нерегулярную для окружающей среды. Это многовато, если честно."

/datum/quirk/jolly/on_process()
	if(prob(0.05))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "jolly", /datum/mood_event/jolly)

/datum/quirk/light_step
	name = "Легкий Шаг"
	desc = "Вы идете с легким шагом; наступать на острые предметы намного менее болезненно, и вы не оставляете следов позади себя."
	value = 1
	mob_trait = TRAIT_LIGHT_STEP
	gain_text = "<span class='notice'>Вы идете с немного большей гибкостью.</span>"
	lose_text = "<span class='danger'>Ты начинаешь топтаться как варвар.</span>"
	medical_record_text = "Ловкость пациента противоречит сильной способности к скрытности."

/datum/quirk/musician
	name = "Музыкант"
	desc = "Вы можете настроить портативные музыкальные инструменты, чтобы играть мелодии, которые снимают определенные негативные эффекты и успокаивают душу."
	value = 1
	mob_trait = TRAIT_MUSICIAN
	gain_text = "<span class='notice'>Вы знаете всё о музыкальных инструментах.</span>"
	lose_text = "<span class='danger'>Вы забываете, как работают музыкальные инструменты.</span>"
	medical_record_text = "Сканирование мозга пациента показывает высокоразвитый слух."

/datum/quirk/musician/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/choice_beacon/music/B = new(get_turf(H))
	var/list/slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS,
	)
	H.equip_in_one_of_slots(B, slots , qdel_on_fail = TRUE)

/datum/quirk/night_vision
	name = "Ночное Зрение"
	desc = "Вы можете видеть чуть более ясно в полной темноте, чем большинство людей."
	value = 1
	mob_trait = TRAIT_NIGHT_VISION
	gain_text = "<span class='notice'>Тени кажутся немного менее темными.</span>"
	lose_text = "<span class='danger'>Все кажется немного темнее.</span>"
	medical_record_text = "Глаза пациента показывают способность привыкания к темноте."

/datum/quirk/night_vision/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorgan(/obj/item/organ/eyes)
	if(!eyes || eyes.lighting_alpha)
		return
	eyes.Insert(H) //refresh their eyesight and vision

/datum/quirk/photographer
	name = "Фотограф"
	desc = "Вы знаете, как обращаться с камерой, сокращая задержку между каждым снимком."
	value = 1
	mob_trait = TRAIT_PHOTOGRAPHER
	gain_text = "<span class='notice'>Вы знаете все о том как правильно фотографировать.</span>"
	lose_text = "<span class='danger'>Вы забываете, как работают фотоаппараты.</span>"
	medical_record_text = "Пациент упоминает фотографирование как снимающее стресс хобби."

/datum/quirk/photographer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/camera/camera = new(get_turf(H))
	H.put_in_hands(camera)
	H.equip_to_slot(camera, SLOT_NECK)
	H.regenerate_icons()

/datum/quirk/selfaware
	name = "Внимательный к себе"
	desc = "Вы отлично знаете свое тело и можете точно оценить степень своих ран."
	value = 2
	mob_trait = TRAIT_SELF_AWARE
	medical_record_text = "Пациент демонстрирует сверхъестественное умение для самодиагностики."

/datum/quirk/skittish
	name = "Пугливый"
	desc = "Вы можете скрыть себя в опасности. CTRL+SHIFT+клик по закрытому шкафчику, чтобы прыгнуть в него, пока у вас есть доступ."
	value = 2
	mob_trait = TRAIT_SKITTISH
	medical_record_text = "Пациент демонстрирует сильное отвращение к опасности и показывает скрытие в контейнерах из-за страха."

/datum/quirk/spiritual
	name = "Набожный"
	desc = "Вы держите духовную веру, будь то в Бога, в природу или тайные правила вселенной. Вы получаете утешение от присутствия святых людей и верите, что ваши молитвы более особенные, чем другие."
	value = 1
	mob_trait = TRAIT_SPIRITUAL
	gain_text = "<span class='notice'>Вы верите в высшую силу.</span>"
	lose_text = "<span class='danger'>Ты теряешь веру!</span>"
	medical_record_text = "Пациент сообщает о вере в высшую силу."

/datum/quirk/spiritual/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.equip_to_slot_or_del(new /obj/item/storage/fancy/candle_box(H), SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/matches(H), SLOT_IN_BACKPACK)

/datum/quirk/tagger
	name = "Вандал"
	desc = "Вы опытный художник. Рисуя граффити, вы можете получить вдвое больше использований из расходных материалов."
	value = 1
	mob_trait = TRAIT_TAGGER
	gain_text = "<span class='notice'>Вы знаете, как эффективно маркировать стены.</span>"
	lose_text = "<span class='danger'>Вы забываете, как правильно маркировать стены.</span>"
	medical_record_text = "Недавно пациент был замечен на предмет возможного инцидента с краской."

/datum/quirk/tagger/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/toy/crayon/spraycan/spraycan = new(get_turf(H))
	H.put_in_hands(spraycan)
	H.equip_to_slot(spraycan, SLOT_IN_BACKPACK)
	H.regenerate_icons()

/datum/quirk/voracious
	name = "Прожорливый"
	desc = "Ничто не встает между тобой и твоей едой. Вы едите быстрее и можете съесть нездоровую пищу! Быть толстым подходит вам просто отлично."
	value = 1
	mob_trait = TRAIT_VORACIOUS
	gain_text = "<span class='notice'>Вы хотите ЖРАТЬ.</span>"
	lose_text = "<span class='danger'>Вы больше не хотите ЖРАТЬ.</span>"
