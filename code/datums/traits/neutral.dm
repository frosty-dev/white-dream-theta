//traits with no real impact that can be taken freely
//MAKE SURE THESE DO NOT MAJORLY IMPACT GAMEPLAY. those should be positive or negative traits.

/datum/quirk/no_taste
	name = "Потеря вкуса"
	desc = "Вы не чувствуете вкус еды! Токсичная пища все равно отравит вас."
	value = 0
	mob_trait = TRAIT_AGEUSIA
	gain_text = "<span class='notice'>Вы больше не чувствуете вкус еды!</span>"
	lose_text = "<span class='notice'>Вы чувствуете вкусы снова!</span>"
	medical_record_text = "Пациент страдает от агезии и не способен дегустировать пищу или реагенты."

/datum/quirk/vegetarian
	name = "Вегетарианец"
	desc = "Вы находите идею есть мясо морально и физически отталкивающим."
	value = 0
	gain_text = "<span class='notice'>Вы чувствуете отвращение к идее есть мясо.</span>"
	lose_text = "<span class='notice'>Вы чувствуете, что есть мясо не так уж плохо.</span>"
	medical_record_text = "Пациент сообщает о вегетарианской диете."

/datum/quirk/vegetarian/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food &= ~MEAT
	species.disliked_food |= MEAT

/datum/quirk/vegetarian/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		if(initial(species.liked_food) & MEAT)
			species.liked_food |= MEAT
		if(!initial(species.disliked_food) & MEAT)
			species.disliked_food &= ~MEAT

/datum/quirk/pineapple_liker
	name = "Ананасофил"
	desc = "Вы обнаружите, что наслаждаетесь фруктами рода ананас. Кажется, вы никогда не получите достаточно их сладкой мякотки!"
	value = 0
	gain_text = "<span class='notice'>Вы чувствуете сильную тягу к ананасу.</span>"
	lose_text = "<span class='notice'>Ваши чувства к ананасам, кажется, возвращаются к теплой форме.</span>"
	medical_record_text = "Пациент демонстрирует патологическую любовь к ананасу."

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "Ананасофоб"
	desc = "Вы обнаружите, что сильно ненавидите плоды рода ананас. Серьезно, как, черт возьми, кто-нибудь может сказать, что это вкусно? И что за сумасшедший даже посмел бы положить его на пиццу!?"
	value = 0
	gain_text = "<span class='notice'>Вы задумываетесь над тем, какой идиот на самом деле любит ананасы...</span>"
	lose_text = "<span class='notice'>Ваши чувства к ананасам, кажется, возвращаются к теплой форме.</span>"
	medical_record_text = "Пациент думает, что ананасы отвратительны."

/datum/quirk/pineapple_hater/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE

/datum/quirk/deviant_tastes
	name = "Девиантные Вкусы"
	desc = "Вам не нравится еда, которая нравится большинству людей, и вы находите вкусные блюда, которые им не нравятся."
	value = 0
	gain_text = "<span class='notice'>Вы начинаете жаждать чего-то странного на вкус.</span>"
	lose_text = "<span class='notice'>Вам хочется снова есть нормальную еду.</span>"
	medical_record_text = "Пациент демонстрирует нерегулярные предпочтения в питании."

/datum/quirk/deviant_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	var/liked = species.liked_food
	species.liked_food = species.disliked_food
	species.disliked_food = liked

/datum/quirk/deviant_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

/datum/quirk/monochromatic
	name = "Цветовая слепота"
	desc = "Вы страдаете от дальтонизма и воспринимаете почти весь мир в черном и белом."
	value = 0
	medical_record_text = "Пациент страдает почти полным дальтонизмом."

/datum/quirk/monochromatic/add()
	quirk_holder.add_client_colour(/datum/client_colour/monochrome)

/datum/quirk/monochromatic/post_add()
	if(quirk_holder.mind.assigned_role == "Detective")
		to_chat(quirk_holder, "<span class='boldannounce'>Ммм. На этой станции что-то не чисто. Всё в оттенках серого...</span>")
		quirk_holder.playsound_local(quirk_holder, 'sound/ambience/ambidet1.ogg', 50, FALSE)

/datum/quirk/monochromatic/remove()
	if(quirk_holder)
		quirk_holder.remove_client_colour(/datum/client_colour/monochrome)
